part of 'pages.dart';

class SignInOTPPage extends StatelessWidget {
  static final routeName = "/sign_in_otp_page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        backgroundColor: mainColor,
        title: Text(
          "Masuk",
          style: appBarText,
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                addVerticalSpace(getProportionateScreenHeight(70)),
                Text(
                  "OTP Verification",
                  style: boldMediumText,
                ),
                Text("We sent your code to +6285156582722"),
                buildTimer(),
                OTPForm(),
                addVerticalSpace(getProportionateScreenHeight(40)),
                // SizedBox(height: SizeConfig.screenHeight * 0.1),
                GestureDetector(
                  onTap: () {
                    // OTP code resend
                  },
                  child: Text(
                    "Resend OTP Code",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Row buildTimer() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("This code will expired in "),
      TweenAnimationBuilder(
        tween: Tween(begin: 30.0, end: 0.0),
        duration: Duration(seconds: 30),
        builder: (_, value, child) => Text(
          "00:${value.toInt()}",
          style: TextStyle(color: mainColor),
        ),
      ),
    ],
  );
}
