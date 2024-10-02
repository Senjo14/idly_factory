import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Delivery extends StatefulWidget {
  const Delivery({super.key});

  @override
  State<Delivery> createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE3D7A6),
      appBar: AppBar(
        title: Text("Delivery"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 50),
            Text(
              "Enter your address",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 25),
            TextField(
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                  hintText: "Delivery Address",
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5))),
            ),
            SizedBox(height: 15),
            Text(
              "Unit can be entered during checkout",
              style: TextStyle(
                letterSpacing: 2,
                fontWeight: FontWeight.w200,
                fontSize: 16,
                color: Colors.red,
              ),
            ),
            SizedBox(height: 20),
            Text.rich(
              TextSpan(
                text: "Delivery Terms and Fees Apply.\n",
                style: TextStyle(fontSize: 12),
                children: [
                  TextSpan(
                    text: "Click Here for Details.",
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print("Details Clicked");
                      },
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
                side: BorderSide(
                  color: Colors.brown,
                  width: 0.5,
                ),
              ),
              onPressed: () {

              },
              child: Text("Delivery Here"),
            ),
          ],
        ),
      ),
    );
  }
}
