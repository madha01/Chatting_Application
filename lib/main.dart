import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:wechat_app/screen/auth/splash_screen.dart';

import 'firebase_options.dart';

// global obect for accessing device screen size.
late Size mq;
void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]).then((value){_intializeFirebase();
  
  runApp(MaterialApp(home:SplashScreen(),
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    appBarTheme: AppBarTheme( elevation: 1,
    iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20))))

          
  );});}


  
  

_intializeFirebase() async{
  
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  }
   
