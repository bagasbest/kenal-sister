import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../widget/themes.dart';

class PdfScreen extends StatefulWidget {
  final String option;

  PdfScreen({required this.option});

  @override
  State<PdfScreen> createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  String pathPDF = "";
  String uri = "";
  String fileName = "";
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();

  @override
  void initState() {
    super.initState();
    if (widget.option == 'Rangkuman Materi') {
      uri = 'assets/images/pdf_rangkuman.pdf';
      fileName = 'pdf_rangkuman.pdf';
    } else if (widget.option == "Glosarium") {
      uri = 'assets/images/pdf_glosarium.pdf';
      fileName = 'pdf_glosarium.pdf';
    } else if (widget.option == "Komponen Perangkat Input") {
      uri = 'assets/images/pdf_1_1.pdf';
      fileName = 'pdf_1_1.pdf';
    } else if (widget.option == "Komponen Perangkat Output") {
      uri = 'assets/images/pdf_1_2.pdf';
      fileName = 'pdf_1_2.pdf';
    }  else if (widget.option == "Komponen Perangkat Proses") {
      uri = 'assets/images/pdf_1_3.pdf';
      fileName = 'pdf_1_3.pdf';
    }  else if (widget.option == "Komponen Perangkat Media Penyimpanan") {
      uri = 'assets/images/pdf_1_4.pdf';
      fileName = 'pdf_1_4.pdf';
    }  else if (widget.option == "Sistem Operasi") {
      uri = 'assets/images/pdf_2_1.pdf';
      fileName = 'pdf_2_1.pdf';
    } else if (widget.option == "Aplikasi Penjelajah Internet") {
      uri = 'assets/images/pdf_2_2.pdf';
      fileName = 'pdf_2_2.pdf';
    } else if (widget.option == "Aplikasi Persuratan") {
      uri = 'assets/images/pdf_2_3.pdf';
      fileName = 'pdf_2_3.pdf';
    } else if (widget.option == "Fungsi Pengguna") {
      uri = 'assets/images/pdf_3_1.pdf';
      fileName = 'pdf_3_1.pdf';
    } else if (widget.option == "Komponen Pengguna") {
      uri = 'assets/images/pdf_3_2.pdf';
      fileName = 'pdf_3_2.pdf';
    } else if (widget.option == "Contoh Pengguna") {
      uri = 'assets/images/pdf_3_3.pdf';
      fileName = 'pdf_3_3.pdf';
    } else if (widget.option == "Komponen Utama CPU") {
      uri = 'assets/images/pdf_4_1.pdf';
      fileName = 'pdf_4_1.pdf';
    } else if (widget.option == "Cara Kerja Komputer") {
      uri = 'assets/images/pdf_4_2.pdf';
      fileName = 'pdf_4_2.pdf';
    } else if (widget.option == "Graphical User Interface (GUI)") {
      uri = 'assets/images/pdf_5_1.pdf';
      fileName = 'pdf_5_1.pdf';
    } else if (widget.option == "Antarmuka Baris Perintah (Command Line Interface)") {
      uri = 'assets/images/pdf_5_2.pdf';
      fileName = 'pdf_5_2.pdf';
    } else if (widget.option == "Melalui Perangkat Input atau Masukan") {
      uri = 'assets/images/pdf_5_3.pdf';
      fileName = 'pdf_5_3.pdf';
    } else if (widget.option == "Booting Menggunakan USB (Flashdisk)/DVD") {
      uri = 'assets/images/pdf_6_1.pdf';
      fileName = 'pdf_6_1.pdf';
    } else if (widget.option == "Instal Sistem Operasi Windows") {
      uri = 'assets/images/pdf_6_2.pdf';
      fileName = 'pdf_6_2.pdf';
    }
    fromAsset(uri, fileName).then((f) {
      setState(() {
        pathPDF = f.path;
        print(pathPDF);
      });
    });
  }

  Future<File> fromAsset(String asset, String filename) async {
    // To open from assets, you can copy them to the app storage folder, and the access them "locally"
    Completer<File> completer = Completer();

    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Themes(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.option),
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
        body: Stack(
          children: <Widget>[
            (pathPDF.isNotEmpty) ? PDFView(
              filePath: pathPDF,
              // enableSwipe: true,
              // swipeHorizontal: true,
              autoSpacing: Platform.isIOS,
              // pageFling: true,
              // pageSnap: true,
              // defaultPage: currentPage!,
              // fitPolicy: FitPolicy.BOTH,
              // preventLinkNavigation: false,
              // // if set to true the link is handled in flutter
              // onRender: (_pages) {
              //   setState(() {
              //     pages = _pages;
              //     isReady = true;
              //   });
              // },
              onError: (error) {
                setState(() {
                  errorMessage = error.toString();
                });
                print(error.toString());
              },
              // onPageError: (page, error) {
              //   setState(() {
              //     errorMessage = '$page: ${error.toString()}';
              //   });
              //   print('$page: ${error.toString()}');
              // },
              // onViewCreated: (PDFViewController pdfViewController) {
              //   _controller.complete(pdfViewController);
              // },
              // onLinkHandler: (String? uri) {
              //   print('goto uri: $uri');
              // },
              // onPageChanged: (int? page, int? total) {
              //   print('page change: $page/$total');
              //   setState(() {
              //     currentPage = page;
              //   });
              // },
            ) : CircularProgressIndicator(),
            // errorMessage.isEmpty
            //     ? !isReady
            //         ? Center(
            //             child: CircularProgressIndicator(),
            //           )
            //         : Container()
            //     : Center(
            //         child: Text(errorMessage),
            //       )
          ],
        ),
        // floatingActionButton: FutureBuilder<PDFViewController>(
        //   future: _controller.future,
        //   builder: (context, AsyncSnapshot<PDFViewController> snapshot) {
        //     if (snapshot.hasData) {
        //       return FloatingActionButton.extended(
        //         label: Text("Go to ${pages! ~/ 2}"),
        //         onPressed: () async {
        //           await snapshot.data!.setPage(pages! ~/ 2);
        //         },
        //       );
        //     }
        //
        //     return Container();
        //   },
        // ),
      ),
    );
  }
}
