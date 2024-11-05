import 'package:idly_factory/core/export.dart';
import 'package:idly_factory/views/pages/home_grid/order/map_screen/map_screen.dart';
import 'package:idly_factory/widgets/common_widgets/ev_large_button.dart';

class Nearby extends StatefulWidget {
  final List<dynamic> places;
  const Nearby({super.key, required this.places});

  @override
  _NearbyState createState() => _NearbyState();
}

class _NearbyState extends State<Nearby> {
  List<bool> isFavouriteList = [];
  List<dynamic> favoritePlaces = [];

  @override
  void initState() {
    super.initState();
    isFavouriteList = List.generate(widget.places.length, (_) => false);
  }

  void toggleIcon(int index) {
    setState(() {
      isFavouriteList[index] = !isFavouriteList[index];
      var place = widget.places[index];

      if (isFavouriteList[index]) {
        favoritePlaces.add(place);
      } else {
        favoritePlaces.remove(place);
      }
    });

    if (favoritePlaces.isNotEmpty) {
      Get.toNamed("/Favourites", arguments: favoritePlaces);
    } else {
      Get.snackbar("No Favorites", "You have no favorite places.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE3D7A6),
      body: widget.places.isNotEmpty
          ? _buildNoNearbyLocations()
          : _buildPlacesList(),
    );
  }

  Widget _buildNoNearbyLocations() {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            50.verticalSpace,
            Image.asset(
              "assets/images/icons/red bag.png",
              height: 150.h,
              width: 150.w,
            ),
            20.verticalSpace,
            Text(
              "No Nearby Locations",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.sp),
            ),
             5.verticalSpace,
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: const Text(
                "No Nearby Locations are available at this time. Try entering a new address or city.",
                textAlign: TextAlign.center,
              ),
            ),
            20.verticalSpace,
            EvLargeButton(
              onPressed: () {
                Get.to(()=>const MapScreen());
              },
              text: "Share my location",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlacesList() {
    return ListView.builder(
      itemCount: widget.places.length,
      itemBuilder: (context, index) {
        var place = widget.places[index];
        return ExpansionTile(
          title: Text(place['name'] ?? "No Name Available"),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(place['distance'] ?? 'Distance not available'),
                  10.horizontalSpace,
                  Text(place['status'] ?? 'Status not available'),
                ],
              ),
              Text(place['info'] ?? 'Info not available'),
            ],
          ),
          trailing: IconButton(
            icon: Icon(isFavouriteList[index]
                ? Icons.favorite
                : Icons.favorite_border),
            onPressed: () => toggleIcon(index),
          ),
          children: [_buildPlaceDetails()],
        );
      },
    );
  }

  Widget _buildPlaceDetails() {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildIconOption(
                icon: "assets/images/logo/info.png",
                label: "Info",
                onTap: () => Get.toNamed("/shopInfo"),
              ),
              15.horizontalSpace,
              _buildIconOption(
                icon: "assets/images/logo/order.png",
                label: "Order",
                onTap: () => Get.toNamed("/orderMenu"),
              ),
            ],
          ),
          10.verticalSpace,
          const Center(
            child: Text("This store does not have mobile ordering"),
          ),
        ],
      ),
    );
  }

  Widget _buildIconOption(
      {required String icon, required String label, required VoidCallback onTap}) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: CircleAvatar(
            radius: 20.r,
            backgroundColor: Colors.red,
            child: Image.asset(icon, width: 20.w, height: 20.h),
          ),
        ),
        5.verticalSpace,
        Text(label),
      ],
    );
  }
}
