import 'package:flutter/material.dart';
import 'package:kenalsister/screens/details/pdf_screen.dart';
import 'package:kenalsister/screens/materi/materi_pdf/materi_1_screen.dart';
import 'package:kenalsister/screens/materi/materi_pdf/materi_6_screen.dart';

import '../../widget/themes.dart';
import 'materi_pdf/materi_2_screen.dart';
import 'materi_pdf/materi_3_screen.dart';
import 'materi_pdf/materi_4_screen.dart';
import 'materi_pdf/materi_5_screen.dart';

class MateriPdfScreen extends StatefulWidget {

  @override
  State<MateriPdfScreen> createState() => _MateriPdfScreenState();
}

class _MateriPdfScreenState extends State<MateriPdfScreen> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Themes(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Materi PDF'),
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
          color: Color(primaryColor),
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 16,),
                  /// SAPA BELAJAR
                  InkWell(
                    onTap: () {
                      Route route = MaterialPageRoute(
                          builder: (context) => Materi1Screen());
                      Navigator.push(context, route);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/ic_materi_1.png',
                                width: 70,
                                height: 70,
                              ),
                              SizedBox(width: 16),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: Text(
                                  "Materi 1_Perangkat Keras Komputer",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  /// PDF
                  InkWell(
                    onTap: () {
                      Route route = MaterialPageRoute(
                          builder: (context) => Materi2Screen());
                      Navigator.push(context, route);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/ic_materi_2.png',
                                width: 70,
                                height: 70,
                              ),
                              SizedBox(width: 16),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: Text(
                                  'Materi 2_Perangkat Lunak Komputer',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  /// PDF
                  InkWell(
                    onTap: () {
                      Route route = MaterialPageRoute(
                          builder: (context) => Materi3Screen());
                      Navigator.push(context, route);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/ic_materi_3.png',
                                width: 70,
                                height: 70,
                              ),
                              SizedBox(width: 16),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: Text(
                                  'Materi 3_Pengguna',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  /// PDF
                  InkWell(
                    onTap: () {
                      Route route = MaterialPageRoute(
                          builder: (context) => Materi4Screen());
                      Navigator.push(context, route);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/ic_materi_4.png',
                                width: 70,
                                height: 70,
                              ),
                              SizedBox(width: 16),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: Text(
                                  'Materi 4_Mekanisme kerja internal pada Komputer',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  /// PDF
                  InkWell(
                    onTap: () {
                      Route route = MaterialPageRoute(
                          builder: (context) => Materi5Screen());
                      Navigator.push(context, route);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/ic_materi_5.png',
                                width: 70,
                                height: 70,
                              ),
                              SizedBox(width: 16),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: Text(
                                  'Materi 5_Interaksi antara pengguna dan komputer',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  /// PDF
                  InkWell(
                    onTap: () {
                      Route route = MaterialPageRoute(
                          builder: (context) => Materi6Screen());
                      Navigator.push(context, route);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/ic_materi_6.png',
                                width: 70,
                                height: 70,
                              ),
                              SizedBox(width: 16),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: Text(
                                  'Materi 6_Instalasi sistem operasi',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
