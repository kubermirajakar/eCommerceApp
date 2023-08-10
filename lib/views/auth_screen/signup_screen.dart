import 'package:ecommerceapp/consts/consts.dart';
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
            Column(
              children: [
                customTextfield(
                  title: name,
                  hint: nameHint,
                ),
                customTextfield(
                  title: email,
                  hint: emailHint,
                ),
                customTextfield(
                  title: password,
                  hint: passwordHint,
                ),
                customTextfield(
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
                        text: TextSpan(
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
                commonButton(
                        color: isCheck == true ? redColor : lightGrey,
                        onPress: () {},
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
                  EdgeInsets.all(16),
                )
                .width(context.screenWidth - 70)
                .shadowSm
                .make(),
          ],
        ),
      ),
    ));
  }
}