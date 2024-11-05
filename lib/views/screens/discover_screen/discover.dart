import 'package:idly_factory/core/export.dart';
import 'package:idly_factory/controllers/discover_controllers/sliver_appbar_controller.dart';

import 'package:idly_factory/views/widgets/discover_widgets/discover_container.dart';

import '../../../widgets/common_widgets/sliver_appbar.dart';

class Discover extends StatefulWidget {

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {

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
              AppStrings.discover,
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
            text: AppStrings.discover,
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
