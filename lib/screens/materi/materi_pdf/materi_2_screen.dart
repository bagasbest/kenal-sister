import 'package:flutter/material.dart';

import '../../../widget/themes.dart';
import '../../details/pdf_screen.dart';

class Materi2Screen extends StatefulWidget {
  const Materi2Screen({Key? key}) : super(key: key);

  @override
  State<Materi2Screen> createState() => _Materi2ScreenState();
}

class _Materi2ScreenState extends State<Materi2Screen> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Themes(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('PERANGKAT LUNAK KOMPUTER'),
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
                      'Perangkat lunak atau bisa disebut dengan software adalah sebuah data pada sebuah sistem komputer yang disimpan secara digital, termasuk program komputer dari berbagai informasi yang dapat dibaca dan ditulis oleh komputer.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      ' Sistem komputer pada perangkat lunak tidak memiliki wujud secara fisik.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      '1. Sistem Operasi',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10,),
                    InkWell(
                      onTap: () {
                        Route route = MaterialPageRoute(
                            builder: (context) => PdfScreen(option: 'Sistem Operasi'));
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
                      '2. Aplikasi Penjelajah Internet',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10,),
                    InkWell(
                      onTap: () {
                        Route route = MaterialPageRoute(
                            builder: (context) => PdfScreen(option: 'Aplikasi Penjelajah Internet'));
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
                      '3. Aplikasi Persuratan',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10,),
                    InkWell(
                      onTap: () {
                        Route route = MaterialPageRoute(
                            builder: (context) => PdfScreen(option: 'Aplikasi Persuratan'));
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
