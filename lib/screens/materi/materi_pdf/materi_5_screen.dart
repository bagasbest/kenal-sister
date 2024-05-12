import 'package:flutter/material.dart';

import '../../../widget/themes.dart';
import '../../details/pdf_screen.dart';

class Materi5Screen extends StatefulWidget {
  const Materi5Screen({Key? key}) : super(key: key);

  @override
  State<Materi5Screen> createState() => _Materi5ScreenState();
}

class _Materi5ScreenState extends State<Materi5Screen> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Themes(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('INTERAKSI ANTARA KOMPUTER DAN PENGGUNA'),
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
                      'Interaksi antara komputer dan pengguna  adalah serangkaian proses, komunikasi atau kegiatan yang dilakukan oleh pengguna atau manusia untuk berinteraksi dengan komputer secara interaktif dengan harapan mampu menyelesaikan tugas atau masalah pada penggunanya.  ',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      '1. Graphical User Interface (GUI)',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10,),
                    InkWell(
                      onTap: () {
                        Route route = MaterialPageRoute(
                            builder: (context) => PdfScreen(option: 'Graphical User Interface (GUI)'));
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
                      '2. Antarmuka Baris Perintah (Command Line Interface)',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10,),
                    InkWell(
                      onTap: () {
                        Route route = MaterialPageRoute(
                            builder: (context) => PdfScreen(option: 'Antarmuka Baris Perintah (Command Line Interface)'));
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
                      '3. Melalui Perangkat Input atau Masukan',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10,),
                    InkWell(
                      onTap: () {
                        Route route = MaterialPageRoute(
                            builder: (context) => PdfScreen(option: 'Melalui Perangkat Input atau Masukan'));
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
