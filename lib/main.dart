import 'dart:math';

import 'package:flutter/material.dart';
import 'package:media_booster_bmi_calc/splashScreen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash_screen',
      routes: {
        '/': (context) => const home(),
        'splash_screen': (context) => const splash_screen(),
      },
    ),
  );
}

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  double height = 20;
  double weight = 20;
  double age = 10;
  double bmi = 1;

  double value = 0;

  Color mycolor = const Color(0xff1d1e33);
  Color mymalecolor = const Color(0xff1d1e33);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        centerTitle: true,
        backgroundColor: const Color(0xff090e21),
      ),
      backgroundColor: Colors.transparent,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            //female and male//
            Row(
              children: [
                Expanded(
                    child: TweenAnimationBuilder(
                      tween:
                      Tween<Offset>(begin: const Offset(210, 0), end: const Offset(0, 0)),
                      duration: const Duration(milliseconds: 3000),
                      builder: (context, Offset posizon, child) {
                        return Transform.translate(
                          offset: posizon,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                mycolor = Colors.white30;
                                mymalecolor = const Color(0xff1d1e33);
                              });
                            },
                            child: Ink(
                              color: mycolor,
                              child: Container(
                                height: 200,
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    TweenAnimationBuilder(
                                      curve: Curves.bounceOut,
                                      tween: Tween<double>(begin: 0, end: 2 * pi),
                                      duration: const Duration(milliseconds: 3000),
                                      builder: (context, value, child) {
                                        return Transform.rotate(
                                          angle: value,
                                          child: const Icon(Icons.female_sharp,
                                              size: 130, color: Colors.white),
                                        );
                                      },
                                    ),
                                    const Text(
                                      "Famale",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    )),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: TweenAnimationBuilder(
                      tween:
                      Tween<Offset>(begin: Offset(0, 210), end: Offset(0, 0)),
                      duration: Duration(milliseconds: 3000),
                      builder: (context, Offset posizon, child) {
                        return Transform.translate(
                            offset: posizon,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  mycolor = const Color(0xff1d1e33);
                                  mymalecolor = Colors.white54;
                                });
                              },
                              child: Ink(
                                color: mymalecolor,
                                child: Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    children: [
                                      TweenAnimationBuilder(
                                        tween: Tween<double>(begin: 0, end: 2 * pi),
                                        curve: Curves.bounceOut,
                                        duration: const Duration(milliseconds: 3000),
                                        builder: (context, value, child) {
                                          return Transform.rotate(
                                            angle: value,
                                            child: const Icon(Icons.male,
                                                size: 130, color: Colors.red),
                                          );
                                        },
                                      ),
                                      const Text(
                                        "Male",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ));
                      },
                    )),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            //height//
            TweenAnimationBuilder(
              // curve: Curves.bounceOut,
              tween: Tween<Offset>(begin: const Offset(-210, 0), end: const Offset(0, 0)),
              duration: const Duration(milliseconds: 3000),
              builder: (context, Offset posizon, child) {
                return Transform.translate(
                  offset: posizon,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          height: 190,
                          color: const Color(0xff1d1e33),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                "HEIGHT",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "${height.toInt()}",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 50,
                                        ),),
                                    const TextSpan(
                                        text: "   cm",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 20,
                                        ),),
                                  ],
                                ),
                              ),
                              Slider(
                                min: 0,
                                max: 700,
                                activeColor: Colors.pink,
                                inactiveColor: Color(0xff555555),
                                value: height,
                                divisions: 700,
                                onChanged: (val) {
                                  setState(() {
                                    height = val;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            //weight and age//
            Row(
              children: [
                Expanded(
                  child: TweenAnimationBuilder(
                    tween:
                    Tween<Offset>(begin: const Offset(0, 100), end: const Offset(0, 0)),
                    curve: Curves.bounceOut,
                    duration: const Duration(milliseconds: 3000),
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: value,
                        child: Container(
                          height: 200,
                          color: const Color(0xff1d1e33),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Weight",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "${weight.toInt()}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    splashColor: const Color(0xff4c4f4e),
                                    onTap: () {
                                      setState(() {
                                        weight--;
                                      });
                                    },
                                    child: Ink(
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        alignment: Alignment.topCenter,
                                        decoration: const BoxDecoration(
                                          color: Color(0xff4c4f5e),
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Text(
                                          "-",
                                          style: TextStyle(
                                            color: Color(0xfffffff),
                                            fontSize: 40,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    // splashColor: Colors.lightBlue,
                                    onLongPress: () {
                                      setState(() {
                                        weight++;
                                      });
                                    },

                                    onTap: () {
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                    child: Ink(
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        alignment: Alignment.topCenter,
                                        decoration: const BoxDecoration(
                                          color: Color(0xff6e6f7a),
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Text(
                                          "+",
                                          style: TextStyle(
                                            color: Color(0xfff67fa4),
                                            fontSize: 40,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 60,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: TweenAnimationBuilder(
                    tween:
                    Tween<Offset>(begin: const Offset(0, 100), end: const Offset(0, 0)),
                    curve: Curves.bounceOut,
                    duration: const Duration(milliseconds: 3000),
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: value,
                        child: Container(
                          height: 200,
                          color: const Color(0xff1d1e33),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Age",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "${age.toInt()}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                ),
                              ),
                              //age//
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    splashColor: const Color(0xff4c4f4e),
                                    onTap: () {
                                      setState(() {
                                        age--;
                                      });
                                    },
                                    child: Ink(
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        alignment: Alignment.topCenter,
                                        decoration: const BoxDecoration(
                                          color: Color(0xff4c4f5e),
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Text(
                                          "-",
                                          style: TextStyle(
                                            color: Color(0xfffffff),
                                            fontSize: 40,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    // splashColor: Colors.lightBlue,
                                    onTap: () {
                                      setState(() {
                                        age++;
                                      });
                                    },
                                    child: Ink(
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        alignment: Alignment.topCenter,
                                        decoration: const BoxDecoration(
                                          color: Color(0xff6e6f7a),
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Text(
                                          "+",
                                          style: TextStyle(
                                            color: Color(0xfff67fa4),
                                            fontSize: 40,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 60,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            TweenAnimationBuilder(
                tween:
                Tween<Offset>(begin: const Offset(200, 100), end: const Offset(0, 0)),
                duration: const Duration(milliseconds: 3000),
                builder: (context, value, child) => Transform.translate(
                  offset: value,
                  child: Text(
                    "RESULT = ${bmi.toInt()}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                )),
            const SizedBox(height: 35),
            //calculate//
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: 5),
              duration: const Duration(milliseconds: 3000),
              builder: (context, value, child) {
                return Transform.scale(
                  scale: value,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(40),
                    onTap: () {
                      setState(() {
                        value = height / 100;
                        bmi = weight / (value * value);
                      });
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        color: const Color(0xffeb1555),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Container(
                        height: 10,
                        width: 65,
                        alignment: Alignment.center,
                        child: const Text(
                          "Calculator",
                          style: TextStyle(fontSize: 9, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}