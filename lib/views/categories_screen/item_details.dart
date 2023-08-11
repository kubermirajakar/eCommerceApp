import 'package:ecommerceapp/consts/List.dart';
import 'package:ecommerceapp/consts/consts.dart';
import 'package:ecommerceapp/widgets_common/common_button.dart';

class ItemDetails extends StatelessWidget {
  final String title;

  const ItemDetails({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          title: title.text.color(darkFontGrey).fontFamily(semibold).make(),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.share),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_outline,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(
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
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            imgFc5,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                      10.heightBox,
                      title!.text
                          .color(darkFontGrey)
                          .fontFamily(semibold)
                          .size(16)
                          .make(),
                      10.heightBox,
                      VxRating(
                        onRatingUpdate: (value) {},
                        normalColor: textfieldGrey,
                        selectionColor: golden,
                        count: 5,
                        size: 25,
                        stepInt: true,
                      ),
                      10.heightBox,
                      "\$10,000"
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
                                "Sellers"
                                    .text
                                    .white
                                    .fontFamily(semibold)
                                    .make(),
                                5.heightBox,
                                "In house Brands"
                                    .text
                                    .fontFamily(semibold)
                                    .color(darkFontGrey)
                                    .make(),
                              ],
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: whiteColor,
                            child: Icon(
                              Icons.message_rounded,
                              color: darkFontGrey,
                            ),
                          )
                        ],
                      )
                          .box
                          .padding(EdgeInsets.symmetric(horizontal: 16))
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
                              Row(
                                children: List.generate(
                                  3,
                                  (index) => VxBox()
                                      .size(40, 40)
                                      .roundedFull
                                      .color(Vx.randomPrimaryColor)
                                      .margin(
                                          EdgeInsets.symmetric(horizontal: 4))
                                      .make(),
                                ),
                              )
                            ],
                          ).box.padding(EdgeInsets.all(8)).make(),
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
                                      onPressed: () {},
                                      icon: Icon(Icons.remove)),
                                  "0"
                                      .text
                                      .bold
                                      .size(16)
                                      .color(darkFontGrey)
                                      .make(),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.add),
                                  ),
                                  10.widthBox,
                                  "0 Available"
                                      .text
                                      .color(textfieldGrey)
                                      .make(),
                                ],
                              ),
                            ],
                          ).box.padding(EdgeInsets.all(8)).make(),
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
                              "\$0.00"
                                  .text
                                  .color(redColor)
                                  .bold
                                  .size(18)
                                  .make(),
                            ],
                          ).box.padding(EdgeInsets.all(8)).make(),
                        ],
                      ).box.white.shadowSm.make(),
                      20.heightBox,
                      "Description"
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
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: List.generate(
                            itemDetailsButtonList.length,
                            (index) => ListTile(
                                  title: itemDetailsButtonList[index]
                                      .text
                                      .fontFamily(semibold)
                                      .make(),
                                  trailing: Icon(Icons.arrow_forward),
                                )
                                    .box
                                    .white
                                    .roundedSM
                                    .margin(EdgeInsets.symmetric(vertical: 4))
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
                                .margin(EdgeInsets.symmetric(horizontal: 4))
                                .padding(EdgeInsets.symmetric(horizontal: 8))
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
        ));
  }
}
