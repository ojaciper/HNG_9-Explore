import 'dart:async';
import 'dart:convert';
import 'package:explore/constants/constants.dart';
import 'package:explore/extension/extension.dart';
import 'package:explore/models/countries_list.dart';
import 'package:http/http.dart' as http;

class CountryRespository {
  Future<List<CountriesList>> getCountries() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final countries = countriesListFromJson(response.body.toString());
      return countries;
    } else {
      throw Exception("Faild to load countries");
    }
  }

  Future<List<String>> getTimeZone(List<CountriesList> countriesList) async {
    var list = <String>[];
    for (var i = 0; i < countriesList.length; i++) {
      var country = countriesList[i];
      if (country.timezones != null) {
        var timeZone = country.timezones!;
        list.addAllUnique(timeZone);
      }
    }
    list.sort((a, b) => a.compareTo(b));
    return list;
  }

  Future<List<String>> getRegion(List<CountriesList> countriesList) async {
    var list = <String>[];
    for (var i = 0; i < countriesList.length; i++) {
      var country = countriesList[i];
      if (country.region != null && !(list.contains(country.region))) {
        list.add(country.region.toString());
      }
    }
    list.sort((a, b) => a.compareTo(b));
    return list;
  }
}
