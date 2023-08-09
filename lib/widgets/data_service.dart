import 'dart:convert';
import 'package:http/http.dart' as http;

class DataService {
  // The URL of the API endpoint on "www.boostedtechs.com"
  static const String apiUrl = 'https://www.mak.ac.ug/';

  // Function to fetch data from the API
  static Future<List<dynamic>> fetchData() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // If the API call is successful, parse the response body
        // using the jsonDecode() function from 'dart:convert' package
        return jsonDecode(response.body);
      } else {
        // If the API call fails, throw an exception
        throw Exception('Failed to load data');
      }
    } catch (e) {
      // Catch any errors that occurred during the API call
      throw Exception('Error: $e');
    }
  }
}
