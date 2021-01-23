import 'dart:io';

import 'package:borneofood_store/cubit/user_cubit.dart';
import 'package:borneofood_store/models/model_user.dart';
import 'package:borneofood_store/ui/pages/login_page.dart';
import 'package:borneofood_store/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressPage extends StatefulWidget {
  static final routeName = "/address_page";
  final User user;
  final String password;
  AddressPage(this.user, this.password);
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  bool isLoading = false;

  TextEditingController phoneNumber, address, houseNumber, city;
  var pictureFile;
  @override
  void initState() {
    phoneNumber = TextEditingController();
    address = TextEditingController();
    houseNumber = TextEditingController();
    city = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        title: Text(
          'DATA PRIBADI',
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.all(16),
          child: ListView(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  GestureDetector(
                    onTap: () async {
                      PickedFile pickedFile = await ImagePicker()
                          .getImage(source: ImageSource.gallery);
                      if (pickedFile != null) {
                        pictureFile = File(pickedFile.path);
                        setState(() {});
                      }
                    },
                    child: Container(
                      width: 110,
                      height: 110,
                      margin: EdgeInsets.only(top: 26),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/photo_border.png'))),
                      child: (pictureFile != null)
                          ? Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: FileImage(pictureFile),
                                      fit: BoxFit.cover)),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage('assets/photo.png'),
                                      fit: BoxFit.cover)),
                            ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(28, 26, 28, 6),
                    child: Text(
                      "Nomor HP",
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
                      controller: phoneNumber,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300, fontSize: 14),
                          hintText: 'Gunakan Nomor yan dapat dihubungi'),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(28, 16, 28, 6),
                    child: Text(
                      "Alamat Lengkap",
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
                      controller: address,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300, fontSize: 14),
                          hintText: 'Alamat Lengkap'),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(28, 16, 28, 6),
                    child: Text(
                      "Kota Asal",
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
                      controller: city,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300, fontSize: 14),
                          hintText: 'Masukan Nama Kota'),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(28, 16, 28, 6),
                    child: Text(
                      "Nomor Rumah / RT:RW",
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
                      controller: houseNumber,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300, fontSize: 14),
                          hintText: 'Nomor Rumah Atau RT:RW'),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 24),
                    height: 45,
                    padding: EdgeInsets.symmetric(horizontal: 28),
                    child: isLoading
                        ? loadingIndicator
                        : RaisedButton(
                            child: Text(
                              "Daftar Sekarang",
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
                              final user = widget.user.copyWith(
                                address: address.text,
                                city: city.text,
                                phoneNumber: phoneNumber.text,
                                houseNumber: houseNumber.text,
                              );

                              await context
                                  .read<UserCubit>()
                                  .register(user, widget.password);
                              final userState = context.read<UserCubit>().state;
                              if (userState is UserCreated) {
                                Get.offNamed(LoginPage.routeName);
                              }
                              setState(() {
                                isLoading = false;
                              });
                            },
                          ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
