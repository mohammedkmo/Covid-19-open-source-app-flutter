import 'package:covid19app/pages/Latest_statistics.dart';
import 'package:covid19app/pages/search.dart';
import 'package:covid19app/pages/setting.dart';
import 'package:covid19app/style/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid19app/icons/myiconsfile.dart';


class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}



int _currentIndex = 0;
PageController _pageController;

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {

    return CupertinoTabScaffold(



      tabBar: CupertinoTabBar(




        activeColor: CupertinoColors.destructiveRed,

        inactiveColor: CupertinoColors.label,



        items: [
          BottomNavigationBarItem(

            icon: Icon(MyFlutterApp.earth, size: 24,),
            title: Text("latest Statistics"),



          ),
          BottomNavigationBarItem(

            icon: Icon(MyFlutterApp.magnifier, size: 24,),
              title: Text("Search")

          ),

          BottomNavigationBarItem(

              icon: Icon(MyFlutterApp.question_circle, size: 24,),
              title: Text("App Info")

          ),


        ],

      ) ,


      tabBuilder: (context,index){

        if(index == 0){

          return lastest_state();
        }else if(index == 1){

          return search();
        }


      else  return setting();

      },
    );
  }
}
