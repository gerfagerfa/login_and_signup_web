import 'package:flutter/material.dart';
import 'package:login_and_signup_web/constants.dart';
import 'package:login_and_signup_web/login.dart';
import 'package:login_and_signup_web/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Option selectedOption = Option.LogIn;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    print(size.height);
    print(size.width);

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [

            Row(
              children: [
                Container(
                  height: double.infinity,
                  width: size.width / 2,
                  color: Color(0xFFFE4350),
                ),
                Container(
                  height: double.infinity,
                  width: size.width / 2,
                  color: Colors.white
                ),
              ],
            ),

            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Text(
                  "Welcome",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      "Let's Kick Now !",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      "It's easy and takes less than 30 seconds",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),

                  ],
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Row(
                  children: [

                    Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.white,
                      size: 28,
                    ),

                    SizedBox(
                      width: 8,
                    ),

                    Text(
                      "HOME",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),

                  ],
                ),
              ),
            ),

            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Icon(
                  Icons.menu,
                  color: Color(0xFFFE4350),
                  size: 28,
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    Icon(
                      Icons.copyright,
                      color: Colors.grey,
                      size: 24,
                    ),

                    SizedBox(
                      width: 8,
                    ),

                    Text(
                      "Copyright 2020",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),

                  ],
                ),
              ),
            ),

            AnimatedSwitcher(
              duration: Duration(milliseconds: 500),

              //Animation 1
              /*transitionBuilder: (widget, animation) => RotationTransition(
                turns: animation,
                child: widget,
              ),*/
              //switchOutCurve: Curves.easeInOutCubic,
              //switchInCurve: Curves.fastLinearToSlowEaseIn,

              //Animation 2
              transitionBuilder: (Widget child, Animation<double> animation) => ScaleTransition(child: child, scale: animation),

              child: selectedOption == Option.LogIn
              ? LogIn(
                onSignUpSelected: () {
                  setState(() {
                    print("vamos al signup");
                    selectedOption = Option.SignUp;
                  });
                },
              )
              : SignUp(
                onLogInSelected: () {
                  setState(() {
                    print("vamos al login");
                    selectedOption = Option.LogIn;
                  });
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}