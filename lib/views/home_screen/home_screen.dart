import 'package:ecommerceapp/consts/List.dart';
import 'package:ecommerceapp/consts/consts.dart';
import 'package:ecommerceapp/widgets_common/home_buttons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: lightGrey,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              height: 60,
              color: lightGrey,
              alignment: Alignment.center,
              child: TextFormField(
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: whiteColor,
                  hintText: searchAnything,
                  hintStyle: TextStyle(
                    color: textfieldGrey,
                  ),
                ),
              ),
            ),
            VxSwiper.builder(
              aspectRatio: 16 / 9,
              autoPlay: true,
              height: 100,
              enlargeCenterPage: true,
              itemCount: sliderList.length,
              itemBuilder: (contex, index) => Image.asset(
                sliderList[index],
                fit: BoxFit.fill,
              )
                  .box
                  .rounded
                  .clip(Clip.antiAlias)
                  .margin(EdgeInsets.symmetric(horizontal: 8))
                  .make(),
            ),
            10.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                2,
                (index) => homeButtons(
                  icon: index == 0 ? icTodaysDeal : icFlashDeal,
                  title: index == 0 ? todayDeal : flashSale,
                  height: context.screenHeight * 0.15,
                  width: context.screenWidth / 2.5,
                ),
              ),
            ),
            10.heightBox,
            VxSwiper.builder(
              aspectRatio: 16 / 9,
              autoPlay: true,
              height: 100,
              enlargeCenterPage: true,
              itemCount: secondSliderLit.length,
              itemBuilder: (contex, index) => Image.asset(
                secondSliderLit[index],
                fit: BoxFit.fill,
              )
                  .box
                  .rounded
                  .clip(Clip.antiAlias)
                  .margin(EdgeInsets.symmetric(horizontal: 8))
                  .make(),
            ),
            10.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                3,
                (index) => homeButtons(
                  icon: index == 0
                      ? icTopCategories
                      : index == 1
                          ? icBrands
                          : icTopSeller,
                  title: index == 0
                      ? topCategories
                      : index == 1
                          ? brand
                          : topSellers,
                  height: context.screenHeight * 0.15,
                  width: context.screenWidth / 3.5,
                ),
              ),
            ),
            10.heightBox,
            Align(
              alignment: Alignment.centerLeft,
              child: featuredCategories.text
                  .color(darkFontGrey)
                  .fontFamily(semibold)
                  .size(18)
                  .make(),
            )
          ],
        ),
      ),
    );
  }
}
