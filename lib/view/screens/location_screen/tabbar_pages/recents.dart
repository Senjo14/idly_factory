import 'package:flutter/material.dart';

class Recents extends StatelessWidget {
  const Recents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE3D7A6),
      body: Column(
        children: <Widget>[
          Center(
            child: Image.asset(
              "assets/file-backup.png",
              height: 250,
              width: 200,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Log In to See Recent Locations",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
          ),
          SizedBox(height: 20),
          Text("First log in or sign up for an account."),
          SizedBox(height: 20),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 120),
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              onPressed: () {},
              child: Text("SignIn"))
        ],
      ),
    );
  }
}
