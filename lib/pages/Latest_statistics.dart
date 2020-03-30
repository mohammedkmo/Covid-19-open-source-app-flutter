import 'package:covid19app/api/all.dart';
import 'package:covid19app/api/flags.dart';
import 'package:covid19app/icons/myiconsfile.dart';
import 'package:covid19app/pages/casesby.dart';
import 'package:covid19app/pages/instructions.dart';
import 'package:covid19app/style/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class lastest_state extends StatefulWidget {
  @override
  _lastest_stateState createState() => _lastest_stateState();
}

class _lastest_stateState extends State<lastest_state> {
  Future<AllCases> futureCases;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureCases = fetchCases();
  }



  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            transitionBetweenRoutes: false,
            heroTag: "latest",
            largeTitle: Text("Latest Statistics"),

          ),






          SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  FutureBuilder<AllCases>(
                    future: futureCases,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return  Container(
                          margin: EdgeInsets.only(
                              top: 40, left: 20, right: 20, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Text(
                                  "Total global cases",
                                  style: TextStyle(
                                    color: CupertinoColors.label.resolveFrom(context),
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(
                                  color: CupertinoColors.label
                                      .resolveFrom(context)
                                      .withOpacity(0.12),
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage('imgs/map.png'),
                                    fit: BoxFit.cover,
                                  )
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: 14, horizontal: 20),
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "All cases",
                                      style: TextStyle(
                                        color: CupertinoColors.label
                                            .resolveFrom(context)
                                            .withOpacity(0.8),
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
                                        snapshot.data.cases.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: CupertinoColors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: CupertinoColors.systemRed,
                                        borderRadius: BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: AssetImage('imgs/map.png'),
                                            fit: BoxFit.cover,
                                          )
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 5),
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            "Deaths",
                                            style: TextStyle(
                                              color: CupertinoColors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 20,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 10),
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 20),
                                            decoration: BoxDecoration(
                                              color: CupertinoColors.white,
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: Text(
                                              snapshot.data.deaths.toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: CupertinoColors.black),
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
                                        color: CupertinoColors.activeGreen,
                                        borderRadius: BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: AssetImage('imgs/map.png'),
                                            fit: BoxFit.cover,
                                          )
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 5),
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            "Recovered",
                                            style: TextStyle(
                                              color: CupertinoColors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 20,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 10),
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 20),
                                            decoration: BoxDecoration(
                                              color: CupertinoColors.white,
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: Text(
                                              snapshot.data.recovered.toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: CupertinoColors.black),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          color: CupertinoColors.systemRed,
                          padding: EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Icon(
                                  MyFlutterApp.warning,
                                  size: 30,
                                  color: CupertinoColors.label.resolveFrom(context),
                                ),
                                margin: EdgeInsets.only(right: 10),),
                              Flexible(
                                child: Text(
                                  "Please check your internet connection",
                                  style: TextStyle(
                                      color: CupertinoColors.label.resolveFrom(context),
                                      fontWeight: FontWeight.w700),

                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                        );

                      }

                      // By default, show a loading spinner.
                      return Container(
                        margin: EdgeInsets.only(
                            top: 40, left: 20, right: 20, bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              width: 150,
                              height: 30,
                              decoration: BoxDecoration(
                                color: CupertinoColors.label
                                    .resolveFrom(context)
                                    .withOpacity(0.20),
                                borderRadius: BorderRadius.circular(10),
                              ),

                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 20),
                              decoration: BoxDecoration(
                                color: CupertinoColors.label
                          .resolveFrom(context)
                          .withOpacity(0.12),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 14, horizontal: 20),
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(

                                    width: 120,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: CupertinoColors.label
                                          .resolveFrom(context)
                                          .withOpacity(0.20),
                                      borderRadius: BorderRadius.circular(10),
                                    ),

                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    decoration: BoxDecoration(
                                      color: CupertinoColors.label
                                          .resolveFrom(context)
                                          .withOpacity(0.12),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      "    ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: CupertinoColors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: CupertinoColors.label
                                          .resolveFrom(context)
                                          .withOpacity(0.12),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 5),
                                    child: Column(
                                      children: <Widget>[
                                        Container(

                                          width: 100,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: CupertinoColors.label
                                                .resolveFrom(context)
                                                .withOpacity(0.20),
                                            borderRadius: BorderRadius.circular(10),
                                          ),

                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 10),
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 20),
                                          decoration: BoxDecoration(
                                            color: CupertinoColors.label
                                                .resolveFrom(context)
                                                .withOpacity(0.12),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Text(
                                            "      ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                color: CupertinoColors.black),
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
                                      color: CupertinoColors.label
                                          .resolveFrom(context)
                                          .withOpacity(0.12),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 5),
                                    child: Column(
                                      children: <Widget>[
                                        Container(

                                          width: 100,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: CupertinoColors.label
                                                .resolveFrom(context)
                                                .withOpacity(0.20),
                                            borderRadius: BorderRadius.circular(10),
                                          ),

                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 10),
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 20),
                                          decoration: BoxDecoration(
                                            color: CupertinoColors.label
                                                .resolveFrom(context)
                                                .withOpacity(0.12),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Text(
                                            "     ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                color: CupertinoColors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),



                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Top 5 countries by",
                            style: TextStyle(
                              color: CupertinoColors.label.resolveFrom(context),
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          margin: EdgeInsets.only(bottom: 10, top: 20),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: CupertinoColors.systemFill.withOpacity(0.2),
                            borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(20.0),
                              topRight: const Radius.circular(20.0),
                            ),
                          ),
                          child: Column(
                            children: <Widget>[
                              CupertinoButton(
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                              color:
                                                  CupertinoColors.activeOrange,
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      5.0),
                                            ),
                                            child: Icon(
                                              MyFlutterApp.warning,
                                              color: CupertinoColors.white,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 10),
                                            child: Text(
                                              'Affected Cases',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: CupertinoColors.label
                                                      .resolveFrom(context),
                                                  fontSize: 17),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        child: Icon(
                                          CupertinoIcons.forward,
                                          color: CupertinoColors.label
                                              .resolveFrom(context),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onPressed: () {


                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => CasesBy(
                                          sort: "cases",
                                          name: "Affected"

                                      ),
                                    ),
                                  );

                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          width: MediaQuery.of(context).size.width * 0.90,
                          color: CupertinoColors.label
                              .resolveFrom(context)
                              .withOpacity(0.2),
                          alignment: Alignment.centerRight,
                        ),
                        Container(

                          decoration: BoxDecoration(
                            color: CupertinoColors.systemFill.withOpacity(0.2),
                          ),
                          child: Column(
                            children: <Widget>[
                              CupertinoButton(
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                              color:
                                                  CupertinoColors.activeGreen,
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      5.0),
                                            ),
                                            child: Icon(
                                              MyFlutterApp.checkmark_cicle,
                                              color: CupertinoColors.white,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 10),
                                            child: Text(
                                              'Recovered Cases',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: CupertinoColors.label
                                                      .resolveFrom(context),
                                                  fontSize: 17),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        child: Icon(
                                          CupertinoIcons.forward,
                                          color: CupertinoColors.label
                                              .resolveFrom(context),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onPressed: () {

                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => CasesBy(
                                        sort: "recovered",
                                        name: "Recovered"

                                      ),
                                    ),
                                  );



                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          width: MediaQuery.of(context).size.width * 0.90,
                          color: CupertinoColors.label
                              .resolveFrom(context)
                              .withOpacity(0.2),
                          alignment: Alignment.centerRight,
                        ),
                        Container(

                          decoration: BoxDecoration(
                            color: CupertinoColors.systemFill.withOpacity(0.2),
                            borderRadius: new BorderRadius.only(
                              bottomRight: const Radius.circular(20.0),
                              bottomLeft: const Radius.circular(20.0),
                            ),
                          ),
                          child: Column(
                            children: <Widget>[
                              CupertinoButton(
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                              color: CupertinoColors.systemRed,
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      5.0),
                                            ),
                                            child: Icon(
                                              MyFlutterApp.heart_pulse,
                                              color: CupertinoColors.white,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 10),
                                            child: Text(
                                              'Deaths cases',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: CupertinoColors.label
                                                      .resolveFrom(context),
                                                  fontSize: 17),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        child: Icon(
                                          CupertinoIcons.forward,
                                          color: CupertinoColors.label
                                              .resolveFrom(context),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onPressed: () {

                                  Navigator.push(

                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => CasesBy(
                                          sort: "deaths",
                                          name: "Deaths"

                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Text(
                            "How to Protect Yourself?",
                            style: TextStyle(
                              color: CupertinoColors.label.resolveFrom(context),
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          margin: EdgeInsets.only(bottom: 10, top: 30),
                        ),
                        GestureDetector(

                          onTap: (){

                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => Instructions(),
                              ),
                            );

                          },


                          child: Container(
                            decoration: BoxDecoration(
                              color: maincolors().maincolor,
                              borderRadius: new BorderRadius.circular(20.0),

                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Container(
                                    height: 200,
                                    child: Image(
                                      image: AssetImage('imgs/mansick.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(
                                        MyFlutterApp.book,
                                        color: maincolors().sec_color,
                                      ),
                                      Container(
                                        width: 200,
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 10),
                                        child: Text(
                                          "Read it all...",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: maincolors().sec_color,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            height: 300,
                          ),
                        ),
                        Container(
                          height: 100,
                        )
                      ],
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
