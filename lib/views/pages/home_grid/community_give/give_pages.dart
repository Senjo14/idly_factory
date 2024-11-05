import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/export.dart';
import '../../../../controllers/discover_controllers/sliver_appbar_controller.dart';
import '../../../widgets/discover_widgets/discover_container.dart';
import '../../../../widgets/common_widgets/sliver_appbar.dart';

class GivePage extends StatefulWidget {
  @override
  State<GivePage> createState() => _GivePageState();
}

class _GivePageState extends State<GivePage> {


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
              AppStrings.give,
              style: AppTextStyle.mainHeader,
            ),
          );
        }),
        actions: [
          IconButtons(
            iconSize: 25,
            icon: AppIcons.location,
            onPressed: () => Get.toNamed("/storeLocator"),
          ),
          IconButtons(
            iconSize: 25,
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
              isShow: controller.isShow.value,
              text: AppStrings.give,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "We make it easy to give",
                      style: AppTextStyle.sectionTitlesH3,
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "Brighten someone's day with a digital gift card!",
                      style: AppTextStyle.bodyText,
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return DiscoverContainer();
                },
                childCount: 5,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                 mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tim Card",
                      style: AppTextStyle.navigationMenu,
                    ),
                    SizedBox(height: 15.h),
                    
                      InkWell(
                        child: Text("Terms & Conditions",
                          style: AppTextStyle.bodyText),
                      ),
                    
                    SizedBox(height: 15.h),
                   InkWell(
                     child: Text("Frequently asked questions",
                          style: AppTextStyle.bodyText),
                   ),
                    SizedBox(height: 15.h),
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
