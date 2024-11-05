import 'package:idly_factory/core/export.dart';

class RewardsContainer extends StatelessWidget {
  final int points;

  const RewardsContainer({
    super.key,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: Colors.white,
      ),
      width: 150.w,
      height: 140.h,
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(flex: 1,
              child: Center(
                child: Text(
                  AppStrings.rewards,
                  textAlign: TextAlign.start,
                  style: AppTextStyle.bodyText,
                ),
              ),
            ),
            5.verticalSpace,
            Flexible(
              flex: 2,
              child: Center(
                child: TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0, end: points.toDouble()),
                  duration: const Duration(seconds: 3),
                  curve: Curves.easeOut,
                  builder: (context, value, child) {
                    return Text(
                      value.toInt().toString(),
                      style: AppTextStyle.errorMessages
                    );
                  },
                ),
              ),
            ),
            Center(child: Text(AppStrings.points.tr)),
            5.verticalSpace,
            Flexible(
              flex: 1,
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      width: 150.w,
                      height: 10.h,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    Container(
                      width: 150 * (points / 100),
                      height: 10.h,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            5.verticalSpace,
            Flexible(
              flex: 2,
              child: Text(
                "Earn Points with every Order",
                style: AppTextStyle.smallText,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RewardsAnimatedProgress extends StatefulWidget {
  final int points;

  const RewardsAnimatedProgress({
    Key? key,
    required this.points,
  }) : super(key: key);

  @override
  _RewardsAnimatedProgressState createState() =>
      _RewardsAnimatedProgressState();
}

class _RewardsAnimatedProgressState extends State<RewardsAnimatedProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        double points = widget.points * _animation.value;
        return Column(
          children: [
            Text(
              '${points.toInt()} Points',
              style: AppTextStyle.errorMessages),
            10.verticalSpace,
            Stack(
              children: [
                Container(
                  width: 200.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                Container(
                  width: 200 * (points / 100),
                  height: 20.h,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
