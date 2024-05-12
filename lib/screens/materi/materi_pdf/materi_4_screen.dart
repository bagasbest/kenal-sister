import 'package:flutter/material.dart';

import '../../../widget/themes.dart';
import '../../details/pdf_screen.dart';

class Materi4Screen extends StatefulWidget {
  const Materi4Screen({Key? key}) : super(key: key);

  @override
  State<Materi4Screen> createState() => _Materi4ScreenState();
}

class _Materi4ScreenState extends State<Materi4Screen> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Themes(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('MEKANISME KERJA INTERNAL PADA KOMPUTER'),
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
                      'Sebuah sistem komputer, Central Processing Unit (CPU) merupakan komponen   terpenting dalam menjalankan tugas-tugas sistem komputer.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Peran CPU adalah untuk memindahkan program yang disimpan di memori utama dengan mengekstraksi beberapa instruksi dan memeriksanya, dan kemudian menjalankan program satu per satu sesuai dengan baris perintah.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      '1. Komponen Utama CPU',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10,),
                    InkWell(
                      onTap: () {
                        Route route = MaterialPageRoute(
                            builder: (context) => PdfScreen(option: 'Komponen Utama CPU'));
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
                      '2. Cara Kerja Komputer',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10,),
                    InkWell(
                      onTap: () {
                        Route route = MaterialPageRoute(
                            builder: (context) => PdfScreen(option: 'Cara Kerja Komputer'));
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
