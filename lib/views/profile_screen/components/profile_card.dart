import 'package:ecommerceapp/consts/consts.dart';

Widget profileCard({
  width,
  String? value,
  String? title,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      "00".text.bold.size(16).color(darkFontGrey).make(),
      7.heightBox,
      "In your Cart".text.color(darkFontGrey).make(),
    ],
  ).box.white.rounded.height(60).width(width).make();
}
