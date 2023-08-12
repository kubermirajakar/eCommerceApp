import 'package:ecommerceapp/consts/consts.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  var profileImgPath = "".obs;

  changeImage(context) async {
    try {
      final img = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 80);
      // print(img!.path);
      if (img == null) return;
      profileImgPath.value = img.path;
      print(profileImgPath.value);
    } on PlatformException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
