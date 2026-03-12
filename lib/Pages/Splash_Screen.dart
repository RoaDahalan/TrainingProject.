import 'package:flutter/material.dart';
import 'package:training_project/Pages/SecondScreen.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {


  @override
  void initState() {

    super.initState();

    Future.delayed(Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Secondscreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFE9C75E),
              Color(0xFFAF8344),
          ]
        ),
      ),

        child: Stack(
          children: [
            Positioned(
              top: 190,
              left: 118,
              right: -32,
              child: Opacity(
                opacity: 0.52,
                  child: Image.asset('assets/Pattern_bg.png',
                    width: 257,
                    height: 432,
                  )
              ),
            ),

            Positioned(
              top: 311,
              left: 118.67,
              right: 91,
              child: Image.asset('assets/Occasion_logo.png',
                width: 138.26953125,
                height: 162.8633270263672,
              ),
            ),

            // Center(
            //     child: Image.asset('assets/Occasion_logo.png')
            // ),
          ]
        ),
    ),
    );
  }
}
