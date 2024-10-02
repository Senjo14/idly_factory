
import 'package:idly_factory/constants/export.dart';


class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final BottomSheetController bottomSheetController =
      Get.put(BottomSheetController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bottomSheetController.showBottomSheet(context);
    });
  }

  int selectedIndex = 0;
  List<Widget> pages = [HomePage(email: '', isSignedIn: false,), Scan(), Discover()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (v) {
          setState(() {
            selectedIndex = v;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.document_scanner_outlined),
            label: "Scan",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border_outlined),
            label: "Discover",
          ),
        ],
      ),
    );
  }
}
