import 'dart:io';
import 'package:ecommerceapp/consts/consts.dart';
import 'package:ecommerceapp/controller/profile_controller.dart';
import 'package:ecommerceapp/widgets_common/background_widget.dart';
import 'package:ecommerceapp/widgets_common/circularIndicator.dart';
import 'package:ecommerceapp/widgets_common/common_button.dart';
import 'package:ecommerceapp/widgets_common/custom_textfield.dart';
import 'package:get/get.dart';

class ProfileEditScreen extends StatefulWidget {
  final dynamic data;

  ProfileEditScreen({Key? key, this.data}) : super(key: key);
  var controller = Get.find<ProfileController>();
  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  @override
  void initState() {
    if (widget.data['imageUrl'] == "") {
      widget.controller.profileImgPath = "".obs;
    } else {
      widget.controller.profileImgPath.value = widget.data['imageUrl'];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    return bgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(iconTheme: const IconThemeData(color: whiteColor)),
        body: SingleChildScrollView(
          child: Center(
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
                    controller: controller.nameController,
                    isPass: false,
                    title: name,
                    hint: nameHint,
                  ),
                  10.heightBox,
                  customTextfield(
                    controller: controller.oldPasswordController,
                    isPass: false,
                    title: oldPassword,
                    hint: passwordHint,
                  ),
                  10.heightBox,
                  customTextfield(
                    controller: controller.newPasswordController,
                    isPass: false,
                    title: newPassword,
                    hint: passwordHint,
                  ),
                  20.heightBox,
                  controller.isLoading.value
                      ? circularIndicator()
                      : SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: commonButton(
                            color: redColor,
                            onPress: () async {
                              controller.isLoading(true);
                              try {
                                controller.uploadProfileImage();

                                if (widget.data['password'] ==
                                    controller.oldPasswordController.text) {
                                  await controller.changeAuthPassword(
                                    email: widget.data['email'],
                                    password:
                                        controller.oldPasswordController.text,
                                    newPassword:
                                        controller.newPasswordController.text,
                                  );

                                  await controller.updateProfile(
                                    imageUrl: controller.profileImageLink,
                                    name: controller.nameController.text,
                                    password:
                                        controller.newPasswordController.text,
                                  );

                                  VxToast.show(context, msg: 'Updated');
                                } else {
                                  VxToast.show(context,
                                      msg: 'Old password is wrong');
                                  controller.isLoading(false);
                                }
                              } catch (e) {}
                            },
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
                  .padding(const EdgeInsets.all(16))
                  .margin(const EdgeInsets.all(10))
                  .make(),
            ),
          ),
        ),
      ),
    );
  }
}
