import 'package:http/http.dart' as http;
import 'dart:convert';

class BottomSheetService {
  final String apiUrl = 'https://api.example.com/get-bottom-sheet-data';

  Future<List<Map<String, dynamic>>> fetchBottomSheetData() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);

      return data.map((item) => {
        "iconPath": item["iconPath"],
        "text": item["text"],
      }).toList();
    } else {
      throw Exception('Failed to load bottom sheet data');
    }
  }
}
