import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class AddressPage extends StatefulWidget {
  static final routeName = "/address_page";
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  var pictureFile;

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        title: Text('DATA PRIBADI', style: GoogleFonts.poppins(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500
        ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            GestureDetector(
              onTap: () async {
                PickedFile pickedFile =
                await ImagePicker().getImage(source: ImageSource.gallery);
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
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(28, 26, 28, 6),
                  child: Text(
                    "Nama Lengkap",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 16
                    ),
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

                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: GoogleFonts.poppins(
                            fontWeight: FontWeight.w300,
                            fontSize: 14
                        ),
                        hintText: 'Gunakan nama sesuai indentitas'),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(28, 16, 28, 6),
                  child: Text(
                    "Alamat Email",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 16
                    ),
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

                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: GoogleFonts.poppins(
                            fontWeight: FontWeight.w300,
                            fontSize: 14
                        ),
                        hintText: 'Gunakan email yang aktif'),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(28, 16, 28, 6),
                  child: Text(
                    "Password",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 16
                    ),
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
                    obscureText: true,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: GoogleFonts.poppins(
                            fontWeight: FontWeight.w300,
                            fontSize: 14
                        ),
                        hintText: 'Masukan password anda'),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 24),
                  height: 45,
                  padding: EdgeInsets.symmetric(horizontal: 28),
                  child: RaisedButton(
                    child: Text("Continue", style: GoogleFonts.poppins(
                        color: Colors.white, fontWeight: FontWeight.w500,
                        fontSize: 16
                    ),),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                    ),
                    color: Colors.deepOrange,
                    onPressed: (){},
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );

  }
}
