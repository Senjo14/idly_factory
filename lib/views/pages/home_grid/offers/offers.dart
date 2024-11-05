import 'package:idly_factory/core/export.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffE3D7A6),
        appBar: AppBar(
          title: Text(AppStrings.offers, style: AppTextStyle.subHeadLineH2),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.location_on,
                  size: 26.w, color: AppColors.iconsColor),
              onPressed: () => Get.toNamed("/storeLocator"),
            ),
            IconButton(
              icon: Icon(Icons.person, size: 26.w, color: AppColors.iconsColor),
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
            padding: EdgeInsets.all(15.w),
            child: Column(children: <Widget>[
              Container(
                width: 150.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.circular(15.r)),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(15.r),
                      ),
                      child: Image.network(
                        'https://image.freepik.com/free-vector/special-offer-sale-discount-banner_180786-46.jpg',
                        height: 80.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "14days left",
                            style: TextStyle(color: Colors.red),
                          ),
                          Text(
                            "4\$ OFF Loaded Wrap or Bowl",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          8.verticalSpace,
                          Text(
                            "When you use Tims Delivery",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.black,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          10.verticalSpace,
                          Row(
                            children: [
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Offer Details",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline),
                                  )),
                              Icon(
                                Icons.event_note_sharp,
                                size: 18,
                              )
                            ],
                          ),
                          10.verticalSpace,
                          ElevatedButton(
                            onPressed: () {},
                            child: Text("Activate"),
                            style: ElevatedButton.styleFrom(
                                shape: ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.r)),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 55, vertical: 10),
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.red),
                          )
                        ],
                      ),
                    )
                    // Container(
                    //   height: 100.h,
                    //   width: double.infinity,
                    //   decoration: BoxDecoration(border: Border.all(color: Colors.brown)),
                    //   child: Row(
                    //     children: <Widget>[
                    //       Padding(
                    //         padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    //         child: Row(
                    //           children: [
                    //             Icon(Icons.explore_off_outlined),
                    //             SizedBox(width: 15.w),
                    //             Text(
                    //               "Your offers are on their way.\n "
                    //                   "Sit tight and check back again soon for more \n delicious deals.",
                    //               style: AppTextStyle.smallText,
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ])));
  }
}
