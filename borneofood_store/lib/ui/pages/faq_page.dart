part of 'pages.dart';

class FAQPage extends StatefulWidget {
  static final routeName = "/faq_page";

  @override
  _FAQPageState createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  bool loading = true;
  String url = "https://borneofoodstore.com/faq/18098/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        backgroundColor: mainColor,
        title: Text(
          "FAQ",
          style: appBarText,
        ),
        centerTitle: true,
      ),

      body: SafeArea(
        child: Stack(
          children: [
            WebView(
              initialUrl: url,
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: (url) {
                setState(() {
                  loading = false;
                });
              },
            ),
            loading ? Center(child: CircularProgressIndicator(),) : Stack(),
          ]
        )
      ),
    );
  }
}