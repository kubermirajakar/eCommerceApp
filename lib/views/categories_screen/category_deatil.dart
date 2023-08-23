import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/consts/consts.dart';
import 'package:ecommerceapp/controller/product_controller.dart';
import 'package:ecommerceapp/services/firestore_services.dart';
import 'package:ecommerceapp/views/categories_screen/item_details.dart';
import 'package:ecommerceapp/widgets_common/background_widget.dart';
import 'package:ecommerceapp/widgets_common/circularIndicator.dart';
import 'package:get/get.dart';

class CategoryDetail extends StatefulWidget {
  String title;

  CategoryDetail({super.key, required this.title});

  @override
  State<CategoryDetail> createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductContoller>();

    return bgWidget(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: widget.title.text.white.fontFamily(bold).make(),
      ),
      body: StreamBuilder(
        stream: FirestoreServicers.getProducts(widget.title),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return circularIndicator();
          } else if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: "No Products Found!!!".text.make(),
            );
          } else {
            return Container(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          controller.subCat.length,
                          (index) => "${controller.subCat[index]}"
                              .text
                              .size(12)
                              .fontFamily(bold)
                              .color(darkFontGrey)
                              .makeCentered()
                              .box
                              .roundedSM
                              .margin(
                                const EdgeInsets.symmetric(
                                  horizontal: 4,
                                ),
                              )
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
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
            );
          }
        },
      ),
    ));
  }
}
