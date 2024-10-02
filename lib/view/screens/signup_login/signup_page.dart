import 'package:flutter/material.dart';
import 'package:idly_factory/view/screens/signup_login/signin.dart';
import 'package:idly_factory/view/screens/signup_login/signup.dart';

class SignupPage extends StatefulWidget {
  final int initialTabIndex;

  const SignupPage({super.key, required this.initialTabIndex});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 2, vsync: this, initialIndex: widget.initialTabIndex);
  }

  @override
  void dispose() {
    _tabController.dispose(); // Dispose the TabController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    double sizes = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Join now or Sign In"),
      ),
      body: Stack(
        children: [
          // Background container
          Container(
            height: double.infinity,
            color: Colors.yellow,
          ),
          // Positioned container for tabs
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Container(
              height: size - 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    child: TabBar(
                      dividerColor: Colors.white24,
                      indicatorColor: Colors.red,
                      indicatorSize: TabBarIndicatorSize.tab,
                      controller: _tabController,
                      tabs: [
                        Tab(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Sign In",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        //Signup(),
                        SignIn()],
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
