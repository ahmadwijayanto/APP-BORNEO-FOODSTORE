part of 'pages.dart';

class InfoPage extends StatefulWidget {
  static final routeName = "/info_page";

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: mainColor,
          title: Center(
            child: Text(
              'Info Toko',
              style: appBarText,
            ),
          )),
      body: SafeArea(
          child: Container(
              color: Colors.white,
              child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
                Center(
                  child: Container(
                    width: getProportionateScreenWidth(200),
                    height: getProportionateScreenHeight(200),
                    child: Image(image: AssetImage('assets/Logo.png')),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Borneofood Store',
                          style: boldMediumText,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Perusahaan Distributor Resmi Daging Beku dan Produsen Hasil Olahan Daging di Kalimantan Barat.',
                          style: greySmallText,
                        ),
                      ),

                      addVerticalSpace(getProportionateScreenHeight(20)),

                      HomeButton(
                        text: 'Cara Berbelanja (FAQ) :',
                        onTap: (){
                          Navigator.pushNamed(context, FAQPage.routeName);
                        }
                      )
                    ],
                  ),
                )
              ]))),
    );
  }
}
