import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import 'carousel_slider.dart';

class Dots_Indecator extends StatelessWidget {
  const Dots_Indecator({
    super.key,
    required this.currentIndexPage,
  });

  final int currentIndexPage;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: imgList.length,
      position: currentIndexPage,
      decorator: DotsDecorator(
          color: Colors.grey,
          activeColor: Colors.red,
          size: const Size.square(9.0),
          activeSize: const Size(18.0, 9.0),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))),
    );
  }
}
