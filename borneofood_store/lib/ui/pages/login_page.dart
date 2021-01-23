import 'package:borneofood_store/cubit/user_cubit.dart';
import 'package:borneofood_store/ui/pages/pages.dart';
import 'package:borneofood_store/ui/pages/register_page.dart';
import 'package:borneofood_store/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  static final routeName = "/login_page";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController password;
  TextEditingController email;
  bool isLoading = false;

  @override
  void initState() {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String token = prefs.getString('api_token');
    // if (token != null) {
    //   Get.offNamed(HomePage.routeName);
    // }
    password = TextEditingController();
    email = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        title: Text(
          'LOGIN PAGE',
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Center(
                  child: Container(
                    width: 200,
                    height: 200,
                    child: Image(
                      image: AssetImage('assets/Logo.png'),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(28, 26, 28, 6),
                  child: Text(
                    "Alamat Email",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 28),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.deepOrange, width: 2)),
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: GoogleFonts.poppins(
                            fontWeight: FontWeight.w300, fontSize: 14),
                        hintText: 'Gunakan email yang telah terdaftar'),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(28, 16, 28, 6),
                  child: Text(
                    "Password",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 28),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.deepOrange, width: 2)),
                  child: TextField(
                    controller: password,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: GoogleFonts.poppins(
                            fontWeight: FontWeight.w300, fontSize: 14),
                        hintText: 'Masukan password anda'),
                  ),
                ),
                isLoading
                    ? loadingIndicator
                    : Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 24),
                        height: 45,
                        padding: EdgeInsets.symmetric(horizontal: 28),
                        child: RaisedButton(
                          child: Text(
                            "Login",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          color: Colors.deepOrange,
                          onPressed: () async {
                            setState(() {
                              isLoading = true;
                            });
                            await context
                                .read<UserCubit>()
                                .login(email.text, password.text);
                            UserState state = context.read<UserCubit>().state;
                            if (state is UserLoaded) {
                              Get.offNamed(HomePage.routeName);
                            } else {
                              Get.snackbar(
                                "Information",
                                "",
                                backgroundColor: Colors.red[700],
                                titleText: Text(
                                  "Login gagal",
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              );
                            }
                            setState(() {
                              isLoading = false;
                            });
                          },
                        ),
                      ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 24),
                  height: 45,
                  padding: EdgeInsets.symmetric(horizontal: 28),
                  child: RaisedButton(
                    child: Text(
                      "Buat Akun baru",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: Colors.orange,
                    onPressed: () {
                      Get.toNamed(RegisterPage.routeName);
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
