import 'package:ecommerceapp/consts/consts.dart';
import 'package:ecommerceapp/controller/auth_controller.dart';
import 'package:ecommerceapp/views/home_screen/home.dart';
import 'package:ecommerceapp/widgets_common/applogo_widget.dart';
import 'package:ecommerceapp/widgets_common/background_widget.dart';
import 'package:ecommerceapp/widgets_common/common_button.dart';
import 'package:ecommerceapp/widgets_common/custom_textfield.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool? isCheck = false;
  var controller = Get.put(AuthController());

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                    controller: nameController,
                    isPass: false,
                    title: name,
                    hint: nameHint,
                  ),
                  customTextfield(
                    controller: emailController,
                    isPass: false,
                    title: email,
                    hint: emailHint,
                  ),
                  customTextfield(
                    controller: passwordController,
                    isPass: true,
                    title: password,
                    hint: passwordHint,
                  ),
                  customTextfield(
                    isPass: true,
                    controller: passwordRetypeController,
                    title: reTypePassword,
                    hint: passwordHint,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {},
                      child: forgetPassword.text.make(),
                    ),
                  ),
                  5.heightBox,
                  Row(
                    children: [
                      Checkbox(
                        activeColor: redColor,
                        value: isCheck,
                        onChanged: (newValue) {
                          setState(() {
                            isCheck = newValue;
                          });
                        },
                        checkColor: whiteColor,
                      ),
                      5.widthBox,
                      Expanded(
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "I agree to the ",
                                style: TextStyle(
                                  fontFamily: bold,
                                  color: fontGrey,
                                ),
                              ),
                              TextSpan(
                                text: termsAndCondition,
                                style: TextStyle(
                                  fontFamily: bold,
                                  color: redColor,
                                ),
                              ),
                              TextSpan(
                                text: " & ",
                                style: TextStyle(
                                  fontFamily: bold,
                                  color: fontGrey,
                                ),
                              ),
                              TextSpan(
                                text: privacyPolicy,
                                style: TextStyle(
                                  fontFamily: bold,
                                  color: redColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  10.heightBox,
                  controller.isLoading.value
                      ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(redColor),
                        )
                      : commonButton(
                              color: isCheck == true ? redColor : lightGrey,
                              onPress: () async {
                                controller.isLoading(true);
                                if (isCheck != false) {
                                  try {
                                    await controller
                                        .signUpMethod(
                                            context: context,
                                            email: emailController.text,
                                            password: passwordController.text)
                                        .then((value) =>
                                            controller.storeUserData(
                                              email: emailController.text,
                                              name: nameController.text,
                                              password: passwordController.text,
                                            ))
                                        .then((value) {
                                      VxToast.show(
                                        context,
                                        msg: loggedIn,
                                      );
                                      Get.off(() => Home());
                                    });
                                  } catch (e) {
                                    auth.signOut();
                                    VxToast.show(context, msg: e.toString());
                                    controller.isLoading(false);
                                  }
                                }
                              },
                              textColor: whiteColor,
                              title: signUp)
                          .box
                          .width(context.screenWidth - 50)
                          .height(context.screenHeight * 0.06)
                          .make(),
                  10.heightBox,
                  // RichText(
                  //   text: TextSpan(
                  //     children: [
                  //       TextSpan(
                  //         text: alreadyHaveAccount,
                  //         style: TextStyle(
                  //           fontFamily: bold,
                  //           color: fontGrey,
                  //         ),
                  //       ),
                  //       TextSpan(
                  //         text: signIn,
                  //         style: TextStyle(
                  //           fontFamily: bold,
                  //           color: redColor,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ).onTap(() {
                  //   Get.back();
                  // })
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      alreadyHaveAccount.text.color(fontGrey).make(),
                      signIn.text.color(redColor).make().onTap(() {
                        Get.back();
                      })
                    ],
                  )
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
