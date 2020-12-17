part of 'pages.dart';

class ProductPage extends StatefulWidget {
  static final routeName = "/product_page";

  final dynamic itemData;

  const ProductPage({Key key, this.itemData}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int _n = 0;

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
                        image: AssetImage(widget.itemData["image"]),
                        fit: BoxFit.fill)),
              ),

              addVerticalSpace(getProportionateScreenHeight(10)),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Rp ",
                          style: productPriceText,
                        ),
                        Text(
                          widget.itemData["price"].toString(),
                          style: productPriceText,
                        ),
                      ],
                    ),

                    addVerticalSpace(getProportionateScreenHeight(5)),

                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.itemData["name"],
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
                              child: Text(widget.itemData["stock"].toString(),
                                  style: blackMediumText)),
                        ],
                      ),
                    ),

                    addVerticalSpace(getProportionateScreenHeight(10)),

                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.itemData["description"],
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
                          Text(
                            '$_n',
                            style: blackMediumText
                          ),
                          FloatingActionButton(
                            heroTag: 'btn_plus',
                            onPressed: _n >= widget.itemData["stock"] ? null : add,
                            child: new Icon(Icons.add, color: Colors.white),
                            backgroundColor: Colors.deepOrangeAccent,
                          ),
                        ],
                      ),
                    ),

                    addVerticalSpace(getProportionateScreenHeight(15)),

                    // Button Add
                    HomeButton(
                      text: 'Tambah ke keranjang',
                      onTap: () {},
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