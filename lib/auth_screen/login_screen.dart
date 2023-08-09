import 'package:ecommerceapp/auth_screen/signup_screen.dart';
import 'package:ecommerceapp/consts/consts.dart';
import 'package:ecommerceapp/consts/socialIconList.dart';
import 'package:ecommerceapp/widgets_common/applogo_widget.dart';
import 'package:ecommerceapp/widgets_common/background_widget.dart';
import 'package:ecommerceapp/widgets_common/common_button.dart';
import 'package:ecommerceapp/widgets_common/custom_textfield.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
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
                  title: email,
                  hint: emailHint,
                ),
                customTextfield(
                  title: password,
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
                commonButton(
                        color: redColor,
                        onPress: () {},
                        textColor: whiteColor,
                        title: signIn)
                    .box
                    .width(context.screenWidth - 50)
                    .make(),
                10.heightBox,
                createNewAccount.text.color(fontGrey).make(),
                10.heightBox,
                commonButton(
                        color: lightGolden,
                        onPress: () {
                          Get.to(() => SignUpScreen());
                        },
                        textColor: redColor,
                        title: signUp)
                    .box
                    .width(context.screenWidth - 50)
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
