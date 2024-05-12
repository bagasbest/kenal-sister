import 'package:flutter/material.dart';

import '../../../widget/themes.dart';
import '../../details/pdf_screen.dart';

class Materi3Screen extends StatefulWidget {
  const Materi3Screen({Key? key}) : super(key: key);

  @override
  State<Materi3Screen> createState() => _Materi3ScreenState();
}

class _Materi3ScreenState extends State<Materi3Screen> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Themes(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('PENGGUNA'),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pengguna (Brainware) adalah sebuah istilah yang biasa digunakan untuk seorang manusia yang berinteraksi dengan komputer. ',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Sebagai seorang pengguna juga memiliki bagian-bagian di mana sesuai dengan kemampuan dan keahliannya dalam mengoperasikan sebuah komputer. ',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      '1. Fungsi Pengguna',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10,),
                    InkWell(
                      onTap: () {
                        Route route = MaterialPageRoute(
                            builder: (context) => PdfScreen(option: 'Fungsi Pengguna'));
                        Navigator.push(context, route);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 16,
                        ),
                        child: Row(
                          children: [
                            Container(
                              child: Text(
                                'Baca Materi Selengkapnya',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              width: MediaQuery.of(context).size.width * 0.75,
                            ),
                            Icon(
                              Icons.navigate_next,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Color(yellow),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    SizedBox(height: 16,),
                    Text(
                      '2. Komponen Pengguna',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10,),
                    InkWell(
                      onTap: () {
                        Route route = MaterialPageRoute(
                            builder: (context) => PdfScreen(option: 'Komponen Pengguna'));
                        Navigator.push(context, route);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 16,
                        ),
                        child: Row(
                          children: [
                            Container(
                              child: Text(
                                'Baca Materi Selengkapnya',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              width: MediaQuery.of(context).size.width * 0.75,
                            ),
                            Icon(
                              Icons.navigate_next,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Color(yellow),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    SizedBox(height: 16,),
                    Text(
                      '3. Contoh Pengguna',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10,),
                    InkWell(
                      onTap: () {
                        Route route = MaterialPageRoute(
                            builder: (context) => PdfScreen(option: 'Contoh Pengguna'));
                        Navigator.push(context, route);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 16,
                        ),
                        child: Row(
                          children: [
                            Container(
                              child: Text(
                                'Baca Materi Selengkapnya',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              width: MediaQuery.of(context).size.width * 0.75,
                            ),
                            Icon(
                              Icons.navigate_next,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Color(yellow),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    SizedBox(height: 16,),
                  ],
                ),
            ),
          ),
        ),
      ),
    );
  }
}
