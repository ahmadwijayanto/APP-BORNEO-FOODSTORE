part of 'pages.dart';

class KeranjangPage extends StatefulWidget {
  static final routeName = "/keranjang_page";

  @override
  _KeranjangPageState createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().getCarts();
  }

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
          child: BlocBuilder<CartCubit, CartState>(
            builder: (_, state) => (state is CartLoaded)
                ? buildKeranjang(state.carts)
                : loadingIndicator,
          ),
          // child: Padding(
          //   padding: const EdgeInsets.all(0.0),
          //   child: CART_DATA.length <= 0 ? KeranjangKosong() : KeranjangIsi(),
          // ),
        ),
      ),
    );
  }

  Widget buildKeranjang(List<Cart> carts) {
    return (carts.length == 0) ? KeranjangKosong() : KeranjangIsi(carts);
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

class KeranjangIsi extends StatefulWidget {
  final List<Cart> carts;
  KeranjangIsi(this.carts);

  @override
  _KeranjangIsiState createState() => _KeranjangIsiState();
}

class _KeranjangIsiState extends State<KeranjangIsi> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: ListView.builder(
              itemCount: widget.carts.length,
              itemBuilder: (_, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: KeranjangCard(itemData: widget.carts[index]),
                    ),
                  )),
        ),
        Expanded(
          flex: 1,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Belanjaan: ",
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                          NumberFormat.currency(
                                  symbol: 'Rp ',
                                  decimalDigits: 0,
                                  locale: 'id-ID')
                              .format(widget.carts.fold(
                                  0,
                                  (previousValue, element) =>
                                      previousValue + element.total)),
                          style: boldSmallText)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width: double.infinity,
                    height: 45,
                    child: isLoading
                        ? loadingIndicator
                        : RaisedButton(
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                              });
                              await context
                                  .read<TransactionCubit>()
                                  .submitTransaction(widget.carts.fold(
                                      0,
                                      (previousValue, element) =>
                                          previousValue + element.total));
                              var state =
                                  context.read<TransactionCubit>().state;
                              if (state is TransactionCreated) {
                                Get.snackbar('', '',
                                    titleText: Text("Information"),
                                    messageText:
                                        Text("Succesfully Make Transaction"),
                                    backgroundColor: Colors.green);
                                await context.read<CartCubit>().getCarts();
                              }
                              setState(() {
                                isLoading = false;
                              });
                            },
                            color: Colors.deepOrange,
                            child: Text(
                              "Bayar Belanjaan",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
