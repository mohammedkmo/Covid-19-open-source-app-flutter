import 'package:covid19app/api/getby.dart';
import 'package:covid19app/icons/myiconsfile.dart';
import 'package:covid19app/pages/single.dart';
import 'package:flutter/cupertino.dart';


class CasesBy extends StatelessWidget {


  final String sort;
  final String name;



  CasesBy({
    Key key,
    @required this.sort,  this.name,


  }) : super(key: key);


  @override
  void setState(fn) {
    // TODO: implement setState
    setState(() {

      fetchBy();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    initState();

    fetchBy();
  }




  @override
  Widget build(BuildContext context) {
    by = sort;
    return CupertinoPageScaffold(
        navigationBar: new CupertinoNavigationBar(
          transitionBetweenRoutes: false,
          heroTag: "caseby",

          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                MyFlutterApp.chevron_left,
                color: CupertinoColors.label.resolveFrom(context),
                size: 20,
              )),
          middle: Text(
            name + " cases",

            style: TextStyle(
              color: CupertinoColors.label.resolveFrom(context),
            ),
          ),
          backgroundColor: CupertinoColors.inactiveGray.withOpacity(0.10),
        ),
      resizeToAvoidBottomInset: true,
      child: SingleChildScrollView(

       child: SafeArea(
         child: Container(
            margin: EdgeInsets.only(bottom: 20,top: 20),
            child: FutureBuilder(
              future: fetchBy(),
              builder: (context, snapshot) {

                if (snapshot.hasData) {
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: GetList == null ? 0 : 5,
                    itemBuilder: (context, index) {
                      return GestureDetector(

                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => Single_st(
                                name: GetList[index]["country"],
                                flag: GetList[index]["countryInfo"]["flag"],
                                cases: GetList[index]["cases"],
                                todayCases: GetList[index]["todayCases"],
                                deaths: GetList[index]["deaths"],
                                todayDeaths: GetList[index]["todayDeaths"],
                                recovered: GetList[index]["recovered"],
                                active: GetList[index]["active"],
                                critical: GetList[index]["critical"],

                              ),
                            ),
                          );
                        },

                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                          height: 130,
                          decoration: BoxDecoration(
                            color: CupertinoColors.label
                                .resolveFrom(context)
                                .withOpacity(0.1),
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Flexible(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Image.network(GetList[index]["countryInfo"]["flag"], width: 30,),
                                    Container(width: 10, height: 0,),
                                    Flexible(
                                      child: Text(
                                        GetList[index]["country"],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 25,
                                            color: CupertinoColors.label
                                                .resolveFrom(context)),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Container(

                                width: MediaQuery.of(context).size.width,
                                height: 1,
                                color: CupertinoColors.label.resolveFrom(context).withOpacity(0.20),

                              ),
                              Text(
                                GetList[index][sort].toString()+ " "+ name + " cases",
                                style: TextStyle(
                                  fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: CupertinoColors.label.resolveFrom(context)),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Container(
                    width: MediaQuery.of(context).size.width,

                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Icon(
                            MyFlutterApp.warning,
                            size: 100,
                            color: CupertinoColors.label.resolveFrom(context),
                          ),
                          margin: EdgeInsets.only(bottom: 20),),
                        Text(
                          "Please check your internet connection",
                          style: TextStyle(
                              color: CupertinoColors.label.resolveFrom(context),
                              fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }

                // By default, show a loading spinner.
                return Center(
                  child: CupertinoActivityIndicator(),
                );
              },
            ),
          ),
       ),
      )
    );
  }
}
