import 'dart:async';
import 'package:flutter/material.dart';
import 'package:infoapp/screen/SignInPage.dart';
// ignore: camel_case_types
class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

// ignore: camel_case_types
class _splashscreenState extends State<splashscreen> {
   @override
   void initState(){
    super.initState();
    Timer(const Duration(seconds: 3), () =>  Navigator.push(
                      context, 
                    MaterialPageRoute(
                      builder:(context)=> const SignInPage())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.white,
                Color.fromARGB(255, 166, 238, 238),
              ],
            ),
        ),
child:Center(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Info",
                style:TextStyle(
                  fontSize: 66,
                  color: Color.fromARGB(255, 98, 25, 82),
                  fontWeight:FontWeight.w900,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Overpass',
                ))
              ],
            )
          )
      )
    )
    );
  }
}