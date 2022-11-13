import 'package:explore/models/country_model.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({super.key, required this.index});

  CountryModel index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE5E5E5),
        elevation: 0,
        centerTitle: true,
        title: Text(
          index.nameCommon,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 20),
        child: ListView(
          children: [
            SizedBox(
              height: 250,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  index.imgUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text(
                  "Population: ",
                  style: TextStyle(
                    color: Color(0xFF1C1917),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                Text(
                  index.population.toString(),
                  style: const TextStyle(
                    color: Color(0xFF1C1917),
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2),
            Row(
              children: [
                const Text(
                  "Region:  ",
                  style: TextStyle(
                    color: Color(0xFF1C1917),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                Text(
                  index.region,
                  style: const TextStyle(
                    color: Color(0xFF1C1917),
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2),
            Row(
              children: [
                const Text(
                  "Capital:  ",
                  style: TextStyle(
                    color: Color(0xFF1C1917),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                Text(
                  index.capital,
                  style: const TextStyle(
                    color: Color(0xFF1C1917),
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2),
            Row(
              children: const [
                Text(
                  "Motto:  ",
                  style: TextStyle(
                    color: Color(0xFF1C1917),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "No motto",
                  style: TextStyle(
                    color: Color(0xFF1C1917),
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text(
                  "Official Language:  ",
                  style: TextStyle(
                    color: Color(0xFF1C1917),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                Text(
                  index.languages.toString(),
                  style: const TextStyle(
                    color: Color(0xFF1C1917),
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2),
            Row(
              children: [
                const Text(
                  "Ethic Group:  ",
                  style: TextStyle(
                    color: Color(0xFF1C1917),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                for (var i = 0; i < index.ethnicGroup.length; i++)
                  Text(
                    "${index.ethnicGroup[i]},   ",
                    style: const TextStyle(
                      color: Color(0xFF1C1917),
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                    ),
                  )
              ],
            ),
            const SizedBox(height: 2),
            Row(
              children: const [
                Text(
                  "Religion:  ",
                  style: TextStyle(
                    color: Color(0xFF1C1917),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "Not Found",
                  style: TextStyle(
                    color: Color(0xFF1C1917),
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2),
            Row(
              children: const [
                Text(
                  "Government:  ",
                  style: TextStyle(
                    color: Color(0xFF1C1917),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "Not Found",
                  style: TextStyle(
                    color: Color(0xFF1C1917),
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text(
                  "Independent:  ",
                  style: TextStyle(
                    color: Color(0xFF1C1917),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                Text(
                  index.independent.toString().toUpperCase(),
                  style: const TextStyle(
                    color: Color(0xFF1C1917),
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2),
            Row(
              children: [
                const Text(
                  "Area:  ",
                  style: TextStyle(
                    color: Color(0xFF1C1917),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                Text(
                  index.area.toString(),
                  style: const TextStyle(
                    color: Color(0xFF1C1917),
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  "Currency:  ",
                  style: TextStyle(
                    color: Color(0xFF1C1917),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                for (var i = 0; i < index.currency.length; i++)
                  Text(
                    "${index.currency[i]} ",
                    style: const TextStyle(
                      color: Color(0xFF1C1917),
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                    ),
                  )
              ],
            ),
            const SizedBox(height: 2),
            Row(
              children: const [
                Text(
                  "GDP: ",
                  style: TextStyle(
                    color: Color(0xFF1C1917),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text(
                  "Time zone: ",
                  style: TextStyle(
                    color: Color(0xFF1C1917),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                Text(
                  index.timezone[0].toString(),
                  style: const TextStyle(
                    color: Color(0xFF1C1917),
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                  ),
                )
              ],
            ),
            const SizedBox(height: 2),
            Row(
              children: const [
                Text(
                  "Date format: ",
                  style: TextStyle(
                    color: Color(0xFF1C1917),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'dd/mm/yyyy',
                  style: TextStyle(
                    color: Color(0xFF1C1917),
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
