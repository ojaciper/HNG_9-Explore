import 'package:flutter/material.dart';

import 'package:explore/models/country_model.dart';

class Country extends StatelessWidget {
  const Country({
    Key? key,
    required this.index,
  }) : super(key: key);
  final CountryModel index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: index.imgUrl != null
                    ? Image.network(
                        index.imgUrl,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        "assets/no-image.png",
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                Text(
                  index.nameCommon,
                  style: const TextStyle(
                    color: Color(0xFF1C1917),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  index.capital,
                  style: const TextStyle(
                    color: Color(0xFF667085),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
