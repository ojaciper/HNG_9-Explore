import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              "Explore",
              style: TextStyle(
                color: Color(0xFF001637),
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '.',
              style: TextStyle(color: Colors.red, fontSize: 50),
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
                      child: Row(
                        children: const [
                          Icon(Icons.wordpress_outlined),
                          SizedBox(width: 5),
                          Text("EN"),
                        ],
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
    );
  }
}
