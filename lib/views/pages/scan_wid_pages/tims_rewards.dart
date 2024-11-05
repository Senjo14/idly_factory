import 'package:idly_factory/core/export.dart';
import 'package:idly_factory/views/pages/scan_wid_pages/qr_code.dart';
import 'package:idly_factory/widgets/common_widgets/ev_large_button.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class TimsRewards extends StatelessWidget {
  const TimsRewards({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TimsRewardsViewModel(),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(12.w),
          child: SingleChildScrollView(
            child: Consumer<TimsRewardsViewModel>(
              builder: (context, viewModel, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(AppStrings.timsRewards,
                            style: AppTextStyle.idlyFactory),
                        Text("0 Points", style: AppTextStyle.mainHeader),
                      ],
                    ),
                    10.verticalSpace,
                    Center(
                        child: Text(AppStrings.scanForTimsRewards,
                            style: AppTextStyle.scanForTimRewards)),
                    Center(
                        child: Text(AppStrings.scanToEarnPoints,
                            style: AppTextStyle.silverExpand)),
                    20.verticalSpace,
                    QrCode(qrData: viewModel.data),
                    10.verticalSpace,
                    Center(
                        child: Text(AppStrings.yourTimsRewardsNumber,
                            style: AppTextStyle.bodyText)),
                    5.verticalSpace,
                    Center(
                        child: Text(viewModel.data,
                            style: TextStyle(color: Colors.black54))),
                    5.verticalSpace,
                    Divider(color: Colors.grey, height: 8.h),
                    10.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(AppStrings.redeemMyPoints,
                            style: AppTextStyle.sectionTitlesH3),
                        IconButton(
                          onPressed: () {
                            viewModel.toggleFavorite();
                          },
                          icon: Icon(
                            viewModel.isFavorite
                                ? Icons.toggle_on
                                : Icons.toggle_off,
                            color:
                                viewModel.isFavorite ? Colors.red : Colors.grey,
                            size: 50.w,
                          ),
                        ),
                      ],
                    ),
                    15.verticalSpace,
                    viewModel.isLoading
                        ? _buildShimmerEffect()
                        : _buildRewardsInfo(viewModel),
                    Divider(color: Colors.grey, height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(AppStrings.scanAndPay,
                            style: AppTextStyle.cardTiles),
                        Icon(Icons.credit_card_rounded, size: 24.sp),
                      ],
                    ),
                    5.verticalSpace,
                    Text(
                      "Checkout faster to earn points, pay for your order, and use rewards with a single scan.",
                      style: AppTextStyle.textForCardDescription
                    ),
                    10.verticalSpace,
                    EvLargeButton(
                      text: AppStrings.addPaymentMethod,
                      onPressed: () {
                        // Action for adding payment method
                      },
                    ),
                    Divider(height: 8.h),
                    ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(AppStrings.linkPhysicalRewardsCard,
                              style: AppTextStyle.cardTiles),
                          const Icon(Icons.keyboard_arrow_right),
                        ],
                      ),
                    ),
                    5.verticalSpace,
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildShimmerEffect() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[300]!,
      period: Duration(milliseconds: 800),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          shimmerContainer(350.w, 20.h, Colors.grey[300]!),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              shimmerContainer(150.w, 20.h, Colors.grey[300]!),
              shimmerContainer(50.w, 20.h, Colors.grey[300]!),
            ],
          ),
          SizedBox(height: 5.h), // Use SizedBox for spacing
          shimmerContainer(350.w, 20.h, Colors.grey[300]!),
        ],
      ),
    );
  }

  Container shimmerContainer(double width, height, Color color) => Container(
        width: width,
        height: height,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(15.r), color: color),
      );

  Widget _buildRewardsInfo(TimsRewardsViewModel viewModel) {
    // Displaying the current state of rewards
    return viewModel.isFavorite
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppStrings.chosenRewardLevel,
                  style: AppTextStyle.sectionTitlesH3),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Brewed Coffee and Tea",
                      style: TextStyle(fontSize: 16.sp)),
                  Text("400", style: TextStyle(fontSize: 16.sp)),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Text("Choose Reward Level",
                    style: AppTextStyle.errorMessages),
              ),
            ],
          )
        : Text("You're currently banking your Points",
            style: AppTextStyle.bodyText);
  }
}

class TimsRewardsViewModel extends ChangeNotifier {
  String data = "SENT-WELC-IDLY-0001";
  bool isFavorite = false;
  bool isLoading = false;

  void toggleFavorite() {
    isLoading = true;
    notifyListeners();

    Future.delayed(Duration(seconds: 1), () {
      isFavorite = !isFavorite;
      isLoading = false;
      notifyListeners();
    });
  }

  String get rewardsNumber => data;

  String get rewardsStatus =>
      isFavorite ? "Points redeemed!" : "Points not redeemed.";
}
