part of 'pages.dart';

class KeranjangPage extends StatefulWidget {
  static final routeName = "/keranjang_page";

  @override
  _KeranjangPageState createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  bool isLoading = false;
  bool hasBayar = false;

  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().getCarts();
    // context.read<PaymentCubit>().getPayments();
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
  bool hasBayar = false;
  Payment payment = Payment(
      id: 1,
      paymentName: "Transfer BRI",
      noRek: "098973876784638",
      rekeningName: "BORNEOFOOD",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now());

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
                              await Get.bottomSheet(
                                ListView(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      margin:
                                          EdgeInsets.fromLTRB(28, 26, 28, 6),
                                      child: Text(
                                        "Nama Penerima",
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 28),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: Colors.deepOrange,
                                              width: 2)),
                                      child: TextField(
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintStyle: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 14),
                                            hintText: 'Nama Lengkap'),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      margin:
                                          EdgeInsets.fromLTRB(28, 16, 28, 6),
                                      child: Text(
                                        "Alamat Penerima",
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 28),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: Colors.deepOrange,
                                              width: 2)),
                                      child: TextField(
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintStyle: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 14),
                                            hintText: 'Alamat Lengkap'),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      margin:
                                          EdgeInsets.fromLTRB(28, 16, 28, 6),
                                      child: Text(
                                        "Nomer Hp Penerima",
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 28),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: Colors.deepOrange,
                                              width: 2)),
                                      child: TextField(
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintStyle: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 14),
                                            hintText:
                                                'Nomor Penerima Yang dapat di hubungi'),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      margin: EdgeInsets.only(top: 24),
                                      height: 45,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 28),
                                      child: DropdownSearch<Payment>(
                                        selectedItem: payment,
                                        label: "Metode Pembayaran",
                                        dropdownBuilder: _paymentDropdown,
                                        popupItemBuilder: _paymentPopup,
                                        items: [
                                          Payment(
                                              id: 1,
                                              paymentName: "Transfer BRI",
                                              noRek: "098973876784638",
                                              rekeningName: "BORNEOFOOD",
                                              createdAt: DateTime.now(),
                                              updatedAt: DateTime.now()),
                                          Payment(
                                              id: 1,
                                              paymentName: "Transfer BNI",
                                              noRek: "098973876784638",
                                              rekeningName: "BORNEOFOOD",
                                              createdAt: DateTime.now(),
                                              updatedAt: DateTime.now())
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      margin: EdgeInsets.only(top: 24),
                                      height: 45,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 28),
                                      child: RaisedButton(
                                        child: Text(
                                          "BAYAR",
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16),
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        color: Colors.deepOrange,
                                        onPressed: () {
                                          Get.back();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                backgroundColor: Colors.white,
                              );

                              setState(() {
                                isLoading = true;
                                hasBayar = false;
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
                                    titleText: Text("Informasi"),
                                    messageText:
                                        Text("Silahkan Lakukan Pembayaran"),
                                    colorText: Colors.white,
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

  Widget _paymentDropdown(
      BuildContext context, Payment selectedItem, String itemAsString) {
    return Container(
      child: Text(selectedItem.paymentName),
    );
  }

  Widget _paymentPopup(BuildContext context, Payment item, bool isSelected) {
    return Container(
      child: Card(
        elevation: 3.0,
        child: ListTile(
            title: Text(item.paymentName),
            subtitle: Text("${item.noRek} AN ${item.rekeningName}",
                style: GoogleFonts.poppins(fontSize: 12))),
      ),
    );
  }
}
