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
    Map<String, dynamic> listMap = {};
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      var jsonList = jsonDecode(response.body) as List;
      for (var element in jsonList) {
        listMap.addAll(element['flags'].values);
        // listMap.addAll(element['coatOfArms']['png'][0]);
        print(listMap);
      }
    }
  }
}

    // element['idd']['root'] != null
    //         ? print((element['idd']['suffixes'][0]))
    //         : print("Not Fine");
