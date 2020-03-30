import 'package:covid19app/icons/myiconsfile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class Single_st extends StatelessWidget {
  final String name;
  final String flag;
  final int cases;
  final int todayCases;
  final int deaths;
  final int todayDeaths;
  final int recovered;
  final int active;
  final int critical;

  Single_st({
    Key key,
    @required this.name,
    this.flag,
    this.cases,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
    this.active,
    this.critical,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (name == null ||
        flag == null ||
        cases == null ||
        deaths == null ||
        todayDeaths == null ||
        recovered == null ||
        todayCases == null) {
      return CupertinoPageScaffold(
        child: Center(child: CupertinoActivityIndicator()),
      );
    } else
      return CupertinoPageScaffold(
        backgroundColor: CupertinoColors.systemBlue,
        navigationBar: new CupertinoNavigationBar(
          transitionBetweenRoutes: false,
          heroTag: "single",
          trailing: GestureDetector(
              onTap: () {



                final RenderBox box = context.findRenderObject();
                Share.share(name,
                    subject: "All cases in " + name +" is: " + cases.toString() + "and new cases today is: " + todayCases.toString() ,
                    sharePositionOrigin:
                    box.localToGlobal(Offset.zero) &
                    box.size);

              },
              child: Icon(
                MyFlutterApp.upload,
                size: 25,
                color: CupertinoColors.white,
              )),
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                MyFlutterApp.chevron_left,
                color: CupertinoColors.white,
                size: 20,
              )),
          middle: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.network(
                flag,
                fit: BoxFit.cover,
                height: 20,
              ),
              Container(
                width: 10,
              ),
              Text(
                name,
                style: TextStyle(
                  color: CupertinoColors.white,
                ),
              ),
            ],
          ),
          backgroundColor: CupertinoColors.inactiveGray.withOpacity(0.10),
        ),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          name,
                          style: TextStyle(
                              color: CupertinoColors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.w700),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          decoration: BoxDecoration(
                              color: CupertinoColors.white,
                              borderRadius: BorderRadius.circular(10),
                              ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "All cases",
                                        style: TextStyle(
                                          color: CupertinoColors.black
                                              .withOpacity(0.7),
                                          fontWeight: FontWeight.w800,
                                          fontSize: 25,
                                        ),
                                      ),
                                      Text(
                                        cases.toString(),
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w700,
                                            color: CupertinoColors.systemRed
                                                .withOpacity(0.8)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: 60,
                                child: Image(
                                  image: AssetImage(
                                    'imgs/covid.png',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                            color: CupertinoColors.white.withOpacity(0.40),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 14, horizontal: 20),
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Today Cases",
                                style: TextStyle(
                                  color:
                                      CupertinoColors.black.withOpacity(0.70),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                decoration: BoxDecoration(
                                  color: CupertinoColors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  todayCases.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: CupertinoColors.activeBlue),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: CupertinoColors.black.withOpacity(0.60),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 14, horizontal: 20),
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Today Deaths",
                                style: TextStyle(
                                  color: CupertinoColors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                decoration: BoxDecoration(
                                  color: CupertinoColors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  todayDeaths.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: CupertinoColors.systemRed),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Total recent statistics",
                    style: TextStyle(
                        color: CupertinoColors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: CupertinoColors.white,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage('imgs/map.png'),
                                fit: BoxFit.cover,
                              )),
                          padding:
                              EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Deaths",
                                style: TextStyle(
                                  color: CupertinoColors.black.withOpacity(0.7),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                decoration: BoxDecoration(
                                  color: CupertinoColors.systemRed.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  deaths.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: CupertinoColors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 20,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: CupertinoColors.white,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage('imgs/map.png'),
                                fit: BoxFit.cover,
                              )),
                          padding:
                              EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Recovered",
                                style: TextStyle(
                                  color: CupertinoColors.black.withOpacity(0.7),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                decoration: BoxDecoration(
                                  color: CupertinoColors.activeGreen.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  recovered.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: CupertinoColors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: CupertinoColors.white,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage('imgs/map.png'),
                                fit: BoxFit.cover,
                              )),
                          padding:
                              EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Active",
                                style: TextStyle(
                                  color: CupertinoColors.black.withOpacity(0.7),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                decoration: BoxDecoration(
                                  color: CupertinoColors.activeBlue.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  active.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: CupertinoColors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 20,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: CupertinoColors.white,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage('imgs/map.png'),
                                fit: BoxFit.cover,
                              )),
                          padding:
                              EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Critical",
                                style: TextStyle(
                                  color: CupertinoColors.black.withOpacity(0.7),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                decoration: BoxDecoration(
                                  color: CupertinoColors.activeOrange.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  critical.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: CupertinoColors.white),
                                ),
                              ),


                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                Container(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      );
  }
}
