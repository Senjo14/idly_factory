// controllers/benefit_controller.dart
import 'package:get/get.dart';
import 'package:idly_factory/models/general/onboard_learnmore.dart';
import 'package:idly_factory/services/Onboarding_service/learn_more.dart';


class BenefitController extends GetxController {
  var benefits = <Benefit>[].obs;
  var isLoading = true.obs;

  final BenefitService _benefitService = BenefitService();

  @override
  void onInit() {
    fetchBenefits();
    super.onInit();
  }

  void fetchBenefits() async {
    try {
      isLoading(true);
      var fetchedBenefits = await _benefitService.fetchBenefits();
      benefits.assignAll(fetchedBenefits);
    } finally {
      isLoading(false);
    }
  }
}
