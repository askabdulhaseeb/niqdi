import 'package:flutter/material.dart';

import 'gradient_text.dart';

class SwapCardWidget extends StatelessWidget {
  const SwapCardWidget({
    required this.width,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    this.isTransaction = false,
    this.height,
    super.key,
  });

  final double width;
  final double? height;
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final bool? isTransaction;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 1.8,
      height: height ?? width * 0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color(0xfffafaf9),
        border: Border.all(color: Color(0xffe8e8e8)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                isTransaction == true
                    ? GradientText(
                        text1,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        gradient: LinearGradient(colors: [
                          Color(0xff3ffa84),
                          Color(0xff01d18f),
                        ]),
                      )
                    : Text(
                        text1,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                isTransaction == true
                    ? GradientText(
                        text2,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        gradient: LinearGradient(colors: [
                          Color(0xff3ffa84),
                          Color(0xff01d18f),
                        ]),
                      )
                    : Text(
                        text2,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  text3,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                Text(
                  text4,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  //textDirection: TextDirection.rtl,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
