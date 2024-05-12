import 'package:flutter/material.dart';

import '../../widget/themes.dart';

class HintScreen extends StatefulWidget {
  @override
  State<HintScreen> createState() => _HintScreenState();
}

class _HintScreenState extends State<HintScreen> {
  var position = 0;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Themes(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Petunjuk Penggunaan'),
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
          actions: [
            InkWell(
                onTap: () {
                  if (position > 0) {
                    setState(() {
                      position--;
                    });
                  }
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                )),
            SizedBox(
              width: 16,
            ),
            InkWell(
                onTap: () {
                  if (position < 2) {
                    setState(() {
                      position++;
                    });
                  }
                },
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                )),
            SizedBox(
              width: 16,
            ),
          ],
        ),
        body: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  (position == 0)
                      ? 'assets/images/ic_penggunaan_1.jpg'
                      : (position == 1)
                          ? 'assets/images/ic_penggunaan_2.jpg'
                          : 'assets/images/ic_penggunaan_3.jpg',
                  width: MediaQuery.of(context).size.width,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
