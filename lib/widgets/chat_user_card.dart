import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wechat_app/model/chat_user.dart';

import '../main.dart';

class chatusercard extends StatefulWidget {
  final Userchat user;
  const chatusercard({super.key, required this.user});

  @override
  State<chatusercard> createState() => _chatusercardState();
}

class _chatusercardState extends State<chatusercard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 4,horizontal: mq.width*.04),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      //color: Colors.amber,
      elevation: 0.5,
      child: InkWell(
        onTap: (){},
        child: ListTile(
          leading: CircleAvatar(child: Icon(CupertinoIcons.person),),
          title: Text(widget.user.name),
          subtitle: Text(widget.user.about,maxLines: 1),
          trailing: Text('12:00 PM',style: TextStyle(color: Colors.black54),),
        ),
      ),
    );
  }
}