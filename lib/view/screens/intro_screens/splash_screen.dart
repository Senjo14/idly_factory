import 'package:idly_factory/constants/export.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: 0.8).animate(_controller);
    _controller.forward();

    Future.delayed(
      Duration(seconds: 5),
      () {
        Get.offAll(() => LanguageRegion());
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: CircleAvatar(
            radius: h * 0.2,
            backgroundImage:
                const AssetImage("assets/images/logo/factory_logo.jpg"),
          ),
        ),
      ),
    );
  }
}
