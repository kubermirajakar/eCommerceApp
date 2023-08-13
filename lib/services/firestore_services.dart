import 'package:ecommerceapp/consts/consts.dart';

class FirestoreServicers {
  static getUser(uid) {
    return firestore
        .collection(userCollection)
        .where('id', isEqualTo: uid)
        .snapshots();
  }
}
