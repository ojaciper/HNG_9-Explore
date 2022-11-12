import 'dart:async';
import 'dart:convert';

import 'package:explore/constants/constants.dart';
import 'package:explore/models/country_model.dart';
import 'package:http/http.dart' as http;

class CountryRespository {
  List<CountryModel> countryList = [];

  Future<List<CountryModel>> getCountry() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      var jsonList = jsonDecode(response.body) as List;
      for (var element in jsonList) {
        countryList.add(CountryModel.fromMap(element));
      }
      return countryList;
    } else {
      throw Exception("Faild to load countries");
    }
  }

  Future<void> getnote() async {
    var list = [];
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      var jsonList = jsonDecode(response.body) as List;
      for (var element in jsonList) {
        element['currencies'] != null
            ? print(element['currencies'].keys[0])
            : print("Not Fine");
      }
    }
  }
}
