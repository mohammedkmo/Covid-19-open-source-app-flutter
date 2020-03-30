import 'package:covid19app/api/flags.dart';
import 'package:covid19app/icons/myiconsfile.dart';
import 'package:covid19app/pages/single.dart';
import 'package:flutter/cupertino.dart';


class search extends StatefulWidget {
  @override
  _searchState createState() => _searchState();
}

class _searchState extends State<search> {
  TextEditingController _textController;

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(() {
      fetchFlags();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchFlags();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: true,
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            transitionBetweenRoutes: false,
            automaticallyImplyLeading: false,
            largeTitle: Text("Search"),
            heroTag: "pagesearch",
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              margin: EdgeInsets.only(bottom: 20),
              child: FutureBuilder(
                future: fetchFlags(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: flags == null ? 0 : flags.length,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                margin: EdgeInsets.only(bottom: 10),
                                child: Text(
                                  "Countries sorted by total cases",

                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                      color: CupertinoColors.label
                                          .resolveFrom(context)),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => Single_st(
                                        name: flags[index]["country"],
                                        flag: flags[index]["countryInfo"]
                                            ["flag"],
                                        cases: flags[index]["cases"],
                                        todayCases: flags[index]["todayCases"],
                                        deaths: flags[index]["deaths"],
                                        todayDeaths: flags[index]
                                            ["todayDeaths"],
                                        recovered: flags[index]["recovered"],
                                        active: flags[index]["active"],
                                        critical: flags[index]["critical"],
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  padding: EdgeInsets.symmetric(horizontal: 13),
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: CupertinoColors.label
                                        .resolveFrom(context)
                                        .withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(13),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Flexible(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Flexible(
                                              child: Text(
                                                flags[index]["country"],
                                                style: TextStyle(
                                                    color: CupertinoColors.label
                                                        .resolveFrom(context)),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Icon(
                                        MyFlutterApp.chevron_right,
                                        color: CupertinoColors.label
                                            .resolveFrom(context),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        }

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => Single_st(
                                  name: flags[index]["country"],
                                  flag: flags[index]["countryInfo"]["flag"],
                                  cases: flags[index]["cases"],
                                  todayCases: flags[index]["todayCases"],
                                  deaths: flags[index]["deaths"],
                                  todayDeaths: flags[index]["todayDeaths"],
                                  recovered: flags[index]["recovered"],
                                  active: flags[index]["active"],
                                  critical: flags[index]["critical"],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            padding: EdgeInsets.symmetric(horizontal: 13),
                            height: 50,
                            decoration: BoxDecoration(
                              color: CupertinoColors.label
                                  .resolveFrom(context)
                                  .withOpacity(0.1),
                              borderRadius: BorderRadius.circular(13),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Flexible(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Flexible(
                                        child: Text(
                                          flags[index]["country"],
                                          style: TextStyle(
                                              color: CupertinoColors.label
                                                  .resolveFrom(context)),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  MyFlutterApp.chevron_right,
                                  color: CupertinoColors.label
                                      .resolveFrom(context),
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
                            margin: EdgeInsets.only(bottom: 20),
                          ),
                          Text(
                            "Please check your internet connection",
                            style: TextStyle(
                                color:
                                    CupertinoColors.label.resolveFrom(context),
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
          )
        ],
      ),
    );
  }
}
