import 'package:explore/models/countries_list.dart';
import 'package:flutter/material.dart';

class Country extends StatelessWidget {
  const Country({
    Key? key,
    required this.index,
  }) : super(key: key);
  final CountriesList index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
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
                  child: index.flags!.png != null
                      ? Image.network(
                          index.flags!.png!,
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
                    index.name!.common!,
                    style: const TextStyle(
                      color: Color(0xFF1C1917),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    (index.capital!.isNotEmpty
                        ? index.capital![0]
                        : "No Capital"),
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
      ),
    );
  }
}
