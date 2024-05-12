import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kenalsister/database/database.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

import '../../widget/themes.dart';

class FinalTestScreen extends StatefulWidget {
  @override
  State<FinalTestScreen> createState() => _FinalTestScreenState();
}

class _FinalTestScreenState extends State<FinalTestScreen> {
  String? selectedOption1;
  String? selectedOption2;
  String? selectedOption3;
  String? selectedOption4;
  String? selectedOption5;
  String? selectedOption6;
  String? selectedOption7;
  String? selectedOption8;
  String? selectedOption9;
  String? selectedOption10;
  String? selectedOption11;
  String? selectedOption12;
  String? selectedOption13;
  String? selectedOption14;
  String? selectedOption15;
  String? selectedOption16;
  String? selectedOption17;
  String? selectedOption18;
  String? selectedOption19;
  String? selectedOption20;
  var name = "";
  var score = "0";
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  bool setFinished = false;
  ScrollController _scrollController = ScrollController();

  List explanation12 = [
    'Dalam kode biner, setiap digit memiliki nilai posisional.',
    'Digit paling kanan memiliki nilai 2^0 = 1.',
    'Digit kedua dari kanan memiliki nilai 2^1 = 2.',
    'Digit ketiga dari kanan memiliki nilai 2^2 = 4.',
    'Digit paling kiri memiliki nilai 2^3 = 8.'
  ];

  List explanation13 = [
    'Ikon di desktop merupakan representasi visual dari program dan aplikasi yang terinstal di komputer.',
    'Ketika pengguna mengklik dua kali ikon, program atau aplikasi yang terkait akan diluncurkan.',
    'Ketika pengguna mengklik dua kali ikon, program atau aplikasi yang terkait akan diluncurkan.',
  ];

  List explanation14 = [
    'Di CLI, pengguna mengetikkan perintah teks untuk melakukan berbagai tindakan, seperti menjalankan program, mengelola file, dan mengkonfigurasi sistem.',
    'Perintah-perintah ini harus diketik dengan benar dan diakhiri dengan menekan tombol Enter.',
    'Komputer akan mengevaluasi perintah dan memberikan hasil atau pesan respons.',
  ];

  List explanation15 = [
    'Proses booting dari USB flash drive memungkinkan komputer untuk memulai dan menjalankan sistem operasi dari media penyimpanan eksternal, bukan dari hard disk internal.',
    'Saat komputer dinyalakan, BIOS (Basic Input/Output System) akan mencari media bootable yang terhubung ke komputer.',
    'Jika USB flash drive terdeteksi dan berisi file sistem operasi yang kompatibel, BIOS akan memuat file-file tersebut ke dalam memori komputer.',
    'Sistem operasi kemudian akan dijalankan dari memori dan komputer dapat digunakan seperti biasa.',
  ];

  List explanation16 = [
    'Teknisi perangkat keras harus membantu pengguna membeli hard disk 1 TB yang kompatibel dengan komputernya.',
    'Teknisi perangkat keras juga harus membantu pengguna menyalin data dari hard disk lama ke hard disk baru agar data tidak hilang.',
    'Setelah data disalin, teknisi perangkat keras harus memformat ulang hard disk baru untuk mempersiapkannya untuk digunakan.',
    'Terakhir, teknisi perangkat keras harus membantu pengguna menginstal ulang sistem operasi pada hard disk baru agar komputer dapat boot dan bekerja dengan benar.',
  ];

  List explanation17 = [
    'Kemungkinan besar masalah pada laptop disebabkan oleh driver Wi-Fi yang tidak terinstal dengan benar.',
    'Teknisi perangkat keras harus mengunduh dan menginstal driver Wi-Fi yang terbaru dan kompatibel dengan laptop pengguna.',
    'Jika masalah teratasi setelah driver Wi-Fi diinstal dengan benar, maka tidak perlu mengganti kartu Wi-Fi, menginstal ulang sistem operasi, atau mereset pengaturan jaringan laptop.',
  ];

  List explanation19 = [
    'Prosesor: Prosesor 64-bit dengan minimal 2 core pada frekuensi 1 GHz.',
    'RAM: Minimal 4 GB.',
    'Penyimpanan internal: Minimal 64 GB.',
    'Chip TPM: Chip TPM 2.0 diperlukan untuk fitur keamanan yang ditingkatkan di Windows 11.',
    'Kartu grafis: Kartu grafis yang kompatibel dengan DirectX 12 atau versi terbaru.',
  ];

