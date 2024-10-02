import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../location_screen/location.dart';
import '../signup_login/signup_page.dart';

class HomePage extends StatefulWidget {
  final String email;
  final bool isSignedIn;

  const HomePage({
    super.key,
    required this.email,
    required this.isSignedIn,
  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, String> images = {
    "assets/coffee-app.png": "Order",
    "assets/offer.png": " Offers",
    "assets/delivery-bike.png": "Delivery",
    "assets/give-money.png": "Give",
    "assets/favourite.png": "Community",
    "assets/bowling.png": "Games",
    "assets/shop-bag.png": "Idly Shop",
    "assets/location.png": "Restaurant Locator",
    "assets/join-hands.png": "Join our Team",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        actions: [
          IconButton(
            onPressed: () {
              Get.to(Location());
            },
            icon: Icon(Icons.add_location_alt_outlined),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.person_2_outlined)),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    if (!widget.isSignedIn) ...[
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "Welcome to",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 22),
                            ),
                            WidgetSpan(child: SizedBox(width: 10)),
                            TextSpan(
                              text: "Idly Factory",
                              style: TextStyle(fontSize: 22, color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                          "Join now to order ahead, earn rewards, enjoy exclusive offers."),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onPressed: () {
                              Get.to(SignupPage(initialTabIndex: 0));
                            },
                            child: Text("Join Now"),
                          ),
                          SizedBox(width: 10),
                          TextButton(
                            onPressed: () {
                              // Navigate to the sign-in page
                              Get.to(SignupPage(initialTabIndex: 1));
                            },
                            child: Text(
                              "Sign In",
                              style: TextStyle(fontSize: 20, color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    ] else ...[
                      // Show user's email if signed in
                      Column(
                        children: [
                          Text("Good Evening,"),
                          Text(widget.email),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ),
            Positioned(
              top: 255,
              left: 0,
              right: 0,
              child: Container(
                color: Color(0xffE3D7A6),
                height: MediaQuery.of(context).size.height,
              ),
            ),
            Positioned(
              top: 180,
              left: 20,
              child: Container(
                height: 150,
                width: 160,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Idly Financial",
                        style: TextStyle(fontSize: 15),
                      ),
                      Center(
                        child: Image.asset(
                          "assets/card.png",
                          width: 120,
                          height: 80,
                        ),
                      ),
                      // SizedBox(height: 5),
                      Center(
                          child: Text(
                        "More ways to earn with \n Idly",
                        style: TextStyle(fontSize: 10),
                      )),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 180,
              right: 20,
              child: Container(
                height: 150,
                width: 160,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Rewards",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 350,
              left: 0,
              right: 0,
              bottom: 0,
              child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: images.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 50.0,
                    childAspectRatio: 3 / 2,
                  ),
                  itemBuilder: (context, index) {
                    String imagePath = images.keys.elementAt(index);
                    String title = images.values.elementAt(index);

                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap:(){},
                            child: Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(15),
                                ),
                                child: Image.asset(
                                  imagePath,
                                  fit: BoxFit.cover,
                                  height: 40,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          title,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
