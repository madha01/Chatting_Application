

import 'package:flutter/material.dart';

class Dialogs{
static void showSnackbar(BuildContext context,String msg){
  // humko snackbar ke liye scaffoldmessenger use krna hota hai.
  // scaffolmessenger m context hota hai isko hum showsnackbar m buildcontext context define krte hai.
  // ye msg vo hai jo user show krwana chahta hai when some error occur.
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg),behavior: SnackBarBehavior.floating,));
  // snackbar ka mtlb hota hai ki ek popup genrate ho jb humare app m kuch error occur ho.
}
static void showloading(BuildContext context){
  showDialog(context: context, builder:(_)=>Center(child: CircularProgressIndicator()));
}
}