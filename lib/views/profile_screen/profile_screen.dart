import 'package:ecommerceapp/consts/List.dart';
import 'package:ecommerceapp/consts/consts.dart';
import 'package:ecommerceapp/views/profile_screen/components/profile_card.dart';
import 'package:ecommerceapp/widgets_common/background_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Container(
        // padding: EdgeInsets.all(8),
        child: Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.edit,
                      color: whiteColor,
                    ),
                  ).onTap(() {}),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Image.asset(
                        imgProfile2,
                        width: 100,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make(),
                      10.widthBox,
                      Column(
                        children: [
                          "Dummy User".text.white.fontFamily(semibold).make(),
                          5.heightBox,
                          "abc@xyz.com".text.white.make()
                        ],
                      ),
                      Spacer(),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: whiteColor,
                          ),
                        ),
                        onPressed: () {},
                        child: logout.text.bold.white.make(),
                      ),
                    ],
                  ),
                ),
                20.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    profileCard(
                        width: context.screenWidth / 3.4,
                        title: "In your cart",
                        value: "00"),
                    profileCard(
                        width: context.screenWidth / 3.4,
                        title: "In your wishlist",
                        value: "32"),
                    profileCard(
                        width: context.screenWidth / 3.4,
                        title: "your orders",
                        value: "675"),
                  ],
                ),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: profileButtonList.length,
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: lightGrey,
                      thickness: 4,
                    );
                  },
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: profileButtonList[index]
                          .text
                          .fontFamily(semibold)
                          .make(),
                      leading: Image.asset(
                        profileButtonIcon[index],
                        width: 26,
                      ),
                    );
                  },
                )
                    .box
                    .white
                    .rounded
                    .shadow
                    .margin(EdgeInsets.all(16))
                    .padding(EdgeInsets.all(8))
                    .make()
                    .box
                    .color(redColor)
                    .make(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
