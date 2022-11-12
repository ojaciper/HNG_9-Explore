// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';

class CountryModel {
  final String nameCommon;
  final String nameOfficial;
  final String capital;
  final String imgUrl;
  final num population;
  final languages;
  final independent;
  CountryModel({
    required this.nameCommon,
    required this.nameOfficial,
    required this.capital,
    required this.imgUrl,
    required this.population,
    required this.languages,
    required this.independent,
  });

  factory CountryModel.fromMap(Map<String, dynamic> map) {
    return CountryModel(
      nameCommon: map['name']['common'] as String,
      nameOfficial: map['name']['official'] as String,
      capital:
          List<String>.from(map['capital']?.map((cap) => cap) ?? ['No Capital'])
              .toString()
              .replaceAll(']', '')
              .replaceAll('[', ''),
      imgUrl: map['flags'] != null ? map['flags']['png'] : null,
      population: map['population'],
      languages: map['languages'],
      independent: map["independent"],
    );
  }
}
