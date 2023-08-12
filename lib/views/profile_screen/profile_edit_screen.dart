import 'dart:io';
import 'package:ecommerceapp/consts/consts.dart';
import 'package:ecommerceapp/controller/profile_controller.dart';
import 'package:ecommerceapp/widgets_common/background_widget.dart';
import 'package:ecommerceapp/widgets_common/common_button.dart';
import 'package:ecommerceapp/widgets_common/custom_textfield.dart';
import 'package:get/get.dart';

class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    return bgWidget(
      child: Scaffold(
        body: Center(
          child: Obx(
            () => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                controller.profileImgPath.isEmpty
                    ? Image.asset(
                        imgProfile2,
                        width: 100,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make()
                    : Image.network(
                        controller.profileImgPath.value,
                        width: 100,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make(),
                10.heightBox,
                commonButton(
                  color: redColor,
                  onPress: () {
                    controller.changeImage(context);
                  },
                  textColor: whiteColor,
                  title: "Edit",
                ),
                20.heightBox,
                customTextfield(
                  isPass: false,
                  title: name,
                  hint: nameHint,
                ),
                10.heightBox,
                customTextfield(
                  isPass: false,
                  title: password,
                  hint: passwordHint,
                ),
                20.heightBox,
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: commonButton(
                    color: redColor,
                    onPress: () {},
                    textColor: whiteColor,
                    title: "Save",
                  ),
                )
              ],
            )
                .box
                .white
                .rounded
                .shadow
                .padding(EdgeInsets.all(16))
                .margin(EdgeInsets.all(10))
                .make(),
          ),
        ),
      ),
    );
  }
}
