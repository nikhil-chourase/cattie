


import 'package:cattie/views/screens/add_video_screen.dart';
import 'package:cattie/views/screens/profile_screen.dart';
import 'package:cattie/views/screens/search_screen.dart';
import 'package:cattie/views/screens/videoScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

import 'controllers/auth_controller.dart';


 List pages = [
  VideoScreen(),
  SearchScreen(),
  AddVideoScreen(),
  Text('message Screen'),
  ProfileScreen(uid: authService.user.uid,),

];

final FirebaseAuth auth = FirebaseAuth.instance;

final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
final FirebaseFirestore firestore = FirebaseFirestore.instance;

// CONTROLLER
var authService = AuthService.instance;

