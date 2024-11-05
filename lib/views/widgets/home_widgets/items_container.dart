import 'package:idly_factory/core/export.dart';
import 'package:idly_factory/services/product_items/home_product_item_service.dart';

class ItemsContainer extends StatelessWidget {
  final String label;
  final String imagePath;

   ItemsContainer({
    Key? key,
    required this.imagePath,
    required this.label,
  }) : super(key: key);

  final itemService = ItemService();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              itemService.navigateBasedOnTitle(context, label);
            },
            splashColor: Colors.pink,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
              height: 120.h,
              width: 50.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: Colors.white,
              ),
              child: Center(
                child: Image.asset(
                  imagePath,
                   width: 300.w,
                   height: 280.h,
                ),
              ),
            ),
          ),
        ),
        5.verticalSpace,
        SizedBox(
          height: 30.h,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              label,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: AppTextStyle.smallText,
            ),
          ),
        ),
      ],
    );
  }
}
