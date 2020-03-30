import 'package:covid19app/pages/home.dart';
import 'package:flutter/cupertino.dart';


void main() {
  runApp(
    new CupertinoApp(



      debugShowCheckedModeBanner: false,

      title: 'COVID-19 Coronavirus Statistics',

      theme: CupertinoThemeData(


        textTheme: CupertinoTextThemeData(


        ),



      ),


      home: home(),
    ),
  );
}