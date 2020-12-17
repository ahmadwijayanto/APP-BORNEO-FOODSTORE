part of 'pages.dart';

class SignInNumberPage extends StatelessWidget {
  static final routeName = "/sign_in_number_page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: mainColor,
          title: Center(
            child: Text(
              'Masuk',
              style: appBarText,
            ),
          )),
      body: SafeArea(
          child: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            addVerticalSpace(getProportionateScreenHeight(50)),
            Center(
              child: Container(
                width: getProportionateScreenWidth(200),
                height: getProportionateScreenHeight(200),
                child: Image(image: AssetImage('assets/holding-phone.png')),
              ),
            ),
            addVerticalSpace(getProportionateScreenHeight(50)),
            Center(
              child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(30)),
                  child: numberFormField()),
            ),
            addVerticalSpace(getProportionateScreenHeight(50)),
            Center(
              child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(30)),
                  child: HomeButton(
                    text: "Kirim OTP",
                    onTap: () {
                      Navigator.pushNamed(context, SignInOTPPage.routeName);
                    },
                  )),
            ),

            addVerticalSpace(getProportionateScreenHeight(40)),
            // SizedBox(height: SizeConfig.screenHeight * 0.1),
            GestureDetector(
              onTap: () {
                // OTP code resend
              },
              child: Text(
                "Sign Up",
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            )
          ],
        ),
      )),
    );
  }
}

TextFormField numberFormField() {
  return TextFormField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
          labelText: "Nomor HP",
          hintText: "Masukkan Nomor HP Anda",
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          suffixIcon: Padding(
              padding: EdgeInsetsDirectional.only(end: 12.0),
              child: Icon(Icons.phone))));
}
