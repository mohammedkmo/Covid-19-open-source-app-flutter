import 'dart:ui';

import 'package:covid19app/icons/myiconsfile.dart';
import 'package:covid19app/icons/soshal_icons.dart';
import 'package:covid19app/style/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';


class setting extends StatefulWidget {
  @override
  _settingState createState() => _settingState();
}

_launchGithub() async {
  const url = 'https://github.com/mohammedkmo';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
_launchFacebook() async {
  const url = 'https://www.facebook.com/mohammedkarimeng';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchTweter() async {
  const url = 'https://twitter.com/imohammedkareem';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}


var scr= new GlobalKey();


class _settingState extends State<setting> {



  takescrshot() async {
    RenderRepaintBoundary boundary = scr.currentContext.findRenderObject();
    var image = await boundary.toImage();
    var byteData = await image.toByteData(format: ImageByteFormat.png);
    var pngBytes = byteData.buffer.asUint8List();
    print(pngBytes);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            transitionBetweenRoutes: false,
            heroTag: "appinfo",
            largeTitle: Text("App Info"),
          ),
          SliverFillRemaining(
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  padding: EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Developed by",
                        style: TextStyle(
                            color: CupertinoColors.label.resolveFrom(context)),
                      ),
                      Text(
                        "Mohammed Kareem",
                        style: TextStyle(
                          color: CupertinoColors.label.resolveFrom(context),
                          fontWeight: FontWeight.w700,
                          fontSize: 25,
                        ),
                      ),

                      Container(height: 5,),

                      Text(
                        "Phone number: +9647810094883",
                        style: TextStyle(
                          color: CupertinoColors.label.resolveFrom(context).withOpacity(0.7),
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Column(

                      children: <Widget>[
                        CupertinoButton(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                          color: CupertinoColors.label.resolveFrom(context),
                          onPressed: () {

                            _launchFacebook();

                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[


                              Icon(Soshal.github__1_),

                              Container(width: 10,),


                              Text("Follow me on Github",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17,

                                ),

                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),

                            ],
                          ),
                        ),
                        Container(height: 15,),
                        CupertinoButton(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                          color: maincolors().facebook,
                          onPressed: () {

                            _launchFacebook();

                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[


                              Icon(Soshal.facebook__2_, color: CupertinoColors.white,),

                              Container(width: 10,),


                              Text("Follow me on Facebook",
                                style: TextStyle(
                                  color: CupertinoColors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17,

                                ),

                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),

                            ],
                          ),
                        ),

                        Container(height: 15,),
                        CupertinoButton(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                          color: maincolors().twetter,
                          onPressed: () {

                            _launchTweter();

                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[


                              Icon(Soshal.twitter__1_, color: CupertinoColors.white,),

                              Container(width: 10,),


                              Text("Follow me on Twitter",
                                style: TextStyle(
                                  color: CupertinoColors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17,

                                ),

                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),

                            ],
                          ),
                        ),
                        Container(height: 15,),
                        CupertinoButton(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                          color: maincolors().sec_color,
                          onPressed: () {

                            final RenderBox box = context.findRenderObject();
                            Share.share("download Covid-19 app",
                                subject: "https://covid19.mkareem.dev/",
                                sharePositionOrigin:
                                box.localToGlobal(Offset.zero) &
                                box.size);

                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[


                              Icon(MyFlutterApp.hand, color: CupertinoColors.white,),

                              Container(width: 10,),


                              Text("Share app",
                                style: TextStyle(
                                  color: CupertinoColors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17,

                                ),

                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),

                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
