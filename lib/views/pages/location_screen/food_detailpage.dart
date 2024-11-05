import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil
import 'package:idly_factory/core/export.dart';

import 'menu list.dart';

class FoodDetailPage extends StatefulWidget {
  final FoodItem item;

  FoodDetailPage({required this.item});

  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    double totalPrice = widget.item.price * quantity;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButtons(icon: Icons.close, onPressed: (){Get.back();})
        ],
      ),
      body: Column(
        children: [
          Container(
            height: ScreenUtil().screenHeight * 0.40,
            color: Colors.grey[300],
            child: Center(child: Text("Food Image")),
          ),
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Text(
              "${widget.item.name}",
              style: AppTextStyle.subHeadLineH2,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${1.920}',style: AppTextStyle.cardTiles,),
              Text("Cals Reading",style: AppTextStyle.cardTiles,)
            ],
          ),
          DropdownButton(items: [
            
          ],onChanged: (v){},),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (quantity > 1) quantity--;
                        });
                      },
                      icon: Icon(Icons.remove),
                    ),
                    Text(
                      quantity.toString(),
                      style: TextStyle(fontSize: 18.sp),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
                      icon: Icon(Icons.add),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {

                  },
                  child: Text("\$${totalPrice.toStringAsFixed(2)}",
                      style: TextStyle(fontSize: 18.sp)),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
