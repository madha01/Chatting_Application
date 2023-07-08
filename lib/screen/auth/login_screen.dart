import 'dart:io';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wechat_app/helper/dialogs.dart';
import 'package:wechat_app/main.dart';
import 'package:wechat_app/screen/homescreen.dart';

class loginscreen extends StatefulWidget {
  const loginscreen({super.key});

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  bool _isAnimate = false;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 500),(){
      setState(() {
        _isAnimate = true;
      });
    });
  }
  _handleGoogleClick(){
    //for showing progress bar.
    Dialogs.showloading(context);
    _signInWithGoogle().then((user) {
      // for hiding progress bar.
      Navigator.pop(context);
      if(user!=null){
         print('\n User: ${user.user}');
      print('\n UserAdditionalInfo: ${user.additionalUserInfo}');
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> HomeScreen()));
      }
     
    });

  }
 

Future<UserCredential?> _signInWithGoogle() async {
  // Trigger the authentication flow
  
  try{
    await InternetAddress.lookup('google.com');
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);}
  catch(e){
    print('\n_signInWithGoogle: $e');
    Dialogs.showSnackbar(context, "Somethings wents wrong [Check your Internet!]");
    return null;

  }
}
  @override
  Widget build(BuildContext context) {
    // mediaquery initilize.
    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 233, 228, 145),
        title: Text("Welcome To We Chat"),
      ),
      body: 
      
      Container(decoration: BoxDecoration(
        color: const Color.fromARGB(255, 248, 238, 144)
      ),
        child: Stack(
          children: [
            AnimatedPositioned(
             top: mq.height * .15,
             width: mq.width * .5,
             right: _isAnimate ? mq.width * .25 : -mq.width * .5,
              duration: Duration(seconds: 1),
              child: Image.asset("images/wechat.png")),
              AnimatedPositioned(
             bottom: mq.height * .15,
             width: mq.width * .9,
             right: _isAnimate? mq.width * .05: -mq.width* .9,
             height: mq.height * .06,
             duration: Duration(seconds: 1),
            
             
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 195, 243, 140),
                  shape: StadiumBorder()
                ),
                onPressed:() {
                  _handleGoogleClick();
                },
              icon: Image.asset("images/google3.png.png",height: mq.height*.03,),
              label: RichText(text: TextSpan(
                style: TextStyle(color: Colors.black,fontSize: 16),
                children:[
                  TextSpan(text: "Sign In With"),
                  TextSpan(text: ' Google',
                  style: TextStyle(fontWeight: FontWeight.w500))
                ]
              ),)),
              )
          ],
        ),
      ),
    );
  }
}