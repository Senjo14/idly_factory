import 'package:flutter/material.dart';

class Nearby extends StatelessWidget {
  const Nearby({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE3D7A6),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset("assets/red bag.png",height: 200,width: 150,),
          ),
          Text(
            "No Nearby Locations",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
          SizedBox(height: 15),
          Text(
              "No Nearby Locations are available at this \ntime.Try entering a new address or city")
        ],
      ),
    );
  }
}
