import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utilities/app_images.dart';

class CustomImageSlider extends StatefulWidget {
  const CustomImageSlider({this.list, super.key});
  final List<String>? list;

  @override
  State<CustomImageSlider> createState() => _CustomImageSliderState();
}

class _CustomImageSliderState extends State<CustomImageSlider> {
  late List<String> imgList = widget.list ??
      <String>[
        AppImages.frame1,
        AppImages.frame2,
        AppImages.frame3,
        AppImages.frame4,
      ];
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        CarouselSlider.builder(
          itemCount: imgList.length,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(imgList[index]),
                  fit: BoxFit.fill,
                ),
              ),
            );
          },
          options: CarouselOptions(
            autoPlay: true,
            autoPlayAnimationDuration: const Duration(seconds: 1),
            enlargeCenterPage: true,
            height: 160,
            onPageChanged: (int index, CarouselPageChangedReason reason) =>
                setState(() => activeIndex = index),
            //height: width,
          ),
        ),
        const SizedBox(height: 4),
        buildIndicator(context),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget buildIndicator(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: imgList.length,
      effect: WormEffect(
        dotHeight: 6,
        dotWidth: 8,
        spacing: 3,
        dotColor: const Color(0xFFD9D9D9),
        activeDotColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
