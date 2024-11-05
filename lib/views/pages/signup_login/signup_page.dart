
import 'package:idly_factory/core/export.dart';
import 'package:idly_factory/views/pages/signup_login/signup.dart';

class SignupPage extends StatefulWidget {
  final int initialTabIndex;

  const SignupPage({super.key, required this.initialTabIndex});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: widget.initialTabIndex,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppStrings.joinNowOrSignIn.tr),
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            color: const Color(0xfffccfff),
          ),
          Positioned(
            top: 170.h,
            left: 0,
            right: 0,
            child: Container(
              height: ScreenUtil().screenHeight - 150.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25.r),
                  topLeft: Radius.circular(25.r),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 50.h,
                    child: TabBar(
                      dividerColor: Colors.white24,
                      indicatorColor: Colors.red,
                      indicatorSize: TabBarIndicatorSize.tab,
                      controller: _tabController,
                      tabs: [
                        Tab(
                          child: Text(
                            AppStrings.signUp.tr,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            AppStrings.signIn.tr,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children:[
                        Signup(),
                       SignIn(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
