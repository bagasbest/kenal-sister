import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kenalsister/widget/themes.dart';

import 'login_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Themes(),
      child: Scaffold(
        body: Container(
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
                      "Lupa Password",
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
                              'Silahkan inputkan email kamu, kami akan membantu mengirimkan email ubah password melalui email kamu',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          )),
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
                              hintText: 'Inputkan Email kamu...',
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
                          margin: EdgeInsets.symmetric(
                            horizontal: 30,
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: const Center(
                            child: Text(
                              'Konfirmasi Email',
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

                            bool shouldNavigate = await _confirmPasswordHandler(
                              _emailController.text,
                            );

                            if (shouldNavigate) {
                              setState(() {
                                _visible = false;
                              });

                              _formKey.currentState!.reset();
                              setState(() {
                                _emailController.text = "";
                              });

                             _showSuccessConfirmEmail();
                            } else {
                              setState(() {
                                _visible = false;
                              });
                            }
                          }
                        },
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.6,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _confirmPasswordHandler(String email) async {
    try {
      (await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email));

      return true;
    } catch (error) {
      toast(
          'Terdapat kendala ketika ingin mengonfirmasi email');
      return false;
    }
  }

  _showSuccessConfirmEmail() {
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
                  'Sukses Konfirmasi Email',
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
                'Kami telah mengirimkan email untuk mengubah password kamu, silahkan cek email melaui gmail kamu',
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
}
