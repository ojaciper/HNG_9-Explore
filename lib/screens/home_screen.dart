import 'package:explore/constants/constants.dart';
import 'package:explore/models/countries_list.dart';
import 'package:explore/provider/country_state.dart';
import 'package:explore/provider/dark_theme_provider.dart';
import 'package:explore/screens/detail_screen.dart';
import 'package:explore/widgets/country.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CountriesList>? countriesList;

  @override
  void initState() {
    super.initState();
    getList();
  }

  void getList() async {
    Future.wait([
      context.read<CountriesState>().fetchList().then((value) {
        return countriesList = value;
      })
    ]).then((value) {
      setState(() {});
      return value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isDarkActive = context.read<DarkThemeProvider>().darkTheme;

    return Scaffold(
        backgroundColor: isDarkActive ? Colors.white : const Color(0xFF000F24),
        appBar: AppBar(
          backgroundColor:
              isDarkActive ? Colors.white : const Color(0xFF000F24),
          elevation: 0,
          title: Row(
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Explore",
                style: TextStyle(
                  color: isDarkActive
                      ? Constants.primaryTextColor
                      : Constants.secondaryTextColor,
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
              onPressed: () {
                isDarkActive = !isDarkActive;
                context.read<DarkThemeProvider>().darkTheme = isDarkActive;
              },
              icon: isDarkActive
                  ? Icon(
                      Icons.nightlight_round_sharp,
                      color: isDarkActive
                          ? Constants.primaryIconColor
                          : Constants.secondaryIconColor,
                      size: 30,
                    )
                  : Icon(
                      Icons.wb_sunny_outlined,
                      color: isDarkActive
                          ? Constants.primaryIconColor
                          : Constants.secondaryIconColor,
                      size: 30,
                    ),
            ),
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
                      borderRadius: BorderRadius.circular(5),
                      color: isDarkActive
                          ? const Color(0xFFF2F4F7)
                          : const Color(0xFF98A2B3),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.search),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Search Country",
                              hintStyle: const TextStyle(),
                              filled: true,
                              fillColor: isDarkActive
                                  ? const Color(0xFFF2F4F7)
                                  : const Color(0xFF98A2B3),
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
                      InkWell(
                        onTap: () =>
                            choosenLanguage(context, size.height * 0.8),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: isDarkActive
                                  ? const Color(0xFF000F24)
                                  : const Color(0xFFA9B8D4),
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.language_outlined,
                                color: isDarkActive
                                    ? Colors.black
                                    : const Color(0xFFD0D5DD),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                "EN",
                                style: TextStyle(
                                  color: isDarkActive
                                      ? Colors.black
                                      : const Color(0xFFD0D5DD),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () =>
                            filter(context, size.height * 0.75, size.width),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: isDarkActive
                                    ? const Color(0xFF000F24)
                                    : const Color(0xFFA9B8D4),
                              ),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            children: [
                              Icon(
                                Icons.filter_list_alt,
                                color: isDarkActive
                                    ? const Color(0xFF000F24)
                                    : const Color(0xFFA9B8D4),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                "Filter",
                                style: TextStyle(
                                  color: isDarkActive
                                      ? Colors.black
                                      : const Color(0xFFD0D5DD),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: (countriesList == null)
            ? Center(
                child: CircularProgressIndicator(
                  color: isDarkActive ? Colors.black : Colors.white,
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15)
                    .copyWith(top: 25),
                child: ListView.builder(
                  itemCount: countriesList!.length,
                  itemBuilder: (context, index) {
                    var countryList = countriesList![index];

                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              index: countryList,
                            ),
                          ),
                        );
                      },
                      child: Country(index: countryList),
                    );
                  },
                ),
              ));
  }
}
