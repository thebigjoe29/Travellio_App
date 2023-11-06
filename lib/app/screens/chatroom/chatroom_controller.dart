import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
class Chatroomcontroller extends GetxController{
  FirebaseFirestore storeInstance=FirebaseFirestore.instance;
  var radius = Radius.circular(30);
  FirebaseAuth auth=FirebaseAuth.instance;
  
}