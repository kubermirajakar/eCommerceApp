import 'package:ecommerceapp/consts/consts.dart';

Widget customTextfield(
    {String? title,
    String? hint,
    TextEditingController? controller,
    bool? isPass}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.bold.fontFamily(semibold).color(redColor).size(16).make(),
      5.heightBox,
      TextFormField(
        controller: controller,
        obscureText: isPass! ? true : false,
        decoration: InputDecoration(
          hintStyle: TextStyle(
            fontFamily: semibold,
            color: textfieldGrey,
          ),
          hintText: hint,
          isDense: true,
          fillColor: lightGrey,
          filled: true,
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: redColor,
            ),
          ),
        ),
      ),
      10.heightBox,
    ],
  );
}
