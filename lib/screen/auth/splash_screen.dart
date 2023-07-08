import 'dart:async';


import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:wechat_app/main.dart';
import 'package:wechat_app/screen/auth/login_screen.dart';
import 'package:wechat_app/screen/homescreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<SplashScreen> {
  void initState(){
     Future.delayed(const Duration(seconds: 3),(){;
     if(FirebaseAuth.instance.currentUser != null){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> HomeScreen()));
     }
     else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> loginscreen()));
     }
  });}
  
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
     return Scaffold(
        
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topLeft,end: Alignment.bottomRight,colors: [Colors.red,Colors.white,Colors.green])
          ),
          child: Stack(children: [Positioned(
            top: mq.height* .15,
            right: mq.width* .25,
            width: mq.width* .5,
            child: Image.asset('images/phone.png')),
          Positioned(
            bottom: mq.height*.15,
            width: mq.width,
            child: Text("WELCOME TO OUR APP ❤️",
            style: TextStyle(fontSize: 20,
            ),
            textAlign: TextAlign.center,))
          ],
          
          
          ),
        ),
        
        

    );
  }
}