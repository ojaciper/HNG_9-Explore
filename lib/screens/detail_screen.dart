import 'package:explore/models/countries_list.dart';
import 'package:explore/widgets/image_card.dart';
import 'package:explore/widgets/text_info.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({super.key, required this.index});

  CountriesList index;

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat('#,###,000');
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE5E5E5),
        elevation: 0,
        centerTitle: true,
        title: Text(
          index.name!.common!,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 20),
        child: ListView(
          children: [
            ImageCard(index: index),
            const SizedBox(height: 10),
            TextInfo(
              title: "Population:   ",
              value: index.population,
              formatter: formatter,
            ),
            const SizedBox(height: 2),
            TextInfo(
              title: "Region:   ",
              value: index.region,
              formatter: formatter,
            ),
            const SizedBox(height: 2),
            TextInfo(
              title: "Capital:   ",
              value: (index.capital!.isNotEmpty
                  ? index.capital![0]
                  : "No Capital"),
              formatter: formatter,
            ),
            const SizedBox(height: 20),
            TextInfo(
              title: "Official Language:   ",
              value: index.languages!
                  .getLanguages()
                  .where((element) => element != null)
                  .firstWhere((element) => (element == element),
                      orElse: () => "English")
                  .toString(),
              formatter: formatter,
            ),
            const SizedBox(height: 2),
            TextInfo(
              title: "Sub Region:   ",
              value: index.subregion,
              formatter: formatter,
            ),
            const SizedBox(height: 2),
            TextInfo(
              title: "Continent:   ",
              value: index.continents!.first,
              formatter: formatter,
            ),
            const SizedBox(height: 20),
            TextInfo(
              title: "Independent:   ",
              value: index.independent! ? "YES" : "NO",
              formatter: formatter,
            ),
            const SizedBox(height: 2),
            TextInfo(
              title: "Area:   ",
              value: "${index.area!.toString()} km2",
              formatter: formatter,
            ),
            const SizedBox(height: 2),
            TextInfo(
              title: "UN-Member:   ",
              value: index.unMember! ? "YES" : "NO",
              formatter: formatter,
            ),
            const SizedBox(height: 2),
            TextInfo(
              title: "Currency:   ",
              value: (index.currencies!.bBD != null
                      ? index.currencies!.bBD!.symbol
                      : " No Currency")
                  .toString(),
              formatter: formatter,
            ),
            const SizedBox(height: 20),
            TextInfo(
              title: "Time Zone:   ",
              value: index.timezones!.first.toString(),
              formatter: formatter,
            ),
            const SizedBox(height: 2),
            TextInfo(
              title: "Date Format:   ",
              value: "dd/mm/yyyy",
              formatter: formatter,
            ),
            const SizedBox(height: 2),
            TextInfo(
              title: "Driving Side:   ",
              value: index.car!.side!.toUpperCase(),
              formatter: formatter,
            ),
            const SizedBox(height: 2),
            TextInfo(
              title: "First Day of the Week:   ",
              value: index.startOfWeek,
              formatter: formatter,
            ),
            const SizedBox(height: 2),
            TextInfo(
              title: "Latitude:   ",
              value: index.latlng!.first.toString(),
              formatter: formatter,
            ),
            const SizedBox(height: 2),
            TextInfo(
              title: "Longitude:   ",
              value: index.latlng!.last.toString(),
              formatter: formatter,
            ),
            const SizedBox(height: 2),
            TextInfo(
              title: "Official Assigned:   ",
              value: index.status,
              formatter: formatter,
            ),
          ],
        ),
      ),
    );
  }
}
