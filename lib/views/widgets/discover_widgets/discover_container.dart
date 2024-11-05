import 'package:idly_factory/core/export.dart';

class DiscoverContainer extends StatelessWidget {
  const DiscoverContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 12.w, right: 12.w, top: 12.h, bottom: 12.h),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 3.h, horizontal: 5.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              blurRadius: 10.0,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(15.r),
              ),
              child: Image.network(
                'https://image.freepik.com/free-vector/special-offer-sale-discount-banner_180786-46.jpg',
                height: 150.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Food is Life",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  8.verticalSpace,
                  Text(
                    "Food is any substance consumed by an organism for nutritional support. Food is usually of plant, animal, or fungal origin and contains essential nutrients such as carbohydrates, fats, proteins, vitamins, or minerals.",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 10.h),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 3.h),
                          side: const BorderSide(color: Colors.red),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r))),
                      onPressed: () {},
                      child: Text(
                        "Start Your Order",
                        style: AppTextStyle.errorMessages,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
