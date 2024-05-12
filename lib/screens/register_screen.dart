import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kenalsister/widget/themes.dart';

import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _rePasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  bool _visible = false;


  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Themes(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: Color(primaryColor),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, top: 30, bottom: 16),
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            'Kembali',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(
                        "Registrasi",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text(
                                'Registrasi dengan menginputkan Nama Lengkap, Email, Password, dan Konfirmasi password',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            )),
                        SizedBox(
                          height: 16,
                        ),

                        /// KOLOM NAMA UNTUK LOGIN
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                          ),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: TextFormField(
                              controller: _nameController,
                              autovalidateMode:
                              AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.name,
                              decoration: const InputDecoration(
                                hintText: 'Inputkan nama lengkap...',
                                hintStyle: TextStyle(fontWeight: FontWeight.bold),
                                border: InputBorder.none,
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Nama lengkap tidak boleh kosong';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 16,
                        ),
                        /// KOLOM EMAIL UNTUK LOGIN
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                          ),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: TextFormField(
                              controller: _emailController,
                              autovalidateMode:
                              AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                hintText: 'Inputkan email kamu...',
                                hintStyle: TextStyle(fontWeight: FontWeight.bold),
                                border: InputBorder.none,
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Email tidak boleh kosong';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 16,
                        ),

                        /// KOLOM PASSWORD UNTUK LOGIN
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                          ),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: TextFormField(
                              controller: _passwordController,
                              obscureText: !_showPassword,
                              autovalidateMode:
                              AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                hintText: 'Inputkan password kamu...',
                                hintStyle: TextStyle(fontWeight: FontWeight.bold),
                                border: InputBorder.none,
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _showPassword = !_showPassword;
                                    });
                                  },
                                  child: Icon(_showPassword
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Kata Sandi tidak boleh kosong';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 16,
                        ),

                        /// KOLOM PASSWORD UNTUK LOGIN
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                          ),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: TextFormField(
                              controller: _rePasswordController,
                              obscureText: !_showPassword,
                              autovalidateMode:
                              AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                hintText: 'Inputkan konfirmasi password...',
                                hintStyle: TextStyle(fontWeight: FontWeight.bold),
                                border: InputBorder.none,
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _showPassword = !_showPassword;
                                    });
                                  },
                                  child: Icon(_showPassword
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Konfirmasi Kata Sandi tidak boleh kosong';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 16,
                        ),

                        /// LOADING INDIKATOR
                        Visibility(
                          visible: _visible,
                          child: const SpinKitRipple(
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(
                          height: 30,
                        ),

                        /// TOMBOL LOGIN
                        InkWell(
                          child: Container(
                            margin: EdgeInsets.only(
                              left: 30,
                              right: 30,
                              bottom: 200,
                            ),
                            padding: EdgeInsets.symmetric(vertical: 16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: const Center(
                              child: Text(
                                'Registrasi',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          onTap: () async {
                            /// CEK APAKAH EMAIL DAN PASSWORD SUDAH TERISI DENGAN FORMAT YANG BENAR
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                _visible = true;
                              });

                              /// CREATE NEW USER
                              bool shouldNavigate = await _registerHandler();

                              /// CHECK IS USER HAS STORED IN FIREBASE FIRESTORE OR NOT
                              if (shouldNavigate) {
                                await _registeringUserToDatabase();

                                /// CLEAR FIELD AFTER REGISTER
                                setState(() {
                                  _nameController.text = "";
                                  _emailController.text = "";
                                  _passwordController.text = "";
                                  _rePasswordController.text = "";
                                });

                                setState(() {
                                  _visible = false;
                                });
                                _showSuccessRegistration();
                              } else {
                                /// FAILURE REGISTER
                                setState(() {
                                  _visible = false;
                                });
                                _showFailureRegistration();
                              }
                            }
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// FUNCTION TO CREATE NEW USER
  _registerHandler() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      return true;
    } catch (error) {
      toast(
          'Gagal melakukan pendaftaran akun, silahkan periksa kembali data diri kamu dan koneksi internet kamu');
      return false;
    }
  }

  ///FUNCTION TO STORE USER IN FIREBASE FIRESTORE
  _registeringUserToDatabase() async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        "uid": uid,
        "name": _nameController.text,
        "email": _emailController.text,
        "password": _passwordController.text,
        "last_login" : "",
        "role" : "user",
        "score" : "0"
      });
    } catch (error) {
      toast("Gagal melakukan pendaftaran, silahkan cek koneksi internet kamu");
    }
  }

  _showSuccessRegistration() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          backgroundColor: Color(primaryColor),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Center(
                child: Text(
                  'Sukses Registrasi',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                  right: MediaQuery.of(context).size.width * 0.1,
                ),
                child: const Divider(
                  color: Colors.white,
                  height: 3,
                  thickness: 3,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Kamu berhasil terdaftar pada aplikasi\nKenal Sister',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: 250,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(primaryColor),
                    borderRadius: BorderRadius.circular(32),
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: const Center(
                    child: Text(
                      "Tutup",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 18,
                        letterSpacing: 1,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          elevation: 10,
        );
      },
    );
  }

  _showFailureRegistration() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Gagal Registrasi"),
          content: const Text(
            'User gagal terdaftar dalam aplikasi, silahkan periksa data yang kamu inputkan dan periksa koneksi internet, coba lagi kemudian',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.clear,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
