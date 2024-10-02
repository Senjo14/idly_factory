import 'package:flutter/material.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE3D7A6),
      body: Column(
         mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Image.asset("assets/favourite.png",height: 200,width: 120,),
          ),
          SizedBox(height: 10),
          Text("Login to Save Favourities",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500
          ),),
          SizedBox(height: 20),
          Text(
              "To set a favourite location,first log in or\n sign up for an account."),
          SizedBox(height: 20),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 100),
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
