import 'dart:convert';

import 'package:covid_19/services/util/api_url.dart';
import 'package:http/http.dart' as http;

class CountriesStateServices {
  static Future<List<dynamic>> fetchCountriesData() async {
    dynamic data = "";
    var response = await http.get(Uri.parse(ApiUrl.countriesUrl));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception("No Countries data fetched.");
    }
  }
}
