
import 'package:idly_factory/core/export.dart';

class Scan extends StatefulWidget {
  const Scan({Key? key}) : super(key: key);

  @override
  State<Scan> createState() => _ScanState();
}

class _ScanState extends State<Scan> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }


  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: TabBarView(
        controller: _tabController,
        children: const [
          TimsRewards(),
          TimsGiftCard(),
        ],
      ),

    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      leading: IconButtons(
          icon: Icons.arrow_back, onPressed: () {
        Navigator.popAndPushNamed(context, "/bottomNav");
      }),
      title: Text(
        AppStrings.scanForTimsRewards.tr,
        style: AppTextStyle.subHeadLineH2,
      ),
      actions: [
        IconButtons(
          icon: AppIcons.location,
          iconSize: 20.w,
          color: AppColors.iconsColor,
          onPressed: () => Get.toNamed("/storeLocator"),
        ),
        IconButtons(
          icon: AppIcons.person,
          iconSize: 22.w,
          color: AppColors.iconsColor,
          onPressed: () => Get.toNamed("/login"),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(40.h),
        child: Container(
          color: Colors.red,
          child: TabBar(
            controller: _tabController,
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 3,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(
                child: Text(AppStrings.timsRewards,
                    style: AppTextStyle.buttonsAction),
              ),
              Tab(
                child: Text(
                  AppStrings.timsGiftCard,
                  style: AppTextStyle.buttonsAction,
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}
