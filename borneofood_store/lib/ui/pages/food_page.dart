part of 'pages.dart';

class FoodPage extends StatefulWidget {
  static final routeName = "/food_page";
  final Food itemData;

  const FoodPage({Key key, this.itemData}) : super(key: key);

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  int _n = 0;
  bool isLoading = false;

  void add() {
    setState(() {
      _n++;
    });
  }

  void minus() {
    setState(() {
      if (_n != 0) _n--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        backgroundColor: mainColor,
        title: Text(
          "Product",
          style: appBarText,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.white,
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
          ),
          IconButton(
            icon: Icon(Icons.share),
            color: Colors.white,
            onPressed: () {},
          ),
          // IconButton(
          //   icon: Icon(Icons.shopping_cart),
          //   color: Colors.white,
          //   onPressed: () {},
          // ),
        ],
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // image
              Container(
                height: getProportionateScreenHeight(300),
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            imageURL + widget.itemData.images.first.image),
                        // image: AssetImage(widget.itemData["image"]),
                        fit: BoxFit.cover)),
              ),

              addVerticalSpace(getProportionateScreenHeight(10)),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Harga Satuan",
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        Text(
                            NumberFormat.currency(
                                    symbol: 'Rp ',
                                    decimalDigits: 0,
                                    locale: 'id-ID')
                                .format(widget.itemData.price),
                            style: boldSmallText),
                      ],
                    ),

                    addVerticalSpace(getProportionateScreenHeight(5)),

                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.itemData.getName,
                        // widget.itemData["name"],
                        style: productNameText,
                      ),
                    ),

                    addVerticalSpace(getProportionateScreenHeight(10)),

                    Container(
                      color: Colors.grey[400],
                      width: double.infinity,
                      height: getProportionateScreenHeight(70),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                              top: 5,
                              left: 10,
                              child: Text('Informasi Jumlah',
                                  style: blackMediumText)),
                          Positioned(
                              bottom: 5,
                              left: 10,
                              child: Text(
                                'Jumlah Maksimum : ',
                                style: greyMediumText,
                              )),
                          Positioned(
                              bottom: 5,
                              right: 10,
                              child: Text(widget.itemData.getStock.toString(),
                                  // child: Text(widget.itemData["stock"].toString(),
                                  style: blackMediumText)),
                        ],
                      ),
                    ),

                    addVerticalSpace(getProportionateScreenHeight(10)),

                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.itemData.description ?? "Deskripsi Kosong",
                          // widget.itemData["description"],
                          style: greyMediumText,
                        )),

                    addVerticalSpace(getProportionateScreenHeight(15)),

                    // Quantity Counter
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          FloatingActionButton(
                            heroTag: 'btn_minus',
                            onPressed: minus,
                            child: new Icon(Icons.remove, color: Colors.white),
                            backgroundColor: Colors.deepOrangeAccent,
                          ),
                          Text('$_n', style: blackMediumText),
                          FloatingActionButton(
                            heroTag: 'btn_plus',
                            onPressed:
                                _n >= widget.itemData.getStock ? null : add,
                            // onPressed: _n >= widget.itemData["stock"] ? null : add,
                            child: new Icon(Icons.add, color: Colors.white),
                            backgroundColor: Colors.deepOrangeAccent,
                          ),
                        ],
                      ),
                    ),

                    addVerticalSpace(getProportionateScreenHeight(15)),

                    // Button Add
                    isLoading
                        ? loadingIndicator
                        : HomeButton(
                            text: 'Tambah ke keranjang',
                            onTap: () async {
                              setState(() {
                                isLoading = true;
                              });
                              await context.read<CartCubit>().submitCart(Cart(
                                  qty: _n,
                                  food: widget.itemData,
                                  total: widget.itemData.price * _n));

                              var state = context.read<CartCubit>().state;
                              if (state is CartCreated) {
                                Get.bottomSheet(
                                    Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.all(16),
                                        child: Column(
                                          children: [
                                            Center(
                                              child: Text(
                                                "Produk berhasil di tambahkan",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            ListTile(
                                              leading: Image(
                                                image: NetworkImage(imageURL +
                                                    state.cart.food.images.first
                                                        .image),
                                                height: 60,
                                                width: 60,
                                                fit: BoxFit.cover,
                                              ),
                                              title: Text(
                                                state.cart.food.name,
                                                style: GoogleFonts.poppins(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              subtitle: Text(
                                                  "${state.cart.qty.toString()} Items ${NumberFormat.currency(symbol: "Rp.", decimalDigits: 0, locale: 'id-ID').format(state.cart.total)}",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.grey)),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              margin: EdgeInsets.only(top: 24),
                                              height: 45,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 28),
                                              child: RaisedButton(
                                                child: Text(
                                                  "Lihat Keranjang",
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16),
                                                ),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                color: Colors.deepOrange,
                                                onPressed: () {
                                                  Get.offNamed(
                                                      KeranjangPage.routeName);
                                                },
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              margin: EdgeInsets.only(top: 24),
                                              height: 45,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 28),
                                              child: RaisedButton(
                                                child: Text(
                                                  "Lanjut Belanja",
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16),
                                                ),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                color: Colors.deepOrange,
                                                onPressed: () {
                                                  Get.toNamed(
                                                      SelectionPage.routeName,
                                                      arguments:
                                                          ScreenArguments(
                                                              0, true));
                                                },
                                              ),
                                            ),
                                          ],
                                        )),
                                    backgroundColor: Colors.white);
                              }
                              setState(() {
                                isLoading = false;
                              });
                            },
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
