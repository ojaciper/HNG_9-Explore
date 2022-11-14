import 'package:explore/models/countries_list.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageCard extends StatefulWidget {
  CountriesList index;
  ImageCard({required this.index, super.key});

  @override
  State<ImageCard> createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  var controller = PageController();
  var seletedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          fit: StackFit.expand,
          children: [
            PageView(
              controller: controller,
              onPageChanged: (value) {
                setState(() {
                  seletedIndex = value;
                });
              },
              children: [
                Image.network(
                  widget.index.flags!.png!,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                ),
                (widget.index.coatOfArms!.png == null)
                    ? const Center(
                        child: Text("No coat of arms present"),
                      )
                    : Image.network(
                        widget.index.coatOfArms!.png!,
                        fit: BoxFit.cover,
                        loadingBuilder: ((context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        }),
                      )
              ],
            ),
            Align(
              alignment: const Alignment(-0.9, 0),
              child: GestureDetector(
                  onTap: () {
                    controller.previousPage(
                        duration: const Duration(milliseconds: 150),
                        curve: Curves.easeIn);
                  },
                  child: seletedIndex == 0
                      ? const CircleAvatar(
                          foregroundColor: Color.fromARGB(255, 255, 255, 255),
                          backgroundColor: Color.fromRGBO(238, 238, 238, 0.2),
                          radius: 18,
                          child: Center(
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: 15,
                              color: Colors.white,
                            ),
                          ),
                        )
                      : const CircleAvatar(
                          foregroundColor: Color.fromARGB(255, 255, 255, 255),
                          backgroundColor: Color.fromRGBO(238, 238, 238, 0.5),
                          radius: 20,
                          child: Center(
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Colors.white,
                            ),
                          ),
                        )),
            ),
            Align(
              alignment: const Alignment(0.9, 0),
              child: GestureDetector(
                onTap: () {
                  controller.nextPage(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeIn);
                },
                child: seletedIndex == 1
                    ? const CircleAvatar(
                        foregroundColor: Color.fromARGB(255, 255, 255, 255),
                        backgroundColor: Color.fromRGBO(238, 238, 238, 0.2),
                        radius: 18,
                        child: Center(
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      )
                    : const CircleAvatar(
                        foregroundColor: Color.fromARGB(255, 255, 255, 255),
                        backgroundColor: Color.fromRGBO(238, 238, 238, 0.5),
                        radius: 20,
                        child: Center(
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
              ),
            ),
            Align(
              alignment: const Alignment(0, 0.8),
              child: SmoothPageIndicator(
                controller: controller,
                count: 2,
                onDotClicked: (value) {
                  controller.animateToPage(value,
                      duration: const Duration(milliseconds: 350),
                      curve: Curves.easeIn);
                },
                effect: const ScrollingDotsEffect(
                  dotWidth: 8,
                  dotHeight: 8,
                  activeDotColor: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
