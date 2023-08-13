import 'package:ecommerceapp/consts/consts.dart';
import 'package:ecommerceapp/views/auth_screen/login_screen.dart';
import 'package:ecommerceapp/views/categories_screen/item_details.dart';
import 'package:ecommerceapp/views/home_screen/home.dart';
import 'package:ecommerceapp/views/home_screen/home_screen.dart';
import 'package:ecommerceapp/views/profile_screen/profile_screen.dart';
import 'package:ecommerceapp/widgets_common/applogo_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  changeScreen() {
    Future.delayed(
      const Duration(
        seconds: 1,
      ),
      () {
        auth.authStateChanges().listen((User? currentUser) {
          if (currentUser == null && mounted) {
            Get.to(() => const LoginScreen());
          } else {
            Get.to(() => Home());
          }
        });
      },
    );
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(icSplashBg, width: 300),
            ),
            10.heightBox,
            applogoWidget(),
            20.heightBox,
            appname.text.bold.white.fontFamily(bold).size(22).make(),
            5.heightBox,
            appversion.text.white.make(),
            const Spacer(),
            credits.text.white.fontFamily(semibold).make(),
            30.heightBox,
          ],
        ),
      ),
    );
  }
}
