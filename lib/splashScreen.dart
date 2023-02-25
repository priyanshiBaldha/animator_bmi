import 'package:flutter/material.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({Key? key}) : super(key: key);

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cal();
  }

  cal() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xff090e21),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: const Text(
                "BMI Calculator",
                style: TextStyle(
                    color: Colors.pink,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 50),
            const CircularProgressIndicator(
              color: Colors.pink,
            ),
          ],
        ),
      ),
    );
  }
}
