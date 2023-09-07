import 'package:ecommerceapp/consts/consts.dart';
import 'package:ecommerceapp/widgets_common/common_button.dart';
import 'package:flutter/services.dart';

Widget exitdialogue(context) {
  return Dialog(
    child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          "Confirm".text.color(redColor).size(20).make(),
          20.heightBox,
          "Are you sure you want to exit".text.color(redColor).bold.make(),
          20.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              commonButton(
                color: redColor,
                onPress: () {
                  SystemNavigator.pop();
                },
                textColor: whiteColor,
                title: "Yes",
              ),
              commonButton(
                color: redColor,
                onPress: () {
                  Navigator.pop(context);
                },
                textColor: whiteColor,
                title: "No",
              ),
            ],
          )
        ]).box.rounded.padding(EdgeInsets.all(16)).make(),
  );
}
