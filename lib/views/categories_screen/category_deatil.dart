import 'package:ecommerceapp/consts/consts.dart';
import 'package:ecommerceapp/views/categories_screen/item_details.dart';
import 'package:ecommerceapp/widgets_common/background_widget.dart';
import 'package:get/get.dart';

class CategoryDetail extends StatelessWidget {
  String title;

  CategoryDetail({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: title.text.white.fontFamily(bold).make(),
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    6,
                    (index) => "Baby Clothing"
                        .text
                        .size(12)
                        .fontFamily(bold)
                        .color(darkFontGrey)
                        .makeCentered()
                        .box
                        .roundedSM
                        .margin(const EdgeInsets.symmetric(horizontal: 4))
                        .white
                        .size(120, 60)
                        .make()),
              ),
            ),
            20.heightBox,
            Expanded(
              child: GridView.builder(
                itemCount: 6,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  mainAxisExtent: 200,
                ),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        imgP1,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                      10.heightBox,
                      "Laptop 4GB/64GB"
                          .text
                          .color(darkFontGrey)
                          .fontFamily(semibold)
                          .make(),
                      10.heightBox,
                      "\$600"
                          .text
                          .fontFamily(bold)
                          .color(redColor)
                          .size(16)
                          .make(),
                    ],
                  )
                      .box
                      .roundedSM
                      .color(whiteColor)
                      .outerShadowSm
                      .margin(const EdgeInsets.symmetric(horizontal: 4))
                      .padding(const EdgeInsets.symmetric(horizontal: 8))
                      .make()
                      .onTap(
                    () {
                      Get.to(
                        () => const ItemDetails(
                          title: "Laptop 4GB/64GB",
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}
