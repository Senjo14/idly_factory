import 'package:idly_factory/core/export.dart';

class SliverAppbar extends StatelessWidget {
  final String text;
  final bool isShow;

  const SliverAppbar({super.key, required this.text, this.isShow = true});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.symmetric(horizontal: 16.w),
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            !isShow ? text : "",
            style: AppTextStyle.silverExpand,
          ),
        ),
        centerTitle: false,
      ),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      expandedHeight: 60.0,
    );
  }
}
