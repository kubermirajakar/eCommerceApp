import 'package:ecommerceapp/consts/consts.dart';
import 'package:ecommerceapp/widgets_common/background_widget.dart';

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
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    6,
                    (index) => "Baby Clothing"
                        .text
                        .size(12)
                        .fontFamily(semibold)
                        .color(darkFontGrey)
                        .makeCentered()
                        .box
                        .roundedSM
                        .margin(EdgeInsets.symmetric(horizontal: 4))
                        .white
                        .size(120, 60)
                        .make()),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
