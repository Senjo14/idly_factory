import 'package:idly_factory/controllers/signup_login_controllers/signin_controllers.dart';
import 'package:idly_factory/core/export.dart';
import 'package:idly_factory/services/auth_service/signin_service/authService.dart';


class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService authService = Get.put(AuthService());
  final SignInController _signInController = Get.put(SignInController());
  bool isForYouSelected = true;
  final PageController _pageController = PageController(viewportFraction: 0.95);


  final Map<String, String> images = {
    "assets/images/logo/access.png": "Order",
    "assets/images/logo/bowling.png": "Offers",
    "assets/images/logo/coffee-app.png": "Delivery",
    "assets/images/icons/red bag.png": "Give",
    "assets/images/logo/favourite.png": "Community",
    "assets/images/logo/file-backup.png": "Games",
    "assets/images/logo/give-money.png": "Idly Shop",
    "assets/images/logo/join-hands.png": "Restaurant Locator",
    "assets/images/logo/offer.png": "Join our Team",
    "assets/images/icons/delivery-bike.png": "Join our Team",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            _buildAppBar(),
            SliverToBoxAdapter(
              child: _signInController.isSignedIn.value
                  ? _buildGuestContent()
                  : _buildSignedInContent(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      expandedHeight: 30.0,
      floating: true,
      pinned: true,
      actions: [
        IconButton(
          icon:
              Icon(Icons.location_on, size: 22.w, color: AppColors.iconsColor),
          onPressed: () {
            if(_signInController.isSignedIn.value) {
              Get.toNamed("/storeLocator");
            }
            else
              {
               Get.toNamed("/order");
              }
          },
        ),
        5.horizontalSpace,
        IconButton(
          icon: Icon(Icons.person, size: 22.w, color: AppColors.iconsColor),
          onPressed: () => _signInController.isSignedIn.value
              ? Get.to(ProfilePage())
              : Get.to(ProfilePage()),
        ),
      ],
    );
  }

  Widget _buildSignedInContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildWelcomeMessage(),
        10.verticalSpace,
        _buildFixedHeightContainer(),
      ],
    );
  }

  Widget _buildWelcomeMessage() {
    return Stack(children: [
      Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              children: [
                Text(AppStrings.welcomeTo.tr, style: AppTextStyle.mainHeader),
                5.horizontalSpace,
                Text(AppStrings.idlyFactory.tr,
                    style: AppTextStyle.idlyFactory),
              ],
            ),
            10.verticalSpace,
            Text(AppStrings.joinNowOrderAhead.tr, style: AppTextStyle.bodyText),
            15.verticalSpace,
            _buildJoinButtons(),
            65.verticalSpace,
          ],
        ),
      ),
    ]);
  }

  Widget _buildGuestContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() => Text(authService.getGreeting.toString(),
            style: AppTextStyle.sectionTitlesH3)),
        5.verticalSpace,
        Text("", style: AppTextStyle.subHeadLineH2),
        10.verticalSpace,
        Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: _buildForOrder(),
        ),
        70.verticalSpace,
        SizedBox(height: 600.h, child: _buildFixedHeightContainer()),
      ],
    );
  }

  Widget _buildJoinButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        EvSmallButton(
          text: AppStrings.joinNow.tr,
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
          onPressed: () {
            Get.to(() => SignupPage(initialTabIndex: 0));
          },
        ),
        10.horizontalSpace,
        TextButton(
          onPressed: () {
            Get.to(() => const SignupPage(initialTabIndex: 1));
          },
          child: Text(AppStrings.signIn.tr, style: AppTextStyle.errorMessages),
        ),
      ],
    );
  }

  Widget _buildGridViewSection() {
    int itemCount = images.length;
    double gridHeight;

    if (itemCount <= 4) {
      gridHeight = 110.h;
    } else {
      int rowCount = (itemCount / 4).ceil();
      gridHeight = rowCount * 110.h;
    }
    return SizedBox(
      height: gridHeight,
      child: GridView.count(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: List.generate(images.length, (index) {
          String imagePath = images.keys.elementAt(index);
          String label = images[imagePath]!;
          return ItemsContainer(
            imagePath: imagePath,
            label: label,
          );
        }),
      ),
    );
  }

  Widget _buildForOrder() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        EvSmallButton(
          text: "For You",
          onPressed: () {
            setState(() {
              isForYouSelected = true;
            });
          },
        ),
        10.horizontalSpace,
        EvSmallButton(
          text: "Order Again",
          onPressed: () {
            setState(() {
              isForYouSelected = false;
            });
          },
        ),
      ],
    );
  }

  Widget _buildForYouContent() {
    return Positioned(
      top: -60.h,
      left: 0,
      right: 0,
      child: SizedBox(
        height: 120.h,
        child: PageView.builder(
          controller: _pageController,
          physics: AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return OfferBannerCard();
          },
        ),
      ),
    );
  }

  Widget OfferBannerCard() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 5.w,
      ),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.all(10.w),
          leading: SizedBox(
            height: 80.h,
            width: 80.w,
            child: Image.asset(
              "assets/images/background/card.gif",
              fit: BoxFit.contain,
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '2 for \$12 Flatbreads',
                style: AppTextStyle.smallText.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                "For a limited time, get any 2 Flatbread Pizzas for \$12",
                style: AppTextStyle.smallText,
              ),
            ],
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 20.r,
          ),
          onTap: () {},
        ),
      ),
    );
  }

  Widget _buildRedContainers() {
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Positioned(
      top: screenHeight * -0.095,
      left: 11.w,
      right: 11.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildFinancialContainer(),
          15.horizontalSpace,
          _buildRewardsContainer(),
        ],
      ),
    );
  }

  Widget _buildFinancialContainer() {
    return const FinancialContainer();
  }

  Widget _buildRewardsContainer() {
    return RewardsContainer(
      points: _signInController.isSignedIn.value ? 100 : 0,
    );
  }

  Widget _buildOrderAgainContent() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      height: 120.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: Colors.transparent,
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 120.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.r),
            ),
            height: 120.h,
            child: Center(
              child: Text(
                "Place an order to \n see it here",
                textAlign: TextAlign.center,
                style: AppTextStyle.smallText,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFixedHeightContainer() {
    double containerHeight = _signInController.isSignedIn.value ? 450.h : 400.h;

    return Container(
      height: containerHeight,
      width: double.infinity,
      color: const Color(0xffF1EED5FF),
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          if (_signInController.isSignedIn.value) ...[
            if (isForYouSelected)
              Positioned(
                top: -60.h,
                left: 10.w,
                right: 10.w,
                child: _buildForYouContent(),
              ),
            if (!isForYouSelected)
              Positioned(
                top: -70.h,
                left: 5.w,
                child: _buildOrderAgainContent(),
              ),
            Positioned(
              top: 80.h,
              left: 5.w,
              right: 10.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildFinancialContainer(),
                  SizedBox(width: 10.w),
                  _buildRewardsContainer(),
                ],
              ),
            ),
            Positioned(
              top: 260.h,
              left: 5.w,
              width: MediaQuery.of(context).size.width,
              child: _buildGridViewSection(),
            ),
          ] else ...[
            Positioned(
              top: -80.h,
              child: _buildRedContainers(),
            ),
            Positioned(
              top: 100.h,
              width: MediaQuery.of(context).size.width,
              child: _buildGridViewSection(),
            ),
          ],
        ],
      ),
    );
  }
}
