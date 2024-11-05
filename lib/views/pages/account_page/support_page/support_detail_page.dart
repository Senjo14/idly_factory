

import 'package:idly_factory/views/pages/account_page/support_page/support_submit.dart';

import '../../../../core/export.dart';
import '../../../../controllers/discover_controllers/sliver_appbar_controller.dart';
import '../../../../widgets/common_widgets/list_tile.dart';

class SupportDetailPage extends StatelessWidget {
  final String title;

  SupportDetailPage({super.key, required this.title});

  final Map<String, List<String>> supportDetails = {
    "Roll Up To Win": [
      "I did not receive my - Roll(s)-RUTW",
      "I need help with my prize -RUTW",
      "Email Verification -RUTW",
      "General Inquiry - RUTW"
    ],
    "Account & App Access": [
      "Login Issues",
      "Password Reset",
      "Account Lock",
      "Profile Update"
    ],
  };

  @override
  Widget build(BuildContext context) {
    final SliverAppBarController controller = Get.put(SliverAppBarController());

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButtons(
            icon: Icons.arrow_back,
            onPressed: () {
              Navigator.popAndPushNamed(context, "/bottomNav");
            },
          ),
          title: Obx(() {
            return AnimatedOpacity(
              opacity: controller.isShow.value ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: Text(
                "Support",
                style: AppTextStyle.subHeadLineH2,
              ),
            );
          }),
          actions: [
            IconButtons(
              icon: AppIcons.location,
              onPressed: () => Get.toNamed("/storeLocator"),
            ),
            IconButtons(
              icon: AppIcons.person,
              onPressed: () => Get.toNamed("/login"),
            ),
          ],
        ),
        body: Column(
          children: [
            Text("All Support Topics/Roll Up To Win"),
            SizedBox(height: 15.h),
            Text(title),
            SizedBox(height: 20.h),
            Obx(() => ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: supportDetails.length,
                  itemBuilder: (context, index) {
                    var item = supportDetails[index];
                    return Column(
                      children: [
                        ReusableListTileWithImage(
                          title: item![index],
                          icon: Icons.arrow_forward_ios_sharp,
                          onTap: () {
                            Get.to(() => SupportSubmit(title: item));
                          },
                        ),
                        Divider(
                          color: Colors.black45,
                          thickness: 1.1,
                        ),
                      ],
                    );
                  },
                )),
          ],
        ));
  }
}
