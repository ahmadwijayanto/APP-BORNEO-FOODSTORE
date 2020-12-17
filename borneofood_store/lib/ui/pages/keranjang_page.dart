part of 'pages.dart';

class KeranjangPage extends StatefulWidget {
  static final routeName = "/keranjang_page";

  @override
  _KeranjangPageState createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: mainColor,
          title: Center(
            child: Text(
              'Keranjang Saya',
              style: appBarText,
            ),
          )),
      body: SafeArea(
          child: Container(
              color: Colors.white,
              child: CART_DATA.length <= 0 ? KeranjangKosong() : KeranjangIsi(),
              // child: Padding(
              //   padding: const EdgeInsets.all(0.0),
              //   child: CART_DATA.length <= 0 ? KeranjangKosong() : KeranjangIsi(),
              // ),
          ),
      ),
    );
  }
}

class KeranjangKosong extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Keranjang masih kosong',
          style: blackMediumText,
        ),
        addVerticalSpace(15),
        Image.asset("assets/empty_cart.png"),
        addVerticalSpace(15),
        HomeButton(
          text: "Mulai Belanja",
          onTap: () {
            Navigator.pushReplacementNamed(context, SelectionPage.routeName,
                arguments: ScreenArguments(0, false));
          },
        )
      ],
    );
  }
}

class KeranjangIsi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: CART_DATA.length,
        itemBuilder: (_, index) => Container(
          margin: EdgeInsets.only(
            left: (index == 0) ? 5 : 0,
            right: (index < CART_DATA.length - 1) ? 5 : 5,
          ),
          child: KeranjangCard(
            itemData : CART_DATA[index]
          ),
        ),
      ),
    );
  }
}
