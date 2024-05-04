import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widget/themes.dart';

class PreTestScreen extends StatefulWidget {
  @override
  State<PreTestScreen> createState() => _PreTestScreenState();
}

class _PreTestScreenState extends State<PreTestScreen> {
  String? _selectedOption;
  var isCorrectAnswer = false;
  var isAnswerClicked = false;

  void _setSelectedOption(String? value) {
    setState(() {
      _selectedOption = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Themes(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("TES AWAL [Pertanyaan Pemantik]"),
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
                  Image.asset('assets/images/ic_mother_board.png'),
                  SizedBox(
                    height: 16,
                  ),
                  InkWell(
                    onTap: _launchUrl,
                    child: Text(
                      "https://ciburuan.wordpress.com/",
                      style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          fontSize: 12),
                    ),
                  ),
                  Text(
                    'Motherboard komputer dengan berbagai komponennya',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Berdasarkan gambar motherboard di atas, manakah komponen yang berfungsi sebagai pusat komunikasi dan pengendali semua perangkat keras yang terpasang?',
                    style: TextStyle(fontSize: 16),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ListTile(
                        leading: Radio<String>(
                          value: 'A. CPU',
                          groupValue: _selectedOption,
                          onChanged: _setSelectedOption,
                        ),
                        title: Text('A. CPU'),
                      ),
                      ListTile(
                        leading: Radio<String>(
                          value: 'B. RAM',
                          groupValue: _selectedOption,
                          onChanged: _setSelectedOption,
                        ),
                        title: Text('B. RAM'),
                      ),
                      ListTile(
                        leading: Radio<String>(
                          value: 'C. Chipset',
                          groupValue: _selectedOption,
                          onChanged: _setSelectedOption,
                        ),
                        title: Text('C. Chipset'),
                      ),
                      ListTile(
                        leading: Radio<String>(
                          value: 'D. BIOS',
                          groupValue: _selectedOption,
                          onChanged: _setSelectedOption,
                        ),
                        title: Text('D. BIOS'),
                      ),
                      ListTile(
                        leading: Radio<String>(
                          value: 'E. Harddisk',
                          groupValue: _selectedOption,
                          onChanged: _setSelectedOption,
                        ),
                        title: Text('E. Harddisk'),
                      ),
                      SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          if (_selectedOption != null &&
                              _selectedOption == "C. Chipset") {
                            setState(() {
                              isAnswerClicked = true;
                              isCorrectAnswer = true;
                            });
                          } else {
                            setState(() {
                              isAnswerClicked = true;
                              isCorrectAnswer = false;
                            });
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 24.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text(
                            'Cek Jawaban',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  (isAnswerClicked)
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            (isCorrectAnswer)
                                ? Text(
                                    'Jawaban anda benar  C. Chipset.',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : Text(
                                    'Jawaban yang benar  C. Chipset.',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Alasan mengapa jawaban lain tidak tepat:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                Text(
                                  '•  ',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  child: Text(
                                    'CPU: Meskipun CPU memainkan peran penting dalam pemrosesan data, namun CPU tidak secara langsung mengendalikan semua perangkat keras pada motherboard.',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                Text(
                                  '•  ',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  child: Text(
                                    'RAM: RAM menyimpan data sementara, bukan mengendalikan perangkat keras.',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                Text(
                                  '•  ',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  child: Text(
                                    'BIOS: BIOS hanya berfungsi pada saat booting dan pengaturan dasar hardware, tidak secara kontinu mengendalikan semua perangkat keras.',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                Text(
                                  '•  ',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  child: Text(
                                    'Harddisk: Harddisk menyimpan data, bukan mengendalikan perangkat keras.',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      : Container()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (await canLaunch("https://ciburuan.wordpress.com/")) {
      await launch("https://ciburuan.wordpress.com/");
    } else {
      throw 'Could not launch https://ciburuan.wordpress.com/';
    }
  }
}
