import 'package:flutter/material.dart';
import 'package:kenalsister/screens/details/pdf_screen.dart';

import '../../../widget/themes.dart';

class Materi1Screen extends StatefulWidget {
  @override
  State<Materi1Screen> createState() => _Materi1ScreenState();
}

class _Materi1ScreenState extends State<Materi1Screen> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Themes(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('PERANGKAT KERAS KOMPUTER'),
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
                    'Perangkat keras atau hardware komponen fisik dalam suatu sistem komputer.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    '1. Komponen Perangkat Input',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: () {
                      Route route = MaterialPageRoute(
                          builder: (context) => PdfScreen(option: 'Komponen Perangkat Input'));
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
                    '2. Komponen Perangkat Output',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: () {
                      Route route = MaterialPageRoute(
                          builder: (context) => PdfScreen(option: 'Komponen Perangkat Output'));
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
                    '3. Komponen Perangkat Proses',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: () {
                      Route route = MaterialPageRoute(
                          builder: (context) => PdfScreen(option: 'Komponen Perangkat Proses'));
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
                    '4. Komponen Perangkat Media Penyimpanan',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: () {
                      Route route = MaterialPageRoute(
                          builder: (context) => PdfScreen(option: 'Komponen Perangkat Media Penyimpanan'));
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
