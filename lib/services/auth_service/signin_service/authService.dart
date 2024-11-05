import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthService extends GetxService {
  final GetStorage _storage = GetStorage();
  final RxBool _isSignedIn = true.obs;

  String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return "Good Morning!";
    } else if (hour < 18) {
      return "Good Afternoon!";
    } else {
      return "Good Evening!";
    }
  }



  Future<AuthService> init() async {
    _isSignedIn.value = _storage.read('isSignedIn') ?? false;
    return this;
  }

  bool get isSignedIn => _isSignedIn.value;

  void signIn(String token) {
    _isSignedIn.value = true;
    _storage.write('isSignedIn', true);
    _storage.write('token', token);
  }

  void signOut() {
    _isSignedIn.value = false;
    _storage.remove('isSignedIn');
    _storage.remove('token');
  }
}
