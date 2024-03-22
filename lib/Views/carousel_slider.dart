import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'dots_Indecator.dart';

final List<String> imgList = [
  'assets/111 1.png',
  'assets/111 1.png',
  'assets/111 1.png',
];

class Carousel_slider extends StatefulWidget {
  const Carousel_slider({
    super.key,
    required this.currentIndexPage,
  });

  final int currentIndexPage;

  @override
  State<Carousel_slider> createState() => _Carousel_sliderState();
}

class _Carousel_sliderState extends State<Carousel_slider> {
  int currentIndexPage = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Column(
        children: [
          Expanded(
            child: CarouselSlider(
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndexPage = index;
                  });
                },
              ),
              items: imgList.asMap().entries.map((entry) {
                int index = entry.key;
                String item = entry.value;
                return Builder(
                  builder: (BuildContext context) {
                    return Stack(
                      children: <Widget>[
                        Container(
                          child: Image.asset(
                            item,
                            fit: BoxFit.cover,
                            width: 1000,
                          ),
                        ),
                        Positioned(
                          top: 120.0,
                          left: 10.0,
                          right: 10.0,
                          child: Text(
                            'A.L.O.N.E ${currentIndexPage}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }).toList(),
            ),
          ),
          Dots_Indecator(currentIndexPage: currentIndexPage),
        ],
      ),
    );
  }
}
