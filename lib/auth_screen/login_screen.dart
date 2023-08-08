import 'package:ecommerceapp/consts/consts.dart';
import 'package:ecommerceapp/widgets_common/applogo_widget.dart';
import 'package:ecommerceapp/widgets_common/background_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            applogoWidget(),
            10.heightBox,
            "Log in to $appname".text.white.fontFamily(bold).size(18).make(),
          ],
        ),
      ),
    ));
  }
}
