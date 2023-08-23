import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ProfileController extends GetxController {
  var profileImgPath = "".obs;
  var profileImageLink = '';
  var isLoading = false.obs;

  var nameController = TextEditingController();
  var oldPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();

  changeImage(context) async {
    try {
      final img = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 80);

      if (img == null) return;
      profileImgPath.value = img.path;
    } on PlatformException catch (e) {
      VxToast.show(
        context,
        msg: e.toString(),
      );
    }
  }

  // uploadProfileImage() async {
  //   var fileName = basename(profileImgPath.value);

  //   var destination = "images/${currentUser!.uid}/$fileName";

  //   Reference ref = FirebaseStorage.instance.ref().child(destination);

  //   await ref.putFile(File(profileImgPath.value));

  //   profileImageLink = await ref.getDownloadURL();
  // }

  uploadProfileImage() {
    profileImageLink = profileImgPath.value;
  }

  updateProfile({name, password, imageUrl}) async {
    var store = firestore.collection(userCollection).doc(currentUser!.uid);
    // print(store);
    await store.set(
        {
          'name': name,
          'password': password,
          'imageUrl': imageUrl,
        },
        SetOptions(
          merge: true,
        ));
    isLoading(false);
  }

  changeAuthPassword({email, password, newPassword}) async {
    var cred = EmailAuthProvider.credential(email: email, password: password);
    await currentUser!
        .reauthenticateWithCredential(cred)
        .then((value) => {currentUser!.updatePassword(newPassword)})
        .catchError((error) {
      print(error.toString());
    });
  }
}
