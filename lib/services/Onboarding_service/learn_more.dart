import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:idly_factory/models/general/onboard_learnmore.dart';

class BenefitService {
  final String apiUrl =
      "https://example.com/api/benefits";

  Future<List<Benefit>> fetchBenefits() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((benefit) => Benefit.fromJson(benefit)).toList();
    } else {
      throw Exception('Failed to load benefits');
    }
  }
}
