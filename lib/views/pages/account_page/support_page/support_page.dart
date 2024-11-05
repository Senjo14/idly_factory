import '../../../../core/export.dart';
import '../../../../controllers/account_contollers/support/rollup_list/rollup_list.dart';
import '../../../../controllers/discover_controllers/sliver_appbar_controller.dart';
import '../../../../widgets/common_widgets/list_tile.dart';
import '../../../../widgets/common_widgets/sliver_appbar.dart';

class ContactUs extends StatelessWidget {
  ContactUs({super.key});

  final RollUpList _rollUpList = Get.put(RollUpList());

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
      body: SizedBox(
        height: 800,
        child: CustomScrollView(
          controller: controller.scrollController,
          slivers: [
            SliverAppbar(
              text: "Support",
              isShow: controller.isShow.value,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "What do you need help with?",
                      style: AppTextStyle.subHeadLineH2,
                    ),
                    SizedBox(height: 20.h),

                    // Wrapping only the ListView.builder in Obx
                    Obx(() {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _rollUpList.entryList.length,
                        itemBuilder: (context, index) {
                          var item = _rollUpList.entryList[index];
                          return
                              ReusableListTileWithImage(
                                title: item.toString(),
                                icon: Icons.arrow_forward_ios_sharp,
                                onTap: () {
                                 // Get.to(() => SupportDetailPage(title: item));
                                },
                              );
                              // const Divider(
                              //   color: Colors.black45,
                              //   thickness: 1.1,
                              // ),
                              //
                        },
                      );
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
