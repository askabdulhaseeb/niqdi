import 'package:flutter/material.dart';

class SwapCardWidget extends StatelessWidget {
  const SwapCardWidget({
    required this.width,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    super.key,
  });

  final double width;
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 1.8,
      height: width * 0.5,
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
                Text(
                  text1,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  text2,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  //textDirection: TextDirection.rtl,
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
