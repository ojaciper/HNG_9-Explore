class CountryModel {
  final String nameCommon;
  final String nameOfficial;
  final String capital;
  final String imgUrl;
  final num population;
  final String languages;
  final independent;
  final String region;
  final ethnicGroup;
  final double area;
  final currency;

  CountryModel({
    required this.nameCommon,
    required this.nameOfficial,
    required this.capital,
    required this.imgUrl,
    required this.population,
    required this.languages,
    required this.independent,
    required this.region,
    required this.ethnicGroup,
    required this.area,
    required this.currency,
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
      languages: map['languages'] != null
          ? map['languages'].values.toList()[0]
          : "No official language",
      independent: map["independent"],
      region: map['region'] != null ? map['region'] : "",
      ethnicGroup: map['languages'] != null
          ? map['languages'].values.toList()
          : "No official language",
      area: map['area'] ?? 0.0,
      currency:
          map['currencies'] != null ? map['currencies'].keys.toList() : "",
    );
  }
}