  @override
  void initState() {
    super.initState();
    _getUserScoreAndName();
    _controller = VideoPlayerController.asset('assets/videos/vc_soal_19.mp4');
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      setState(() {});
    });
    _controller.addListener(() {
      setState(() {});
    });
  }

  _setSelectedOption(String? value, String position) {
    setState(() {
      print(position);
      if (position == '1') {
        selectedOption1 = value;
      } else if (position == '2') {
        selectedOption2 = value;
      } else if (position == '3') {
        selectedOption3 = value;
      } else if (position == '4') {
        selectedOption4 = value;
      } else if (position == '5') {
        selectedOption5 = value;
      } else if (position == '6') {
        selectedOption6 = value;
      } else if (position == '7') {
        selectedOption7 = value;
      } else if (position == '8') {
        selectedOption8 = value;
      } else if (position == '9') {
        selectedOption9 = value;
      } else if (position == '10') {
        selectedOption10 = value;
      } else if (position == '11') {
        selectedOption11 = value;
      } else if (position == '12') {
        selectedOption12 = value;
      } else if (position == '13') {
        selectedOption13 = value;
      } else if (position == '14') {
        selectedOption14 = value;
      } else if (position == '15') {
        selectedOption15 = value;
      } else if (position == '16') {
        selectedOption16 = value;
      } else if (position == '17') {
        selectedOption17 = value;
      } else if (position == '18') {
        selectedOption18 = value;
      } else if (position == '19') {
        selectedOption19 = value;
      } else if (position == '20') {
        selectedOption20 = value;
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Themes(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tes Akhir [Evaluasi]'),
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
            controller: _scrollController,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nama: $name',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Skor Tes Akhir: $score',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  (int.parse(score) > 70)
                      ? Text(
                          'Kamu sudah mengerjakan tes akhir dengan baik, nilai kamu diatas Passing Grade/KKM, Selamat!',
                        )
                      : Text(
                          'Kamu belum mengerjakan tes akhir dengan maksimal, nilai kamu masih dibawah Passing Grade/KKM, Ayo semangat!',
                        ),
                  SizedBox(
                    height: 25,
                  ),
                  QuestionWidget(
                    'Soal 1 - Komponen Perangkat Proses',
                    'assets/images/ic_soal_1.jpg',
                    'www.boomplay.com',
                    'Komponen perangkat keras yang berfungsi sebagai "otak" komputer dan mengolah semua instruksi dan data disebut?',
                    'A. Motherboard',
                    'B. CPU (Central Processing Unit)',
                    'C. RAM (Random Access Memory)',
                    'D. Hard Disk Drive (HDD)',
                    '',
                    setFinished,
                    '1',
                    ": B. CPU (Central Processing Unit)",
                    ": CPU merupakan komponen penting dalam sistem komputer yang bertugas memproses semua instruksi dan data yang diterima dari berbagai perangkat keras lain. CPU sering disebut sebagai \"otak\" komputer karena perannya yang sangat penting dalam menjalankan semua operasi komputer.",
                  ),
                  QuestionWidget(
                    'Soal 2 - Komponen Perangkat Proses',
                    'assets/images/ic_soal_2.jpg',
                    'https://www.wikimedia.org/',
                    'Komponen perangkat keras yang berfungsi sebagai landasan bagi semua perangkat keras lain dalam komputer disebut?',
                    'A. CPU (Central Processing Unit)',
                    'B. Motherboard',
                    'C. RAM (Random Access Memory)',
                    'D. Hard Disk Drive (HDD)',
                    '',
                    setFinished,
                    '2',
                    ": B. Motherboard",
                    ": Motherboard merupakan papan sirkuit utama yang menghubungkan semua komponen perangkat keras lain dalam komputer. Motherboard menyediakan jalur komunikasi dan catu daya bagi semua komponen, sehingga memungkinkan mereka untuk bekerja sama dengan baik.",
                  ),
                  QuestionWidget(
                    'Soal 3 - Komponen Perangkat Proses',
                    'assets/images/ic_soal_3.jpg',
                    'https://medium.com/',
                    'Komponen perangkat keras yang berfungsi sebagai tempat penyimpanan data sementara untuk program dan data yang sedang digunakan disebut?',
                    'A. CPU (Central Processing Unit)',
                    'B. Motherboard',
                    'C. RAM (Random Access Memory)',
                    'D. Hard Disk Drive (HDD)',
                    '',
                    setFinished,
                    '3',
                    ": C. RAM (Random Access Memory)",
                    ": RAM adalah memori volatile yang menyimpan data dan program yang sedang digunakan oleh komputer. RAM dapat diakses dengan cepat oleh CPU, sehingga memungkinkan komputer untuk menjalankan program dan aplikasi dengan lancar.",
                  ),
                  QuestionWidget(
                    'Soal 4 - Komponen Perangkat Proses',
                    'assets/images/ic_soal_4.jpg',
                    'https://en.wikipedia.org/wiki/Hard_disk_drive',
                    'Komponen perangkat keras yang berfungsi sebagai tempat penyimpanan data permanen untuk file, program, dan sistem operasi disebut?',
                    'A. CPU (Central Processing Unit)',
                    'B. Motherboard',
                    'C. RAM (Random Access Memory)',
                    'D. Hard Disk Drive (HDD)',
                    '',
                    setFinished,
                    '4',
                    ": D. Hard Disk Drive (HDD)",
                    ": Hard Disk Drive (HDD) adalah media penyimpanan permanen yang menyimpan data dan program dalam cakram magnetik. HDD dapat menyimpan data dalam jumlah besar dan memiliki kecepatan akses yang cukup cepat.",
                  ),
                  QuestionWidget(
                    'Soal 5 - Komponen Perangkat Proses',
                    '',
                    '',
                    'Komponen perangkat keras yang berfungsi untuk memproses dan menampilkan gambar ke monitor disebut?',
                    'A. CPU (Central Processing Unit)',
                    'B. Motherboard',
                    'C. RAM (Random Access Memory)',
                    'D. VGA Card (Video Graphics Adapter)',
                    '',
                    setFinished,
                    '5',
                    ": D. VGA Card (Video Graphics Adapter)",
                    ": VGA Card adalah kartu grafis yang berfungsi untuk memproses dan menampilkan gambar ke monitor. VGA Card memiliki prosesor grafis (GPU) yang dedicated untuk mengolah data gambar, sehingga menghasilkan gambar yang lebih tajam dan realistis.",
                  ),
                  QuestionWidget(
                    'Soal 6 - Sistem Operasi',
                    'assets/images/ic_soal_6.jpg',
                    'https://binus.ac.id/bandung/2022/10/perkembangan-operating-system-atau-sistem-operasi/',
                    'Perangkat lunak yang berfungsi untuk mengelola semua perangkat keras dan perangkat lunak dalam komputer disebut?',
                    'A. Aplikasi',
                    'B. Sistem Operasi',
                    'C. Driver',
                    'D. Antivirus',
                    '',
                    setFinished,
                    '6',
                    ": B. Sistem Operasi",
                    ": Sistem operasi adalah perangkat lunak dasar yang menyediakan platform bagi aplikasi lain untuk berjalan. Sistem operasi mengelola semua sumber daya komputer, seperti CPU, memori, dan penyimpanan, dan menyediakan layanan dasar seperti manajemen file, manajemen proses, dan komunikasi jaringan.",
                  ),
                  QuestionWidget(
                    'Soal 7  - Aplikasi Penjelajah Internet',
                    'assets/images/ic_soal_7.jpg',
                    'https://en.wikipedia.org/wiki/Google_Chrome',
                    'Perangkat lunak yang digunakan untuk menjelajahi internet dan mengakses situs web disebut?',
                    'A. Spreadsheet',
                    'B. Presentation',
                    'C. Web Browser',
                    'D. Word Processor',
                    '',
                    setFinished,
                    '7',
                    ": C. Web Browser",
                    ": Web browser adalah perangkat lunak yang memungkinkan pengguna untuk menjelajahi internet dan mengakses situs web. Web browser menerjemahkan kode HTML yang digunakan untuk membuat situs web menjadi halaman web yang dapat dilihat oleh pengguna. Contoh web browser yang populer adalah Google Chrome, Mozilla Firefox, dan Microsoft Edge.",
                  ),
                  QuestionWidget(
                    'Soal 8 Komponen Perangkat Output',
                    '',
                    '',
                    'Perangkat keras yang berfungsi untuk menampilkan informasi visual seperti gambar, teks, dan video disebut?',
                    'A. Printer',
                    'B. Monitor',
                    'C. Speaker',
                    'D. Projector',
                    '',
                    setFinished,
                    '8',
                    ": B. Monitor",
                    ": Monitor adalah perangkat keras yang berfungsi untuk menampilkan informasi visual seperti gambar, teks, dan video. Monitor terhubung ke kartu grafis komputer dan menerima sinyal video untuk menghasilkan gambar di layar.",
                  ),
                  QuestionWidget(
                    'Soal 9 - Komponen Perangkat Output',
                    'assets/images/ic_soal_9.jpg',
                    'https://www.amazon.com/3800Lumens',
                    'Perangkat keras yang berfungsi untuk memproyeksikan gambar dari komputer ke layar yang lebih besar disebut?',
                    'A. Monitor',
                    'B. Printer',
                    'C. Speaker',
                    'D. Projector',
                    '',
                    setFinished,
                    '9',
                    ": D. Projector",
                    ": Projector adalah perangkat keras yang berfungsi untuk memproyeksikan gambar dari komputer ke layar yang lebih besar. Projector terhubung ke komputer melalui kabel HDMI atau VGA dan menerima sinyal video dari komputer untuk menghasilkan gambar yang diproyeksikan.",
                  ),
                  QuestionWidget(
                    'Soal 10 – Interaksi Antara Komputer denagan Pengguna',
                    '',
                    '',
                    'Bagian dari sistem komputer yang memungkinkan pengguna untuk berinteraksi dengan komputer disebut?',
                    'A. Hardware',
                    'B. Software',
                    'C. User Interface (UI)',
                    'D. Operating System (OS)',
                    '',
                    setFinished,
                    '10',
                    ": C. User Interface (UI)",
                    ": User Interface (UI) adalah bagian dari sistem komputer yang memungkinkan pengguna untuk berinteraksi dengan komputer. UI terdiri dari elemen-elemen visual seperti ikon, menu, dan tombol yang dapat diklik atau diinteraksikan oleh pengguna. UI yang baik harus mudah digunakan dan dipahami, sehingga pengguna dapat dengan mudah mengoperasikan komputer.",
                  ),
                  QuestionWidget(
                    'Soal 11 - Pengguna',
                    '',
                    '',
                    'EDP Department biasanya bekerja sama dengan departemen lain dalam organisasi. Manakah dari berikut ini yang BUKAN termasuk tugas kolaborasi yang umum dilakukan?',
                    'A. Menganalisis kebutuhan bisnis untuk mengembangkan sistem informasi baru.',
                    'B. Melatih karyawan dari departemen lain untuk menggunakan sistem informasi baru.',
                    'C. Memberikan layanan perbaikan komputer kepada karyawan secara individual.',
                    'D. Melakukan pengujian keamanan sistem informasi untuk mencegah kebocoran data.',
                    '',
                    setFinished,
                    '11',
                    ": C. Memberikan layanan perbaikan komputer kepada karyawan secara individual.",
                    ": Perbaikan komputer individual biasanya ditangani oleh tim IT support tersendiri. EDP Department lebih berfokus pada pengembangan, implementasi, dan pengelolaan sistem informasi secara keseluruhan.",
                  ),
                  QuestionWidget(
                    'Soal 12 - Decode',
                    'assets/images/ic_soal_12.jpg',
                    'www.lifewire.com',
                    'Kode biner yang terdiri dari 0 dan 1 digunakan untuk mewakili data dalam sistem komputer. Berapakah nilai desimal dari kode biner "1010" ?',
                    'A. 2',
                    'B. 4',
                    'C. 8',
                    'D. 16',
                    '',
                    setFinished,
                    '12',
                    ": B. 4",
                    "",
                  ),
                  QuestionWidget(
                    'Soal 13 -  Graphical User Interface (GUI)',
                    '',
                    '',
                    'Ikon di desktop komputer merupakan salah satu elemen penting dalam Graphical User Interface (GUI). Ikon ini berfungsi untuk:',
                    'A. Menyimpan data dan file pengguna.',
                    'B. Menjalankan program dan aplikasi.',
                    'C. Menampilkan informasi sistem komputer.',
                    'D. Melakukan pengaturan jaringan komputer.',
                    '',
                    setFinished,
                    '13',
                    ": B. Menjalankan program dan aplikasi.",
                    "",
                  ),
                  QuestionWidget(
                    'Soal 14 - Antarmuka Baris Perintah (Command Line Interface)',
                    'assets/images/ic_soal_14.jpg',
                    'www.lifewire.com',
                    'Command Line Interface (CLI) memungkinkan pengguna untuk berinteraksi dengan komputer melalui teks. Cara apa yang digunakan untuk menjalankan perintah di CLI?',
                    'A. Mengklik ikon program atau aplikasi.',
                    'B. Mengetikkan perintah dan menekan tombol Enter.',
                    'C. Memilih perintah dari menu bar.',
                    'D. Menggerakkan mouse untuk memilih opsi.',
                    '',
                    setFinished,
                    '14',
                    ": B. Mengetikkan perintah dan menekan tombol Enter.",
                    "",
                  ),
                  QuestionWidget(
                    'Soal 15 - Booting Menggunakan USB (Flashdisk)/DVD ',
                    '',
                    '',
                    'Saat komputer tidak dapat booting dari hard disk internal, kamu dapat menggunakan media penyimpanan eksternal seperti USB flash drive untuk melakukan booting. Apa yang dimaksud dengan proses booting dari USB flash drive?',
                    'A. Menyalin file sistem operasi dari USB flash drive ke hard disk internal.',
                    'B. Memuat file sistem operasi dari USB flash drive ke dalam memori komputer.',
                    'C. Menginstal sistem operasi baru dari USB flash drive ke hard disk internal.',
                    'D. Memformat USB flash drive untuk menyimpan file sistem operasi.',
                    '',
                    setFinished,
                    '15',
                    ": B. Memuat file sistem operasi dari USB flash drive ke dalam memori komputer.",
                    "",
                  ),
                  QuestionWidget(
                    'Soal 16 - Komponen Pengguna - Hardware engineer',
                    '',
                    '',
                    'Seorang pengguna komputer ingin mengupgrade kapasitas penyimpanan datanya. Pengguna saat ini memiliki hard disk 500 GB dan ingin menggantinya dengan hard disk 1 TB.\n\nApa yang harus dilakukan oleh teknisi perangkat keras untuk membantu pengguna?',
                    'A. Membelikan hard disk 1 TB dan memasangnya ke komputer pengguna.',
                    'B. Menyalindata pengguna dari hard disk lama ke hard disk baru.',
                    'C. Memformat ulang hard disk lama dan baru.',
                    'D. Menginstal ulang sistem operasi pada hard disk baru.',
                    'E. Jawaban A,B dan D adalah Benar',
                    setFinished,
                    '16',
                    ": E. Jawaban A,B dan D adalah Benar",
                    "",
                  ),
                  QuestionWidget(
                    'Soal 17 - Komponen Pengguna - Hardware engineer',
                    '',
                    '',
                    'Seorang pengguna laptop mengeluh bahwa laptopnya tidak dapat terhubung ke jaringan Wi-Fi. Teknisi perangkat keras melakukan troubleshooting dan menemukan bahwa driver Wi-Fi pada laptop tidak terinstal dengan benar.\n\nApa yang harus dilakukan oleh teknisi perangkat keras untuk menyelesaikan masalah ini?',
                    'A. Mengganti kartu Wi-Fi pada laptop.',
                    'B. Menginstal ulang sistem operasi laptop.',
                    'C. Menginstal driver Wi-Fi yang benar.',
                    'D. Mereset pengaturan jaringan laptop.',
                    '',
                    setFinished,
                    '17',
                    ": C. Menginstal driver Wi-Fi yang benar.",
                    "",
                  ),
                  QuestionWidget(
                    'Soal 18 - Komponen Pengguna - Software engineer',
                    '',
                    '',
                    'Software Engineer memiliki tanggung jawab untuk mendesain, mengembangkan, dan menguji perangkat lunak. Salah satu tahap penting dalam pengembangan perangkat lunak adalah:',
                    'A. Penjualan dan pemasaran perangkat lunak.',
                    'B. Mempelajari kebutuhan pengguna dan spesifikasi perangkat lunak.',
                    'C. Menjalankan kampanye iklan untuk perangkat lunak.',
                    'D. Mendistribusikan perangkat lunak secara gratis.',
                    '',
                    setFinished,
                    '18',
                    ": B. Mempelajari kebutuhan pengguna dan spesifikasi perangkat lunak.",
                    ": Tahap awal dalam pengembangan perangkat lunak yang baik adalah memahami kebutuhan pengguna dan spesifikasi yang diinginkan. Ini dilakukan untuk memastikan perangkat lunak yang dibuat sesuai dengan fungsinya dan bermanfaat bagi pengguna.",
                  ),
                  QuestionWidget(
                    'Soal 19 - Instalasi Sistem Operasi  Windows  ',
                    'assets/videos/vc_soal_19.mp4',
                    '',
                    'Menurut video tersebut, apa saja persyaratan minimum hardware untuk menginstal Windows 11? (Pilih yang benar)',
                    'A. Prosesor 64-bit dengan minimal 2 core pada frekuensi 1 GHz.',
                    'B. RAM minimal 4 GB.',
                    'C. Penyimpanan internal minimal 64 GB.',
                    'D. Chip TPM (Trusted Platform Module) 2.0.',
                    'E. Jawaban A,B,C dan D adalah Benar',
                    setFinished,
                    '19',
                    ": E. Jawaban A,B,C dan D adalah Benar",
                    "",
                  ),
                  QuestionWidget(
                    'Soal 20   Instalasi Sistem Operasi  Windows  ',
                    'assets/images/ic_soal_20.jpg',
                    'https://docs.oracle.com/',
                    'Pada tahap apa dalam proses instalasi Windows, pengguna perlu mengubah urutan boot di BIOS?',
                    'A. Memilih bahasa dan pengaturan keyboard',
                    'B. Memasukkan product key Windows',
                    'C. Memilih partisi hard disk untuk instalasi',
                    'D. Mengatur pengaturan jaringan',
                    '',
                    setFinished,
                    '20',
                    ": B. Memasukkan product key Windows",
                    ": Urutan boot di BIOS menentukan perangkat mana yang akan diprioritaskan untuk booting komputer. Saat menginstal Windows dari USB flash drive, pengguna perlu mengubah urutan boot agar USB flash drive diprioritaskan dan proses instalasi dapat dimulai.",
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(primaryColor)),
                      child: Center(
                        child: Text(
                          (!setFinished) ? 'Selesaikan Tes Akhir' : 'Kembali ke Halaman Utama',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    onTap: () async {
                      (!setFinished) ? showConfirmFinishTest() : Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _getUserScoreAndName() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get()
        .then((value) {
      setState(() {
        name = value.data()!["name"];
        score = value.data()!["score"];
      });
    });
  }

  Future<void> _launchUrl(String url) async {
    // Check if URL starts with HTTP or HTTPS, add 'https://' if absent
    if (!url.startsWith('http://') && !url.startsWith('https://')) {
      url = 'https://$url';
    }

    // Parse the URL
    var _url = Uri.parse(url);
    print(url);

    // Attempt to launch the URL
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  Widget QuestionWidget(
    String header,
    String image,
    String link,
    String question,
    String choiceA,
    String choiceB,
    String choiceC,
    String choiceD,
    String choiceE,
    bool isFinished,
    String position,
    String answer,
    String explanation,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        (image.isNotEmpty)
            ? Column(
                children: [
                  (image.contains('/images'))
                      ? Image.asset(image)
                      : FutureBuilder(
                          future: _initializeVideoPlayerFuture,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return Column(
                                children: [
                                  AspectRatio(
                                    aspectRatio: _controller.value.aspectRatio,
                                    child: VideoPlayer(_controller),
                                  ),
                                  _videoProgressIndicator(),
                                  _playPauseButton(),
                                ],
                              );
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          },
                        ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              )
            : Container(),
        (link.isNotEmpty)
            ? Column(
                children: [
                  InkWell(
                    onTap: () {
                      _launchUrl(link);
                    },
                    child: Text(
                      link,
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              )
            : Container(),
        Text(
          question,
        ),
        SizedBox(
          height: 16,
        ),
        Column(
          children: <Widget>[
            ListTile(
              leading: Radio<String>(
                value: choiceA,
                groupValue: _selectOptionPosition(position),
                onChanged: (value) {
                  if (!isFinished) {
                    _setSelectedOption(choiceA, position);
                  }
                },
              ),
              title: Text(choiceA),
            ),
            ListTile(
              leading: Radio<String>(
                value: choiceB,
                groupValue: _selectOptionPosition(position),
                onChanged: (value) {
                  if (!isFinished) {
                    _setSelectedOption(choiceB, position);
                  }
                },
              ),
              title: Text(choiceB),
            ),
            ListTile(
              leading: Radio<String>(
                value: choiceC,
                groupValue: _selectOptionPosition(position),
                onChanged: (value) {
                  if (!isFinished) {
                    _setSelectedOption(choiceC, position);
                  }
                },
              ),
              title: Text(choiceC),
            ),
            ListTile(
              leading: Radio<String>(
                value: choiceD,
                groupValue: _selectOptionPosition(position),
                onChanged: (value) {
                  if (!isFinished) {
                    _setSelectedOption(choiceD, position);
                  }
                },
              ),
              title: Text(choiceD),
            ),
            (choiceE.isNotEmpty)
                ? ListTile(
                    leading: Radio<String>(
                      value: choiceE,
                      groupValue: _selectOptionPosition(position),
                      onChanged: (value) {
                        if (!isFinished) {
                          _setSelectedOption(choiceE, position);
                        }
                      },
                    ),
                    title: Text(choiceE),
                  )
                : Container(),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        (isFinished)
            ? Column(
                children: [
                  BoldFirstWord(
                    "Jawaban",
                    answer,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  (position == "12")
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Penjelasan:', // Use the firstWord parameter here
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            UnorderListWidget(position),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Untuk menghitung nilai desimal dari kode biner, kita kalikan setiap digit dengan nilai posisional dan jumlahkan hasilnya.', // Use the firstWord parameter here
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              '1 * 2^3 + 0 * 2^2 + 1 * 2^1 + 0 * 2^0 = 8 + 0 + 2 + 0 = 10', // Use the firstWord parameter here
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Namun, soal ini menanyakan nilai desimal dari kode "1010".', // Use the firstWord parameter here
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              '1 * 2^3 + 0 * 2^2 + 1 * 2^1 + 0 * 2^0 = 8 + 0 + 2 + 0 = 10', // Use the firstWord parameter here
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              '10 dalam biner sama dengan 4 dalam desimal.', // Use the firstWord parameter here
                            ),
                          ],
                        )
                      : (position == '19')
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Penjelasan:', // Use the firstWord parameter here
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  'Video tersebut menjelaskan persyaratan minimum hardware untuk menginstal Windows 11. Persyaratan tersebut meliputi:', // Use the firstWord parameter here
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                UnorderListWidget(position),
                              ],
                            )
                          : (position == '13' ||
                                  position == "14" ||
                                  position == "15" ||
                                  position == "16" ||
                                  position == "17")
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Penjelasan:', // Use the firstWord parameter here
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    UnorderListWidget(position),
                                  ],
                                )
                              : BoldFirstWord(
                                  "Penjelasan",
                                  explanation,
                                ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              )
            : Container()
      ],
    );
  }

  Widget UnorderListWidget(String position) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: (position == '12')
          ? explanation12.map((item) => buildListItem(item)).toList()
          : (position == '13')
              ? explanation13.map((item) => buildListItem(item)).toList()
              : (position == '14')
                  ? explanation14.map((item) => buildListItem(item)).toList()
                  : (position == '15')
                      ? explanation15
                          .map((item) => buildListItem(item))
                          .toList()
                      : (position == '16')
                          ? explanation16
                              .map((item) => buildListItem(item))
                              .toList()
                          : (position == '17')
                              ? explanation17
                                  .map((item) => buildListItem(item))
                                  .toList()
                              : explanation19
                                  .map((item) => buildListItem(item))
                                  .toList(),
    );
  }

  Widget buildListItem(String item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('• ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          // Bullet point
          Expanded(
            child: Text(item),
          )
        ],
      ),
    );
  }

  Widget BoldFirstWord(String firstWord, String otherWords) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          firstWord, // Use the firstWord parameter here
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.65,
          child: Text(
            otherWords, // Use the otherWords parameter here
          ),
        ),
      ],
    );
  }

  Widget _playPauseButton() {
    return InkWell(
      onTap: () {
        setState(() {
          if (_controller.value.isPlaying) {
            _controller.pause();
          } else {
            _controller.play();
          }
        });
      },
      child: Icon(
        _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        color: _controller.value.isPlaying ? Color(primaryColor) : Colors.grey,
      ),
    );
  }

  Widget _videoProgressIndicator() {
    return Slider(
      min: 0,
      max: _controller.value.duration.inSeconds.toDouble(),
      value: _controller.value.position.inSeconds.toDouble(),
      onChanged: (value) {
        _controller.seekTo(Duration(seconds: value.toInt()));
      },
    );
  }

  _selectOptionPosition(String position) {
    if (position == "1") {
      return selectedOption1;
    } else if (position == "2") {
      return selectedOption2;
    } else if (position == "3") {
      return selectedOption3;
    } else if (position == "4") {
      return selectedOption4;
    } else if (position == "5") {
      return selectedOption5;
    } else if (position == "6") {
      return selectedOption6;
    } else if (position == "7") {
      return selectedOption7;
    } else if (position == "8") {
      return selectedOption8;
    } else if (position == "9") {
      return selectedOption9;
    } else if (position == "10") {
      return selectedOption10;
    } else if (position == "11") {
      return selectedOption11;
    } else if (position == "12") {
      return selectedOption12;
    } else if (position == "13") {
      return selectedOption13;
    } else if (position == "14") {
      return selectedOption14;
    } else if (position == "15") {
      return selectedOption15;
    } else if (position == "16") {
      return selectedOption16;
    } else if (position == "17") {
      return selectedOption17;
    } else if (position == "18") {
      return selectedOption18;
    } else if (position == "19") {
      return selectedOption19;
    } else if (position == "20") {
      return selectedOption20;
    }
  }

  _scrollToTop() {
    _scrollController.animateTo(
      0, // Scroll to the top of the scroll view
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  showConfirmFinishTest() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          backgroundColor: Color(primaryColor),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text(
                  'Konfirmasi Menyelesaikan Tes Akhir',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                  right: MediaQuery.of(context).size.width * 0.1,
                ),
                child: Divider(
                  color: Colors.white,
                  height: 3,
                  thickness: 3,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Apakah kamu yakin ingin menyelesaikan tes akhir ?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.clear,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            IconButton(
              icon: Icon(
                Icons.check,
                color: Colors.white,
              ),
              onPressed: () async {
                /// HITUNG SKOR
                var answer1 = selectedOption1 == 'B. CPU (Central Processing Unit)';
                var answer2 = selectedOption2 == 'B. Motherboard';
                var answer3 = selectedOption3 == 'C. RAM (Random Access Memory)';
                var answer4 = selectedOption4 == 'D. Hard Disk Drive (HDD)';
                var answer5 = selectedOption5 == 'D. VGA Card (Video Graphics Adapter)';
                var answer6 = selectedOption6 == 'B. Sistem Operasi';
                var answer7 = selectedOption7 == 'C. Web Browser';
                var answer8 = selectedOption8 == 'B. Monitor';
                var answer9 = selectedOption9 == 'D. Projector';
                var answer10 = selectedOption10 == 'C. User Interface (UI)';
                var answer11 = selectedOption11 == 'C. Memberikan layanan perbaikan komputer kepada karyawan secara individual.';
                var answer12 = selectedOption12 == 'B. 4';
                var answer13 = selectedOption13 == 'B. Menjalankan program dan aplikasi.';
                var answer14 = selectedOption14 == 'B. Mengetikkan perintah dan menekan tombol Enter.';
                var answer15 = selectedOption15 == 'B. Memuat file sistem operasi dari USB flash drive ke dalam memori komputer.';
                var answer16 = selectedOption16 == 'E. Jawaban A,B dan D adalah Benar';
                var answer17 = selectedOption17 == 'C. Menginstal driver Wi-Fi yang benar.';
                var answer18 = selectedOption18 == 'B. Mempelajari kebutuhan pengguna dan spesifikasi perangkat lunak.';
                var answer19 = selectedOption19 == 'E. Jawaban A,B,C dan D adalah Benar';
                var answer20 = selectedOption20 == 'B. Memasukkan product key Windows';

                var answers = [
                  answer1,
                  answer2,
                  answer3,
                  answer4,
                  answer5,
                  answer6,
                  answer7,
                  answer8,
                  answer9,
                  answer10,
                  answer11,
                  answer12,
                  answer13,
                  answer14,
                  answer15,
                  answer16,
                  answer17,
                  answer18,
                  answer19,
                  answer20,
                ];

                var scoreTest = 0;
                answers.forEach((element) {
                  if (element) {
                    scoreTest += 5;
                  }
                });

                setState(() {
                  score = scoreTest.toString();
                });

                var uid = FirebaseAuth.instance.currentUser!.uid;
                await Database.updateScoreFinalTest(score.toString(), uid);

                Navigator.of(context).pop();
                showTestResult();
              },
            ),
          ],
          elevation: 10,
        );
      },
    );
  }

  showTestResult() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          backgroundColor: Color(primaryColor),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text(
                  'Hasil Tes Akhir',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                  right: MediaQuery.of(context).size.width * 0.1,
                ),
                child: Divider(
                  color: Colors.white,
                  height: 3,
                  thickness: 3,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              (int.parse(score) > 70)
                  ? Text(
                      'Skor Tes Akhir: $score\n\nKamu sudah mengerjakan tes akhir dengan baik, nilai kamu diatas Passing Grade/KKM, Selamat!\n\nSilahkan klik ikon ceklis untuk memuat pembahasan!',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white
                      ),
                    )
                  : Text(
                      'Skor Tes Akhir: $score\n\nKamu belum mengerjakan tes akhir dengan maksimal, nilai kamu masih dibawah Passing Grade/KKM, Ayo semangat!\n\nSilahkan klik ikon ceklis untuk memuat pembahasan!',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white
                      ),
                    ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.check,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  setFinished = true;
                });
                _scrollToTop();
                Navigator.of(context).pop();
              },
            ),
          ],
          elevation: 10,
        );
      },
    );
  }
}
