import 'package:explore/models/countries_list.dart';
import 'package:explore/services/country_repository.dart';
import 'package:flutter/material.dart';

class CountriesState with ChangeNotifier {
  List<CountriesList> _countriesList = [];

  List<CountriesList> get countriesList => _countriesList;

  Future<List<CountriesList>> fetchList() async {
    _countriesList = await CountryRespository().getCountries();
    _countriesList.sort(((a, b) => a.name!.common!.compareTo(b.name!.common!)));

    notifyListeners();

    return _countriesList;
  }
}
