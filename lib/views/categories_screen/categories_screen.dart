import 'package:ecommerceapp/consts/List.dart';
import 'package:ecommerceapp/consts/consts.dart';
import 'package:ecommerceapp/views/categories_screen/category_deatil.dart';
import 'package:ecommerceapp/widgets_common/background_widget.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: categories.text.white.fontFamily(bold).make(),
        ),
        body: Container(
          padding: const EdgeInsets.all(8),
          child: GridView.builder(
              shrinkWrap: true,
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                mainAxisExtent: 200,
              ),
              itemBuilder: (context, index) {
                return Container(
                  // color: redColor,
                  child: Column(
                    children: [
                      Image.asset(
                        categoryImages[index],
                        width: 200,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                      10.heightBox,
                      categoriesList[index]
                          .text
                          .fontFamily(semibold)
                          .align(TextAlign.center)
                          .color(darkFontGrey)
                          .make(),
                    ],
                  )
                      .box
                      .white
                      .rounded
                      .clip(Clip.antiAlias)
                      .outerShadowSm
                      .make()
                      .onTap(() {
                    Get.to(() => CategoryDetail(title: categoriesList[index]));
                  }),
                );
              }),
        ),
      ),
    );
  }
}
