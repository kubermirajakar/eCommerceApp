import 'package:ecommerceapp/consts/List.dart';
import 'package:ecommerceapp/consts/consts.dart';
import 'package:ecommerceapp/controller/auth_controller.dart';

import 'package:ecommerceapp/views/auth_screen/signup_screen.dart';
import 'package:ecommerceapp/views/home_screen/home.dart';
import 'package:ecommerceapp/widgets_common/applogo_widget.dart';
import 'package:ecommerceapp/widgets_common/background_widget.dart';
import 'package:ecommerceapp/widgets_common/common_button.dart';
import 'package:ecommerceapp/widgets_common/custom_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());

    // print(context.screenHeight);
    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.05).heightBox,
            applogoWidget(),
            10.heightBox,
            "Log in to $appname".text.white.fontFamily(bold).size(18).make(),
            10.heightBox,
            Obx(
              () => Column(
                children: [
                  customTextfield(
                    controller: controller.emailController,
                    isPass: false,
                    title: email,
                    hint: emailHint,
                  ),
                  customTextfield(
                      isPass: true,
                      title: password,
                      hint: passwordHint,
                      controller: controller.passwordController),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {},
                      child: forgetPassword.text.make(),
                    ),
                  ),
                  5.heightBox,
                  controller.isLoading.value
                      ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(redColor),
                        )
                      : commonButton(
                          color: redColor,
                          onPress: () async {
                            controller.isLoading(true);
                            await controller
                                .loginMethod(context: context)
                                .then((value) {
                              if (value != null) {
                                VxToast.show(context, msg: loggedIn);
                                Get.offAll(() => Home());
                              } else {
                                controller.isLoading(false);
                              }
                            });
                            // Get.to(() => Home());
                          },
                          textColor: whiteColor,
                          title: signIn,
                        )
                          .box
                          .width(context.screenWidth - 50)
                          .height(context.screenHeight * 0.06)
                          .make(),
                  10.heightBox,
                  createNewAccount.text.color(fontGrey).make(),
                  10.heightBox,
                  commonButton(
                    color: lightGolden,
                    onPress: () {
                      Get.to(() => const SignUpScreen());
                    },
                    textColor: redColor,
                    title: signUp,
                  )
                      .box
                      .width(context.screenWidth - 50)
                      .height(context.screenHeight * 0.06)
                      .make(),
                  10.heightBox,
                  loginWith.text.color(fontGrey).make(),
                  10.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: lightGrey,
                          radius: 25,
                          child: Image.asset(socialIconList[index], width: 30),
                        ),
                      ),
                    ),
                  ),
                ],
              )
                  .box
                  .rounded
                  .white
                  .padding(
                    const EdgeInsets.all(16),
                  )
                  .width(context.screenWidth - 70)
                  .shadowSm
                  .make(),
            ),
          ],
        ),
      ),
    ));
  }
}
