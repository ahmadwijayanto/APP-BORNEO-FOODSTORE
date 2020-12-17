part of 'pages.dart';

class AkunPage extends StatefulWidget {
  static final routeName = "/akun_page";

  @override
  _AkunPageState createState() => _AkunPageState();
}

class _AkunPageState extends State<AkunPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: mainColor,
          title: Center(
            child: Text(
              'Akun',
              style: appBarText,
            ),
          )),
    );
  }
}