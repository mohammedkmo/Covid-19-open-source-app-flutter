import 'package:covid19app/icons/myiconsfile.dart';
import 'package:covid19app/style/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Instructions extends StatefulWidget {
  @override
  _InstructionsState createState() => _InstructionsState();
}

class _InstructionsState extends State<Instructions> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(

      backgroundColor: maincolors().maincolor,
      navigationBar: new CupertinoNavigationBar(
        transitionBetweenRoutes: false,
        heroTag: "instructions",
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              MyFlutterApp.chevron_left,
              color: CupertinoColors.white,
              size: 20,
            ),),
        middle: Text(
          "How to Protect Yourself?",
          style: TextStyle(
            color: CupertinoColors.white,
          ),
        ),
        backgroundColor: maincolors().maincolor.withOpacity(0.40),
      ),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: Image(
                  image: AssetImage('imgs/prod.png'),
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                  child: Text(
                "How to Protect Yourself and your family?",
                style: TextStyle(

                    color: CupertinoColors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w800,

                ),
              )),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Stay aware of the latest information on the COVID-19 outbreak, available on the WHO website and through your national and local public health authority. Most people who become infected experience mild illness and recover, but it can be more severe for others. Take care of your health and protect others by doing the following:",
                    style: TextStyle(

                      color: CupertinoColors.white,
                      fontSize: 17,


                    ),
                  )),
              Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.40,

                        child: Text(
                          "Wash your hands frequently",
                          style: TextStyle(

                            color: maincolors().sec_color,
                            fontSize: 23,
                            fontWeight: FontWeight.w800,

                          ),
                        )),
                    Expanded(


                      child: Image(image: AssetImage('imgs/hand.png'),fit: BoxFit.contain,height: 140,),


                    ),
                  ],
                ),
              ),



              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Regularly and thoroughly clean your hands with an alcohol-based hand rub or wash them with soap and water.",
                    style: TextStyle(

                      color: CupertinoColors.white,
                      fontSize: 17,


                    ),
                  )),


              Container(
                padding: EdgeInsets.all(20),

                child: Row(
                  children: <Widget>[
                    Container(
                        width: MediaQuery.of(context).size.width * 0.40,


                        child: Text(
                          "Maintain social distancing",
                          style: TextStyle(

                            color: maincolors().sec_color,
                            fontSize: 23,
                            fontWeight: FontWeight.w800,

                          ),
                        )),
                    Expanded(


                      child: Image(image: AssetImage('imgs/cou.png'),fit: BoxFit.contain,height: 140,),


                    ),
                  ],
                ),
              ),

              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Maintain at least 1 metre (3 feet) distance between yourself and anyone who is coughing or sneezing.",
                    style: TextStyle(

                      color: CupertinoColors.white,
                      fontSize: 17,


                    ),
                  )),

              Container(
                padding: EdgeInsets.all(20),

                child: Row(
                  children: <Widget>[
                    Container(
                        width: MediaQuery.of(context).size.width * 0.40,


                        child: Text(
                          "Avoid touching eyes, nose and mouth",
                          style: TextStyle(

                            color: maincolors().sec_color,
                            fontSize: 23,
                            fontWeight: FontWeight.w800,

                          ),
                        )),
                    Expanded(


                      child: Image(image: AssetImage('imgs/eay.png'),fit: BoxFit.contain,height: 140,),


                    ),
                  ],
                ),
              ),

              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Hands touch many surfaces and can pick up viruses. Once contaminated, hands can transfer the virus to your eyes, nose or mouth. From there, the virus can enter your body and can make you sick.",
                    style: TextStyle(

                      color: CupertinoColors.white,
                      fontSize: 17,


                    ),
                  )),

              Container(
                padding: EdgeInsets.all(20),

                child: Row(
                  children: <Widget>[
                    Container(
                        width: MediaQuery.of(context).size.width * 0.40,


                        child: Text(
                          "Practice respiratory hygiene",
                          style: TextStyle(

                            color: maincolors().sec_color,
                            fontSize: 23,
                            fontWeight: FontWeight.w800,

                          ),
                        )),
                    Expanded(


                      child: Image(image: AssetImage('imgs/good.png'),fit: BoxFit.contain,height: 140,),


                    ),
                  ],
                ),
              ),

              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Make sure you, and the people around you, follow good respiratory hygiene. This means covering your mouth and nose with your bent elbow or tissue when you cough or sneeze. Then dispose of the used tissue immediately.",
                    style: TextStyle(

                      color: CupertinoColors.white,
                      fontSize: 17,


                    ),
                  )),

              Container(
                padding: EdgeInsets.all(20),

                child: Row(
                  children: <Widget>[
                    Container(
                        width: MediaQuery.of(context).size.width * 0.40,


                        child: Text(
                          "If you have fever, cough and difficulty breathing, seek medical care early",
                          style: TextStyle(

                            color: maincolors().sec_color,
                            fontSize: 23,
                            fontWeight: FontWeight.w800,

                          ),
                        )),
                    Expanded(


                      child: Image(image: AssetImage('imgs/care.png'),fit: BoxFit.contain,height: 140,),


                    ),
                  ],
                ),
              ),

              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Stay home if you feel unwell. If you have a fever, cough and difficulty breathing, seek medical attention and call in advance. Follow the directions of your local health authority.",
                    style: TextStyle(

                      color: CupertinoColors.white,
                      fontSize: 17,


                    ),
                  )),


              Container(
                padding: EdgeInsets.all(20),

                child: Text(
                  "Stay informed and follow advice given by your healthcare provider",
                  style: TextStyle(

                    color: maincolors().sec_color,
                    fontSize: 23,
                    fontWeight: FontWeight.w800,

                  ),
                ),
              ),

              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Stay informed on the latest developments about COVID-19. Follow advice given by your healthcare provider, your national and local public health authority or your employer on how to protect yourself and others from COVID-19.",
                    style: TextStyle(

                      color: CupertinoColors.white,
                      fontSize: 17,


                    ),
                  )),

              Container(height: 20,)

            ],
          ),
        ),
      ),
    );
  }
}
