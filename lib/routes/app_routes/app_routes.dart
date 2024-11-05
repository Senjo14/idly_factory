
import 'package:idly_factory/core/export.dart';
import 'package:idly_factory/views/pages/home_grid/order/pickup_tabbar/nearby/nearby_pages_widgets/menu_list.dart';
import 'package:idly_factory/views/screens/mainpage.dart';

import '../../views/pages/home_grid/order/pickup_tabbar/nearby/nearby_pages_widgets/food_detail_page.dart';
import '../../views/pages/home_grid/order/pickup_tabbar/nearby/nearby_pages_widgets/order_menupage.dart';
import '../../views/pages/home_grid/order/pickup_tabbar/nearby/nearby_pages_widgets/shop_info.dart';



class AppRoutes {
  static const String mainPage = '/mainPage';
  static const String scan = '/scan';
  static const String login = '/login';
  static const String home = '/home';
  static const String menu = '/menu';
  static const String signup = '/signup';
  static const String menuFeatureItems = '/menuList';
  static const String productDetail = '/productDetail';
  static const String cart = '/cart';
  static const String rewards = '/rewards';
  static const String order = '/order';
  static const String orderHistory = '/orderHistory';
  static const String payment = '/payment';
  static const String offers = '/offers';
  static const String shopInfo = '/shop_info';
  static const String orderMenu = '/orderMenu';
  static const String storeLocator = '/storeLocator';
  static const String orderTracking = '/orderTracking';
  static const String settings = '/settings';
  static const String help = '/help';
  static const String profile = '/profile';
  static const String timFinancial = '/timFinancial';
  static const String timFinancialProfile = '/timFinancialProfile';

  static const String support = '/support';
  static const String supportPage = '/supportPage';

  static const String splashScreen = '/splashScreen';
  static const String bottomNav = '/bottomNav';

  static final routes = [
    GetPage(name: mainPage, page: () => MainPage()),
    GetPage(name: login, page: () => SignIn()),
    GetPage(name: signup, page: () => SignupPage(initialTabIndex:0)),
    GetPage(name: home, page: () => HomePage()),
    GetPage(name: scan, page: () => Scan()),
    GetPage(name: menu, page: () => MenuPage()),
    GetPage(name: order, page: () => Order()),
    GetPage(name: menuFeatureItems, page: () => FoodDetailPage()),
    GetPage(name: productDetail, page: () => FoodDetailPage()),
    GetPage(name: cart, page: () => CartPage()),
    GetPage(name: shopInfo, page: () => ShopInfo()),
    GetPage(name: orderMenu, page: () => OrderMenuPage()),
    GetPage(name: rewards, page: () => RewardsPage()),
    GetPage(name: orderHistory, page: () => OrderHistoryPage()),
    GetPage(name: payment, page: () => PaymentMethodPage()),
    GetPage(name: offers, page: () => OffersPage()),
    GetPage(name: storeLocator, page: () => StoreLocatorPage()),
    GetPage(name: help, page: () => HelpPage()),
    GetPage(name: profile, page: () => ProfilePage()),
    GetPage(name: timFinancial, page: () => TimsFinancial()),
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: support, page: () => Support()),
    GetPage(name: supportPage, page: () => ContactUs()),
    GetPage(name: timFinancialProfile, page: () => TimsFinancialProfile()),
  ];
}
