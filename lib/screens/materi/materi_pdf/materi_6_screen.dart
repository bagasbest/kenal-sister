import 'package:flutter/material.dart';

import '../../../widget/themes.dart';
import '../../details/pdf_screen.dart';

class Materi6Screen extends StatefulWidget {
  const Materi6Screen({Key? key}) : super(key: key);

  @override
  State<Materi6Screen> createState() => _Materi6ScreenState();
}

class _Materi6ScreenState extends State<Materi6Screen> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Themes(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('INSTALASI SISTEM OPERASI'),
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
                      'Instalasi adalah pemasangan perangkat lunak pada sistem computer. ',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Instalasi Sistem Operasi adalah pemasangan sistem operasi pada sistem computer.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Sistem operasi akan dipasang terlebih dahulu dibanding perangkat lunak yang lain. Perangkat lunak yang lain baru bisa dijalankan setelah sistem operasi terinstal dengan benar.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      '1. Booting Menggunakan USB (Flashdisk)/DVD',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10,),
                    InkWell(
                      onTap: () {
                        Route route = MaterialPageRoute(
                            builder: (context) => PdfScreen(option: 'Booting Menggunakan USB (Flashdisk)/DVD'));
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
                      '2. Instal Sistem Operasi Windows',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10,),
                    InkWell(
                      onTap: () {
                        Route route = MaterialPageRoute(
                            builder: (context) => PdfScreen(option: 'Instal Sistem Operasi Windows'));
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
