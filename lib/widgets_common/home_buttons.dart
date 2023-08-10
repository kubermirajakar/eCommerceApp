import 'package:ecommerceapp/consts/consts.dart';

Widget homeButtons({width, height, icon, onPress, String? title}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        icon,
        width: 26,
      ),
      10.heightBox,
      title!.text.fontFamily(semibold).color(darkFontGrey).make(),
    ],
  ).box.size(width, height).rounded.shadowSm.white.make();
}
