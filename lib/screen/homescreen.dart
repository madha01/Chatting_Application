



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wechat_app/model/chat_user.dart';


import '../apis/apis.dart';
import '../main.dart';
import '../widgets/chat_user_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // baar baar list ko intilize nhi krne ke liye humne isko gobal initilize kr diya hai.
   List<Userchat> list =[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(CupertinoIcons.home),
        title: Text('We Chat'),
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.search)),
        IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: FloatingActionButton(onPressed: () async {
            await FirebaseAuth.instance.signOut();
            await GoogleSignIn().signOut();
          },child: Icon(Icons.add_comment_rounded),),
        ),
        body:
        // streambuilder hum use kr rhe hai firebase se data stream krne ke liye. 
        StreamBuilder(
        // stream isliye use krte hai kiu ki - ye btane ke liye data kaha se aa rha hai.
          stream: Apis.firestore.collection('users').snapshots(),
          builder:(context, snapshot) {
          switch(snapshot.connectionState){
            // if data is loading.
            case ConnectionState.waiting:
            case ConnectionState.none:
            return Center(child: CircularProgressIndicator(),);

            //if some or all data is loaded then slow it.
            case ConnectionState.active: // data load ho rha hai.
            case ConnectionState.done: // data load ho chuka hai.

       
           

              final data = snapshot.data?.docs;
              list = data?.map((e) => Userchat.fromJson(e.data())).toList() ??[];
              
            
             if(list.isNotEmpty){
              return ListView.builder(
            itemCount: list.length,
            
            padding: EdgeInsets.only(top:mq.height*.01),
             physics: BouncingScrollPhysics(),
            itemBuilder: (context,Index){
            return
             chatusercard(user: list[Index]);
           // Text('Name: ${list[Index]}');
            
          });
             }
             else{
              return Center(child: Text('No Connection Found! \n😔',style:
              
               TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
                
              ),
              textAlign: TextAlign.center,));
             }

          }
            
         }),
        );
      
  
  }
}