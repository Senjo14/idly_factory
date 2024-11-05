import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SupportSubmit extends StatefulWidget {
  final List<String> title;
  const SupportSubmit({super.key, required this.title, });

  @override
  State<SupportSubmit> createState() => _SupportSubmitState();
}

class _SupportSubmitState extends State<SupportSubmit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Support"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.location_on),
            onPressed: () => Get.toNamed("/storeLocator"),
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () => Get.toNamed("/login"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.red),
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Back to topics",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Text(
                "Roll Up To Win",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15.0),
              Text(widget.title.toString(),
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 15.0),
              Container(
                height: 100,
                width: double.infinity,
                child: Center(
                  child: Text(
                    "We are so sorry you experienced an issue with your order, please describe your issue below.",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                decoration: BoxDecoration(border: Border.all(color: Colors.black87)),
              ),
              SizedBox(height: 20.0),

              // // Using the reusable ExpandableInkWell
              // ExpandableInkWell(
              //   title: "I made a purchase, why am I missing roll(s)?",
              //   content:
              //   "If you’ve made a qualifying purchase and haven’t received your roll(s), it could be due to processing delays. Please wait a few moments or contact our support for further assistance.",
              // ),
              // SizedBox(height: 20.0),
              // ExpandableInkWell(
              //   title: "How do I redeem my roll(s)?",
              //   content:
              //   "To redeem your roll(s), simply navigate to the rewards section in the app, select your reward, and follow the on-screen instructions.",
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
