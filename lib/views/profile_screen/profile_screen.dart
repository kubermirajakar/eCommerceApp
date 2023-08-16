import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/consts/List.dart';
import 'package:ecommerceapp/consts/consts.dart';
import 'package:ecommerceapp/controller/auth_controller.dart';
import 'package:ecommerceapp/controller/profile_controller.dart';
import 'package:ecommerceapp/services/firestore_services.dart';
import 'package:ecommerceapp/views/auth_screen/login_screen.dart';
import 'package:ecommerceapp/views/profile_screen/components/profile_card.dart';
import 'package:ecommerceapp/views/profile_screen/profile_edit_screen.dart';
import 'package:ecommerceapp/widgets_common/background_widget.dart';
import 'package:ecommerceapp/widgets_common/circularIndicator.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());

    return bgWidget(
      child: Container(
        // padding: EdgeInsets.all(8),
        child: Scaffold(
            body: StreamBuilder(
          stream: FirestoreServicers.getUser(currentUser!.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: circularIndicator(),
              );
            } else {
              var data = snapshot.data!.docs[0];
              print(data['imageUrl']);

              return SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.topRight,
                        child: Icon(
                          Icons.edit,
                          color: whiteColor,
                        ),
                      ).onTap(() {
                        controller.nameController.text = data['name'];

                        Get.to(
                          () => ProfileEditScreen(data: data),
                        );
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          data['imageUrl'] == ""
                              ? Image.asset(
                                  imgProfile2,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ).box.roundedFull.clip(Clip.antiAlias).make()
                              : Image.network(
                                  data['imageUrl'],
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ).box.roundedFull.clip(Clip.antiAlias).make(),
                          10.widthBox,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "${data['name']}"
                                  .text
                                  .white
                                  .fontFamily(bold)
                                  .make(),
                              5.heightBox,
                              "${data['email']}".text.white.make()
                            ],
                          ),
                          const Spacer(),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                color: whiteColor,
                              ),
                            ),
                            onPressed: () async {
                              await Get.put(AuthController())
                                  .signOutMethod(context);
                              Get.offAll(() => const LoginScreen());
                            },
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
                          value: "${data['cart_count']}",
                        ),
                        profileCard(
                          width: context.screenWidth / 3.4,
                          title: "In your wishlist",
                          value: "${data['wishlist_count']}",
                        ),
                        profileCard(
                          width: context.screenWidth / 3.4,
                          title: "your orders",
                          value: "${data['order_count']}",
                        ),
                      ],
                    ).box.color(redColor).make(),
                    ListView.separated(
                      shrinkWrap: true,
                      itemCount: profileButtonList.length,
                      separatorBuilder: (context, index) {
                        return const Divider(
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
                        .margin(const EdgeInsets.all(16))
                        .padding(const EdgeInsets.all(8))
                        .make()
                        .box
                        .color(redColor)
                        .make(),
                  ],
                ),
              );
            }
          },
        )),
      ),
    );
  }
}
