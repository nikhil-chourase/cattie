import 'package:cattie/views/screens/add_video_screen.dart';
import 'package:cattie/views/screens/comment_screen.dart';
import 'package:cattie/views/screens/home_screen.dart';
import 'package:cattie/views/screens/loginScreen.dart';
import 'package:cattie/views/screens/videoScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/auth_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    Get.put(AuthService());
  });
  runApp(MyApp());

}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.id,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      routes: {
        LoginScreen.id : (context) => LoginScreen(),
        VideoScreen.id : (context) => VideoScreen(),
        AddVideoScreen.id : (context) => AddVideoScreen(),
        HomeScreen.id : (context) => HomeScreen(),



      },
    );
  }
}
