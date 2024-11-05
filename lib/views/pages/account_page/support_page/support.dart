import 'package:idly_factory/core/export.dart';
import 'package:idly_factory/controllers/account_contollers/support/rollup_list/rollup_list.dart';
import 'package:idly_factory/views/pages/account_page/support_page/support_page.dart';

import '../../../../widgets/common_widgets/listTile_withImage.dart';
import '../../../../widgets/common_widgets/list_tile.dart';

class Support extends StatelessWidget {
   Support({super.key});

  final RollUpList _rollUpList = Get.put(RollUpList());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Support", style: AppTextStyle.cardTiles),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.location_on,
                size: 26.w, color: AppColors.iconsColor),
            onPressed: () => Get.toNamed("/storeLocator"),
          ),
          IconButton(
              icon: Icon(Icons.person, size: 26.w, color: AppColors.iconsColor),
              onPressed: () {
                Get.toNamed("/profile");
              }),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "We're here to help",
              style: AppTextStyle.subHeadLineH2,
            ),
            SizedBox(height: 10.h),
            Text(
              "Have a question ? we've got answers",
              style: AppTextStyle.cardTiles,
            ),
            SizedBox(height: 10.h),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListTile(
                  title: Text(
                    "Chat with us",
                    style: AppTextStyle.cardTiles,
                  ),
                  subtitle: Text(
                    "TomBot is ready to help 24/7!",
                    style: AppTextStyle.bodyText,
                  ),
                  leading: Image.asset("assets/images/icons/surprise-box.png"),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Other ways we can help",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Column(
                      children: [
                        ReusableListTileWithImageBelow(
                          title: "Contact Us",
                          imagePath: "assets/images/icons/shop-bag.png",
                          icon: Icons.arrow_forward_ios,
                          onTap: () {
                            Get.to(ContactUs());
                          },
                        ),
                        const Divider(height: 0.6, color: Colors.black26),
                        ReusableListTileWithImageBelow(
                          title: "Frquently asked questions",
                          imagePath: "assets/images/icons/round.png",
                          icon: Icons.arrow_forward_ios,
                          onTap: () {},
                        ),
                        const Divider(height: 0.6, color: Colors.black26),
                        ReusableListTileWithImageBelow(
                          title: "Tims Financial Support",
                          imagePath: "assets/images/logo/access.png",
                          icon: Icons.arrow_forward_ios,
                          onTap: () {},
                        ),
                        const Divider(height: 0.6, color: Colors.black26),
                        ReusableListTileWithImageBelow(
                          title: "Feedback Survey",
                          imagePath: "assets/images/logo/coffee-app.png",
                          icon: Icons.ios_share,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
