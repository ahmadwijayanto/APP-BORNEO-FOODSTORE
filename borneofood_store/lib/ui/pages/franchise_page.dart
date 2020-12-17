part of 'pages.dart';

class FranchisePage extends StatefulWidget {
  static final routeName = "/franchise_page";

  @override
  _FranchisePageState createState() => _FranchisePageState();
}

class _FranchisePageState extends State<FranchisePage> {
  bool loading = true;
  String url = "https://borneofood.id/franchise-bakso-halal/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        backgroundColor: mainColor,
        title: Text(
          "Franchise Bakso",
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