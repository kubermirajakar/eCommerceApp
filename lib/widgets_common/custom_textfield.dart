import 'package:ecommerceapp/consts/consts.dart';

Widget customTextfield() {
  return Column(
    children: [
      email.text.bold.fontFamily(semibold).color(redColor).size(16).make(),
      5.heightBox,
      TextFormField(
        decoration: InputDecoration(
          isDense: true,
        ),
      )
    ],
  );
}
