import 'package:ecommerceapp/consts/List.dart';
import 'package:ecommerceapp/consts/consts.dart';
import 'package:ecommerceapp/controller/product_controller.dart';
import 'package:ecommerceapp/widgets_common/common_button.dart';
import 'package:get/get.dart';

class ItemDetails extends StatelessWidget {
  final String title;
  final dynamic data;

  const ItemDetails({Key? key, required this.title, this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductContoller>();

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: title.text.color(darkFontGrey).fontFamily(semibold).make(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_outline,
            ),
          ),
        ],
      ),
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(
                  8,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VxSwiper.builder(
                        aspectRatio: 16 / 9,
                        height: 350,
                        autoPlay: true,
                        itemCount: data['p_imgs'].length,
                        viewportFraction: 1.0,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              data['p_imgs'][index],
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                      10.heightBox,
                      title.text
                          .color(darkFontGrey)
                          .fontFamily(semibold)
                          .size(16)
                          .make(),
                      10.heightBox,
                      VxRating(
                        isSelectable: false,
                        value: double.parse(data['p_rating']),
                        onRatingUpdate: (value) {},
                        normalColor: textfieldGrey,
                        selectionColor: golden,
                        count: 5,
                        maxRating: 5,
                        size: 25,
                        stepInt: true,
                      ),
                      10.heightBox,
                      "${data['p_price']}"
                          .text
                          .color(redColor)
                          .fontFamily(semibold)
                          .size(18)
                          .make(),
                      10.heightBox,
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "Seller".text.white.fontFamily(semibold).make(),
                                5.heightBox,
                                "${data['p_seller']}"
                                    .text
                                    .fontFamily(semibold)
                                    .color(darkFontGrey)
                                    .make(),
                              ],
                            ),
                          ),
                          const CircleAvatar(
                            backgroundColor: whiteColor,
                            child: Icon(
                              Icons.message_rounded,
                              color: darkFontGrey,
                            ),
                          )
                        ],
                      )
                          .box
                          .padding(const EdgeInsets.symmetric(horizontal: 16))
                          .height(60)
                          .color(textfieldGrey)
                          .make(),
                      20.heightBox,
                      Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child: "Colors : "
                                    .text
                                    .fontFamily(semibold)
                                    .color(textfieldGrey)
                                    .make(),
                              ),
                              Obx(
                                () => Row(
                                  children: List.generate(
                                      data['p_colors'].length,
                                      (index) => Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              VxBox()
                                                  .size(40, 40)
                                                  .roundedFull
                                                  .color(Color(data['p_colors']
                                                          [index])
                                                      .withOpacity(1.0))
                                                  .margin(const EdgeInsets
                                                      .symmetric(horizontal: 4))
                                                  .make()
                                                  .onTap(() {
                                                controller
                                                    .changeColoreIndex(index);
                                              }),
                                              Visibility(
                                                  visible: index ==
                                                      controller
                                                          .colorindex.value,
                                                  child: Icon(
                                                    Icons.done,
                                                    color: whiteColor,
                                                  ))
                                            ],
                                          )),
                                ),
                              )
                            ],
                          ).box.padding(const EdgeInsets.all(8)).make(),
                          Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child: "Quantity : "
                                    .text
                                    .fontFamily(semibold)
                                    .color(textfieldGrey)
                                    .make(),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        controller.descreaseQty();
                                        controller.calculateTotalPrice(
                                            int.parse(data['p_price']));
                                      },
                                      icon: const Icon(Icons.remove)),
                                  controller.quantity.value.text.bold
                                      .size(16)
                                      .color(darkFontGrey)
                                      .make(),
                                  IconButton(
                                    onPressed: () {
                                      controller.increaseQty(
                                          int.parse(data['p_quantity']));
                                      controller.calculateTotalPrice(
                                          int.parse(data['p_price']));
                                    },
                                    icon: const Icon(Icons.add),
                                  ),
                                  10.widthBox,
                                  "${data['p_quantity']} Available"
                                      .text
                                      .color(textfieldGrey)
                                      .make(),
                                ],
                              ),
                            ],
                          ).box.padding(const EdgeInsets.all(8)).make(),
                          Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child: "Price : "
                                    .text
                                    .fontFamily(semibold)
                                    .color(textfieldGrey)
                                    .make(),
                              ),
                              "${controller.totalPrice.value}"
                                  .numCurrency
                                  .text
                                  .color(redColor)
                                  .bold
                                  .size(18)
                                  .make(),
                            ],
                          ).box.padding(const EdgeInsets.all(8)).make(),
                        ],
                      ).box.white.shadowSm.make(),
                      20.heightBox,
                      "${data['p_desc']}"
                          .text
                          .fontFamily(bold)
                          .color(darkFontGrey)
                          .make(),
                      "Dummy description header and dummy stpes"
                          .text
                          .fontFamily(semibold)
                          .color(darkFontGrey)
                          .make(),
                      20.heightBox,
                      ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: List.generate(
                            itemDetailsButtonList.length,
                            (index) => ListTile(
                                  title: itemDetailsButtonList[index]
                                      .text
                                      .fontFamily(semibold)
                                      .make(),
                                  trailing: const Icon(Icons.arrow_forward),
                                )
                                    .box
                                    .white
                                    .roundedSM
                                    .margin(
                                        const EdgeInsets.symmetric(vertical: 4))
                                    .make()),
                      ).box.color(textfieldGrey).make(),
                      10.heightBox,
                      productsYouMayLike.text.bold
                          .color(darkFontGrey)
                          .size(18)
                          .make(),
                      10.heightBox,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            6,
                            (index) => Column(
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
                                .margin(
                                    const EdgeInsets.symmetric(horizontal: 4))
                                .padding(
                                    const EdgeInsets.symmetric(horizontal: 8))
                                .make(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: commonButton(
                color: redColor,
                onPress: () {},
                textColor: whiteColor,
                title: "Add to cart",
              ),
            )
          ],
        ),
      ),
    );
  }
}
