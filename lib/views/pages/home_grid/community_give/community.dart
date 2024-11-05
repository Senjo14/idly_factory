import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idly_factory/core/export.dart';
import 'package:get/get.dart';

import '../../../widgets/discover_widgets/discover_container.dart';


class CommunityPage extends StatefulWidget {
   CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {


  @override
  Widget build(BuildContext context) {
    final SliverAppBarController controller = Get.put(SliverAppBarController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButtons(
            icon: Icons.arrow_back,
            onPressed: (){
              Navigator.popAndPushNamed(context, "/bottomNav");
            }),
        title: Obx(() {
          return AnimatedOpacity(
            opacity: controller.isShow.value ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: Text(
              AppStrings.community,
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
      body: CustomScrollView(
        controller: controller.scrollController,
        slivers: [
          SliverAppbar(
            text: AppStrings.community,
            isShow:controller.isShow.value,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return DiscoverContainer();
              },
              childCount: 5,
            ),
          ),
        ],
      ),

    );
  }
}
