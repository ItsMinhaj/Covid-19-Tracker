import 'dart:convert';

import 'package:covid_19/model/world_state_model.dart';
import 'package:covid_19/services/util/api_url.dart';
import 'package:http/http.dart' as http;

class WorldSateServices {
  static Future<WorldStateModel> fetchWorldStateData() async {
    var response = await http.get(Uri.parse(ApiUrl.worldStateUrl));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      print("World state data fetched.");
      return WorldStateModel.fromJson(data);
    } else {
      print("No data fetched");
      throw Exception("Error");
    }
  }
}
