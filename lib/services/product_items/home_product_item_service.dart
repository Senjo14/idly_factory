
import 'package:idly_factory/core/export.dart';
import 'package:idly_factory/views/pages/home_grid/order/order.dart';

import '../../views/pages/home_grid/community_give/community.dart';

class ItemService {
  final Map<String, WidgetBuilder> routes = {
    "Order": (context) => Order(),
    "Give": (context) => GivePage(),
    "Offers": (context) => OffersPage(),
    "Delivery": (context) => Delivery(),
    "Community": (context) => CommunityPage(),
    "Games": (context) => TimeWordChallenge(),
    "Idly Shop": (context) => IdlyShop(),
    "Restaurant Locator": (context) => Order(),
    "Join our Team": (context) => JoinOurTeam(),
  };

  void navigateBasedOnTitle(BuildContext context, String title) {
    final route = routes[title];
    if (route != null) {
      Navigator.push(context, MaterialPageRoute(builder: route));
    }
  }
}