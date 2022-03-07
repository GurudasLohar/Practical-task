import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tibicle_practical/screens/login_screen.dart';

void main() {
  runApp(const SplashScreen());
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return initWidget(context);
  }

  Widget initWidget(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Color(0xFFA77EEA),
                gradient: LinearGradient(colors: [(Color(0xFF5DC3F0)), Color(
                    0xFF9574E9)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                )
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200, width: 200,
                  child:
                  Image.asset("images/flutter.png"),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}