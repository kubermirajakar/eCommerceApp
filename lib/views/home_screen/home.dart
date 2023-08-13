import 'package:ecommerceapp/consts/consts.dart';
import 'package:ecommerceapp/views/cart_screen/cart_screen.dart';
import 'package:ecommerceapp/views/categories_screen/categories_screen.dart';
import 'package:ecommerceapp/views/home_screen/home_screen.dart';
import 'package:ecommerceapp/views/profile_screen/profile_screen.dart';
import 'package:get/get.dart';
import 'package:ecommerceapp/controller/home_controller.dart';

class Home extends StatelessWidget {
  double bottomNavIconSize = 26;

  var controller = Get.put(HomeControler());

  @override
  Widget build(BuildContext context) {
    var navBarItem = [
      BottomNavigationBarItem(
          icon: Image.asset(
            icHome,
            width: bottomNavIconSize,
          ),
          label: home),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCategories,
            width: bottomNavIconSize,
          ),
          label: categories),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCart,
            width: bottomNavIconSize,
          ),
          label: cart),
      BottomNavigationBarItem(
          icon: Image.asset(
            icProfile,
            width: bottomNavIconSize,
          ),
          label: account)
    ];

    var navBody = [
      const HomeScreen(),
      const CategoriesScreen(),
      const CartScreen(),
      const ProfileScreen()
    ];
    return Scaffold(
      body: Column(
        children: [
          Obx(() => Expanded(child: navBody[controller.currentNavIndex.value])),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentNavIndex.value,
          selectedItemColor: redColor,
          selectedLabelStyle: const TextStyle(
            fontFamily: semibold,
          ),
          type: BottomNavigationBarType.fixed,
          backgroundColor: whiteColor,
          items: navBarItem,
          onTap: (value) {
            controller.currentNavIndex.value = value;
          },
        ),
      ),
    );
  }
}
