import 'package:ecommerceapp/consts/consts.dart';
import 'package:ecommerceapp/views/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyApAPzK9BVe67444gsXzRNs4jlJEX5Sn4s",
        appId:
            "754983928283-kf6u7k8od65u0q47fv20lfcdjuibklbg.apps.googleusercontent.com",
        messagingSenderId: "",
        projectId: "ecommerceapp-a27db",
      ),
    );
  } catch (e) {}
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //     options: FirebaseOptions(
  //   apiKey: "AIzaSyApAPzK9BVe67444gsXzRNs4jlJEX5Sn4s",
  //   appId:
  //       "754983928283-kf6u7k8od65u0q47fv20lfcdjuibklbg.apps.googleusercontent.com",
  //   messagingSenderId: "",
  //   projectId: "ecommerceapp-a27db",
  // ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: darkFontGrey,
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        fontFamily: regular,
      ),
      home: SplashScreen(),
    );
  }
}
