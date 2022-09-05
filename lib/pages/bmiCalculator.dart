import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_localization_master/classes/language.dart';
import 'package:flutter_localization_master/localization/language_constants.dart';
import 'package:flutter_localization_master/main.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:flutter/material.dart';

class bmi extends StatefulWidget {
  @override
  _bmiState createState() => _bmiState();
}

class _bmiState extends State<bmi> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);
  }

  void _showSuccessDialog() {
    showTimePicker(context: context, initialTime: TimeOfDay.now());
  }
  String funny;
  String funny1;
  String funny2;
  String funny3;
  String funny4;
  String funny5;

  bool isMale = true;
  int age = 30;
  int weight = 75;
  double height = 165;
  double prefectWeight;
  var bmi;
  String bodyState;
  String wordWeight;
  double RemaingWeight;
  String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: Text(
          "${getTranslated(context, "title")}",
          style: TextStyle(color: Colors.grey),
        ),
        actions: <Widget>[
          DropdownButton<Language>(
            dropdownColor: Colors.grey,
            underline: SizedBox(),
            icon: Icon(
              Icons.language,
              color: Colors.grey,
              size: 28,
            ),
            onChanged: (Language language) {
              _changeLanguage(language);
            },
            items: Language.languageList()
                .map<DropdownMenuItem<Language>>(
                  (e) => DropdownMenuItem<Language>(
                    value: e,
                    child: Center(
                        child: Text(
                      e.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                  ),
                )
                .toList(),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.male,
                              size: 100,
                              color: isMale ? Colors.red : Colors.grey,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "${getTranslated(context, "Male")}",
                              style: TextStyle(
                                fontSize: 20,
                                color: isMale ? Colors.red : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.female,
                              size: 100,
                              color: !isMale ? Colors.red : Colors.grey,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "${getTranslated(context, "Female")}",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: !isMale ? Colors.red : Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.withOpacity(0.2),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${getTranslated(context, "Height")}",
                    style: TextStyle(color: Colors.grey, fontSize: 40),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "${height.round()}",
                        style: TextStyle(color: Colors.grey, fontSize: 40),
                      ),
                      Text(
                        "${getTranslated(context, "cm")}",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Slider(
                      activeColor: Colors.red,
                      inactiveColor: Colors.grey,
                      value: height,
                      max: 250,
                      min: 150,
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                      })
                ],
              ),
            ),
          )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.withOpacity(0.2)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${getTranslated(context, "Age")}",
                          style: TextStyle(color: Colors.grey, fontSize: 25),
                        ),
                        Text(
                          "${age}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: Icon(Icons.add),
                              mini: true,
                              backgroundColor: Colors.red,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              child: Icon(Icons.remove),
                              mini: true,
                              backgroundColor: Colors.red,
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.withOpacity(0.2)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${getTranslated(context, "Weight")}",
                          style: TextStyle(color: Colors.grey, fontSize: 25),
                        ),
                        Text(
                          "${weight}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: Icon(Icons.add),
                              mini: true,
                              splashColor: Colors.white,
                              backgroundColor: Colors.red,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              child: Icon(Icons.remove),
                              mini: true,
                              splashColor: Colors.white,
                              backgroundColor: Colors.red,
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.red,
            ),
            height: 55,
            child: MaterialButton(
              onPressed: () {
                setState(() {
                  bmi = weight / pow(height / 100, 2);
                  isMale
                      ? prefectWeight = 48 + 1.1 * (height - 150)
                      : prefectWeight = 45.5 + 0.9 * (height - 150);
                });
                showDialog();
                if (weight > prefectWeight) {
                  setState(() {
                    wordWeight =
                        "${getTranslated(context, "intro")}${prefectWeight.round()}Kg\n${getTranslated(context, "lose")}${(weight - prefectWeight).round()}Kg";
                         funny="مالفرق بينك وبين الفيل؟";
                         funny1="خس شويه يا تخين";
                         funny2="مارس رياضه ياتخين";
                         funny3="يا واد ياتقيل خس شويه";
                         funny4=" وزنك ${weight} ايه ده كله فيل  ";
                         funny5 ="اعمل رجيم روح جيم هتموت ياتخين";

                  });
                } else if (weight < prefectWeight) {
                  wordWeight =
                  "${getTranslated(context, "intro")}${prefectWeight.round()}Kg\n${getTranslated(context, "gain")} ${(prefectWeight - weight).round()}Kg";
                  funny="هتموت بامعضم كل كتير";
                  funny1="روح جيم يا نحيف";
                  funny2="امشي من قدامي وانت شبه المومياء";
                  funny3="مالفرق بينك وبين الهيكل العظمي";
                  funny4=" وزنك ${weight}ولا وزن طفل   ";
                  funny5 ="انا بنصحك وانت حر ومع ستين الف داهيه";

                }

                if (bmi < 15.0) {
                  setState(() {
                    bodyState = "${getTranslated(context, "Very Very Skinny")}";
                    image = "assets/images/1.png";
                  });
                } else if (bmi < 16) {
                  setState(() {
                    bodyState =
                        " ${getTranslated(context, "Severe Weight Loss")}";
                    image = "assets/images/2.png";
                  });
                } else if (bmi < 18.5) {
                  setState(() {
                    bodyState = " ${getTranslated(context, "Weight Loss")}";
                    image = "assets/images/3.png";
                  });
                } else if (bmi < 25) {
                  setState(() {
                    bodyState = " ${getTranslated(context, "Healthy Weight")}";
                    image = "assets/images/4.png";
                  });
                } else if (bmi < 30) {
                  setState(() {
                    bodyState =
                        " ${getTranslated(context, "Icrease in Weight")}";
                    image = "assets/images/5.png";
                  });
                } else if (bmi < 35) {
                  setState(() {
                    bodyState =
                        " ${getTranslated(context, "First Degree obesity")}";
                    image = "assets/images/6.jpg";
                  });
                } else if (bmi < 40.0) {
                  setState(() {
                    bodyState =
                        " ${getTranslated(context, "Second Degree obesity")}";
                    image = "assets/images/7.jpg";
                  });
                } else {
                  setState(() {
                    bodyState = " ${getTranslated(context, "TOO OBASE")}";
                    image = "assets/images/8.png";
                  });
                }
              },
              child: Text(
                '${getTranslated(context, "Calculate")}',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  void showDialog() {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [

                  Container(
                    height: 400,
                    width: double.infinity,
                    margin:
                        EdgeInsets.only(bottom:30, left: 12, right: 12, top: 80),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 85,
                        ),
                        Text(
                         "${getTranslated(context, "Body Condition")}",
                          style: TextStyle(
                              color: Colors.red,
                              decoration: TextDecoration.none,
                              fontSize: 20),
                        ),
                        Text("$bodyState", style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          decoration: TextDecoration.none,),),

                        SizedBox(
                          height: 13,
                        ),
                        Text(
                          "BMI=${bmi.round()}",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            decoration: TextDecoration.none,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 13,
                        ),
                        Text(
                          "$wordWeight",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.normal
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 13,
                        ),


                      ],
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 165,
                        height: 165,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(90.0)),
                          color: Colors.black87,
                        ),
                      ),
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(90.0)),
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(80.0)),
                          color: Colors.grey.withOpacity(0.2),
                          image: DecorationImage(image: AssetImage(image)),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
             Stack(
               alignment: Alignment.center,
                children: [
                  Container(
                    height: 75,
                    width: 325,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.black87
                    ),),
                  Container(
                    height: 60,
                    width: 310,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.grey
                    ),
                    child: DefaultTextStyle(
                        style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                        ),
                        child: AnimatedTextKit(
                          repeatForever: true,
                          animatedTexts: [
                            RotateAnimatedText(funny),
                            RotateAnimatedText(funny4),
                            RotateAnimatedText(funny1),
                            RotateAnimatedText(funny2),
                            RotateAnimatedText(funny3),
                            RotateAnimatedText(funny5),

                          ],
                        )
                    ),


                  ),
                ],
              ),
            ],
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }
}
