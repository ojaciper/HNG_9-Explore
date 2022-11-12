import 'package:explore/models/country_model.dart';
import 'package:explore/screens/detail_screen.dart';
import 'package:explore/services/country_repository.dart';
import 'package:explore/widgets/country.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CountryRespository countryRespository = CountryRespository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              "Explore",
              style: TextStyle(
                color: Color(0xFF001637),
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 5),
            Container(
              height: 5,
              width: 5,
              decoration: BoxDecoration(
                color: const Color(0xFFFF6C00),
                borderRadius: BorderRadius.circular(30),
              ),
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.light_mode,
                color: Color(0xFF1C1917),
              )),
          const SizedBox(width: 10)
        ],
        toolbarHeight: 150,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F4F7),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.search),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: const TextField(
                          decoration: InputDecoration(
                            hintText: "Search Country",
                            hintStyle: TextStyle(),
                            filled: true,
                            fillColor: Color(0xFFF2F4F7),
                            border: InputBorder.none,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFFA9B8D4),
                          ),
                          borderRadius: BorderRadius.circular(5)),
                      child: InkWell(
                        onTap: (() {
                          countryRespository.getnote();
                        }),
                        child: Row(
                          children: const [
                            Icon(Icons.wordpress_outlined),
                            SizedBox(width: 5),
                            Text("EN"),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFFA9B8D4),
                          ),
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        children: const [
                          Icon(Icons.filter_list_alt),
                          SizedBox(width: 5),
                          Text("Filter"),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 15),
        child: FutureBuilder(
          future: countryRespository.getCountry(),
          builder: ((context, AsyncSnapshot<List<CountryModel>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: ((context, index) {
                  var snapshotName = snapshot.data![index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              index: snapshotName,
                            ),
                          ),
                        );
                      },
                      child: Country(index: snapshotName),
                    ),
                  );
                }),
              );
            }
            return const Center(child: CircularProgressIndicator());
          }),
        ),
      ),
    );
  }
}
