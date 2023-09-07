import 'package:ecommerceapp/models/category_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductContoller extends GetxController {
  var subCat = [];
  var quantity = 0.obs;
  var colorindex = 0.obs;
  var totalPrice = 0.obs;

  getSubCategories(title) async {
    subCat.clear();
    var data = await rootBundle.loadString("lib/services/category_model.json");

    var decoded = categortModelFromJson(data);
    var s =
        decoded.categories.where((element) => element.name == title).toList();

    for (var e in s[0].subcategory) {
      subCat.add(e);
    }
  }

  changeColoreIndex(index) {
    colorindex.value = index;
  }

  increaseQty(totalQty) {
    if (quantity < totalQty) {
      quantity.value++;
    }
  }

  descreaseQty() {
    if (quantity.value > 0) {
      quantity.value--;
    }
  }

  calculateTotalPrice(price) {
    totalPrice.value = price * quantity.value;
  }
}
