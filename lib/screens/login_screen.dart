import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kenalsister/screens/forgot_password_screen.dart';
import 'package:kenalsister/screens/register_screen.dart';
import 'package:kenalsister/widget/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  bool _visible = false;
  String role = "";

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
                      "Silahkan Login",
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
                              'Akses Kenal Sister dengan input email dan password.',
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
                              hintText: 'Inputkan Email anda...',
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
                              hintText: 'Inputkan Password anda...',
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
                          margin: EdgeInsets.symmetric(
                            horizontal: 30,
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: const Center(
                            child: Text(
                              'Masuk',
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

                            /// CEK APAKAH EMAIL & PASSWORD SUDAH TERDAFTAR DI DATABASE
                            bool shouldNavigate = await _signInHandler(
                              _emailController.text,
                              _passwordController.text,
                            );

                            /// JIKA TERDAFTAR DI DATABASE, MAKA BISA MELKUKAN LOGIN
                            if (shouldNavigate) {
                              _getUserRole();
                              _saveRoleToSharedPrefs();

                              setState(() {
                                _visible = false;
                              });

                              _formKey.currentState!.reset();

                              /// MASUK KE HOMEPAGE JIKA SUKSES LOGIN
                              Route route = MaterialPageRoute(
                                  builder: (context) => HomeScreen());
                              Navigator.pushReplacement(context, route);
                            } else {
                              setState(() {
                                _visible = false;
                              });
                            }
                          }
                        },
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        child: Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                      ),

                      /// TOMBOL FORGOT PASSWORD
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
                              'Lupa Password',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          Route route = MaterialPageRoute(
                              builder: (context) => ForgotPasswordScreen());
                          Navigator.push(context, route);
                        },
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Belum punya akun ?',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          InkWell(
                            onTap: () {
                              Route route = MaterialPageRoute(
                                  builder: (context) => RegisterScreen());
                              Navigator.push(context, route);
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "Mendaftar Sekarang",
                                style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 100,
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

  /// FUNCTION TO LOGIN
  _signInHandler(String email, String password) async {
    try {
      (await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password))
          .user;

      return true;
    } catch (error) {
      toast(
          'Terdapat kendala ketika ingin login. Silahkan periksa kembali email & password, serta koneksi internet anda');
      return false;
    }
  }

  void _getUserRole() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get()
        .then((value) {
      setState(() {
        role = value.data()!["role"];
      });
    });
  }

  void _saveRoleToSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('role', role);
  }
}

/// CUSTOM TOAST
void toast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Color(yellow),
      textColor: Colors.white,
      fontSize: 16.0);
}
