import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kenalsister/screens/login_screen.dart';
import 'package:kenalsister/screens/register_screen.dart';

import '../widget/themes.dart';

class OnboardingScreen extends StatefulWidget {

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<Map<String, String>> listOfOnBoarding = [
    {
      'image': 'assets/images/icon_apk_master.jpg',
      'text': 'Tujuan Kenal Sister',
      'subtext':
          'Kenal Sister memberikan pemahaman terhadap Sistem komputer dan proses intalasi sistem operasi'
    },
    {
      'image': 'assets/images/icon_apk_master.jpg',
      'text': 'Profil Pelajar Pancasila',
      'subtext':
          'Menjadi pelajar sepanjang hayat yang memiliki kompetensi global dan berperilaku sesuai dengan nilai-nilai luhur Pancasila'
    },
    {
      'image': 'assets/images/icon_apk_master.jpg',
      'text': 'Berdoa sebelum belajar',
      'subtext':
          'Awali dengan berdoa mohon petunjuk agar dapat memahami dengan baik dan meraih keberhasilan'
    },
  ];

  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Themes(),
      child: Scaffold(
        body: Container(
          color: Color(primaryColor),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text(
                      "Selamat Datang",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                CarouselSlider(
                  options: CarouselOptions(
                      height: 400,
                      enableInfiniteScroll: false,
                      enlargeCenterPage: true,
                      aspectRatio: 2.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                  items: listOfOnBoarding.map((item) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.asset(
                                  item['image']!,
                                  width: MediaQuery.of(context).size.width,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Text(
                                  item['text']!,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Text(
                                  item['subtext']!,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }).toList(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: listOfOnBoarding.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: 30,
                        height: 5,
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color:
                            (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                                .withOpacity(
                                _current == entry.key ? 0.9 : 0.4)),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.13,
                ),
                InkWell(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: const Center(
                      child: Text(
                        'Masuk',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Route route = MaterialPageRoute(builder: (context) => LoginScreen());
                    Navigator.push(context, route);
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                InkWell(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: const Center(
                      child: Text(
                        'Registrasi',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Route route = MaterialPageRoute(
                        builder: (context) => RegisterScreen());
                    Navigator.push(context, route);
                  },
                ),

                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
