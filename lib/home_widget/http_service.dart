import 'dart:async';
import 'dart:convert';

import 'package:covid_tracker/home_widget/models/district.dart';
import 'package:covid_tracker/home_widget/models/india.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HttpService {
  final String mainURL = "https://api.covid19india.org/data.json";
  final String stateURL =
      "https://api.covid19india.org/state_district_wise.json";

  Future<India> fetchState() async {
    final response = await http.get(mainURL);
    if (response.statusCode == 200) {
      return India.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to fetch!");
    }
  }

  Future<District> fetchDistrict() async {
    final response = await http.get(stateURL);
    if (response.statusCode == 200) {
      return District.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to fetch!");
    }
  }

  Future<String> selected() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('selectedState');
  }
}
