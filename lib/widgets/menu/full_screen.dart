import 'dart:ffi';

import 'package:flutter/material.dart';

import '../../utilities/app_images.dart';
import '../customs/custom_iconic_bd_widget.dart';
import '../customs/custom_image_slider.dart';
import '../store/product_gridview.dart';
import 'bottom_sheets/gradient_text.dart';
import 'bottom_sheets/swap_card_widget.dart';

class FullScreen extends StatelessWidget {
  const FullScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
              const CustomImageSliderForFullScreen(),
              Positioned(
                top: 300,
                left: 0,
                right: 0,
                child: bottomWidget(context),
              ),
              Positioned(
                top: 276,
                right: 20,
                left: 20,
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 50,
                    width: 140,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: <Widget>[
                          const Text(
                            'العودة للمعرض',
                            style: TextStyle(fontSize: 12),
                          ),
                          const Spacer(),
                          Image.asset(
                            AppImages.shareIcon,
                            height: 40,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container bottomWidget(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 2;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: MediaQuery.of(context).size.height - 320,
      // width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: SingleChildScrollView(
        // primary: false,

        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            const GradientText(
              'STC قطاف من ',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
              gradient: LinearGradient(colors: [
                Color(0xff42245a),
                Color(0xff562978),
              ]),
            ),
            const SizedBox(height: 10),
            const Text(
              'هو برنامج ولاء للعملاء مقدم من شركة stc. يمكنك الاشتراك في برنا',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 10),
            const GradientText(
              'مزايا المشتركين',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
              gradient: LinearGradient(colors: [
                Color(0xfffb1781),
                Color(0xff3322f4),
              ]),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('للفئة الذهبية وأعلى'),
                const SizedBox(
                  width: 5,
                ),
                Image.asset(
                  AppImages.blackCircle,
                  height: 20,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text('للفئة الألماسية وأعلى'),
                const SizedBox(
                  width: 5,
                ),
                Image.asset(
                  AppImages.orangeCircle,
                  height: 20,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text('لكافة المشتركين'),
                const SizedBox(
                  width: 5,
                ),
                Image.asset(
                  AppImages.greenCircle,
                  height: 20,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: const CustomIconicBgWidget2(
                    icon: AppImages.musicIcon,
                    gradient: LinearGradient(
                        colors: [
                          Color(0xFF3ffa84),
                          Color(0xFF01d18f),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                    child: const Text('تجربة المنتجات الجديدة أولًا'),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: const CustomIconicBgWidget2(
                    icon: AppImages.partyIcon,
                    gradient: LinearGradient(
                        colors: [
                          Color(0xFF3ffa84),
                          Color(0xFF01d18f),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                    child: const Text('دعم فني مخصص'),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.44,
                  child: const CustomIconicBgWidget2(
                    icon: AppImages.settingIcon,
                    gradient: LinearGradient(
                        colors: [
                          Color(0xFF333333),
                          Color.fromARGB(255, 146, 145, 145),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                    child: const Text('خصومات لدى الشركاء'),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: const CustomIconicBgWidget2(
                    icon: AppImages.sofaIcon,
                    gradient: LinearGradient(
                        colors: [
                          Color(0xFF3ffa84),
                          Color(0xFF01d18f),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                    child: Text('صالات انتظار خاصة'),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: const CustomIconicBgWidget2(
                icon: AppImages.mailIcon,
                gradient: LinearGradient(
                    colors: [
                      Color(0xFFf9a930),
                      Color(0xFFeb4c3b),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
                child: const Text('دعوات للقاءات المشتركين'),
              ),
            ),
            const SizedBox(height: 10),
            const GradientText(
              'فئات الاشتراك',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
              gradient: LinearGradient(colors: [
                Color(0xfffb1781),
                Color(0xff3322f4),
              ]),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'تستطيع التقدم في الفئات عبر جمع النقاط في محفظتك واستخدامها لدى',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomProductGridView(imgList: [
              AppImages.group1,
              AppImages.group2,
              AppImages.group3,
              AppImages.group4,
            ]),
            const SizedBox(height: 10),
            const GradientText(
              'تحويل النقاط',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
              gradient: LinearGradient(colors: [
                Color(0xfffb1781),
                Color(0xff3322f4),
              ]),
            ),
            const SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                SizedBox(
                  height: width * 1.1,
                  width: width * 2,
                ),
                Positioned(
                  top: 0,
                  child: SwapCardWidget(
                    width: width,
                    text1: '2000',
                    text2: 'نقاط قطاف',
                    text3: 'نقطة',
                    text4: 'اضغط على النقاط لتجربة تحويلات أخرى',
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: SwapCardWidget(
                    width: width,
                    text1: '29.3',
                    text2: 'القيمة نقدًا',
                    text3: 'ريال',
                    text4: 'بعد التحويل',
                  ),
                ),
                Positioned(
                  top: 10,
                  bottom: 10,
                  right: 10,
                  left: 10,
                  child: Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset(AppImages.conversionIcon),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('من نقاط الفرسان ≈ 0.17 ريال'),
                const Text('100'),
                const SizedBox(
                  width: 5,
                ),
                Image.asset(
                  AppImages.cinfoIcon,
                  height: 15,
                  fit: BoxFit.fill,
                )
              ],
            ),
            const SizedBox(height: 10),
            const GradientText(
              'STC اشترك مع قطاف من',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
              gradient: LinearGradient(colors: [
                Color(0xFF3ffa84),
                Color(0xFF01d18f),
              ]),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ' الأحكام والشروط',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
                Text(
                  'باشتراكك أنت توافق على',
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
