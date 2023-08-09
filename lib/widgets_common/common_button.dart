import 'package:ecommerceapp/consts/consts.dart';

Widget commonButton({
  Color? color,
  Color? textColor,
  onPress,
  String? title,
}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: color,
    ),
    onPressed: onPress,
    child: title!.text.color(textColor).fontFamily(bold).make(),
  );
}
