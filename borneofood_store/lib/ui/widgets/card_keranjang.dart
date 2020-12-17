part of 'widgets.dart';

class KeranjangCard extends StatefulWidget {
  final dynamic itemData;

  const KeranjangCard({this.itemData});

  @override
  _KeranjangCardState createState() => _KeranjangCardState(itemData);
}

class _KeranjangCardState extends State<KeranjangCard> {
  final dynamic itemData;
  _KeranjangCardState(this.itemData);

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
    return Container(
      margin: EdgeInsets.all(5),
      // padding: EdgeInsets.symmetric(horizontal: 5),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.transparent,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[400],
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(3, 3),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Container(
              // color: Colors.teal,
              child: Column(children: <Widget>[
                // Nama Produk
                Text(
                  this.itemData["name"],
                  style: blackMediumText,
                ),

                addVerticalSpace(getProportionateScreenHeight(15)),

                // Deskripsi Produk
                Text(
                  this.itemData["description"],
                  style: blackSmallText,
                ),

                addVerticalSpace(getProportionateScreenHeight(25)),

                // Harga Produk
                Text(this.itemData["price"].toString(), style: boldSmallText),
              ]),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              child: Column(children: <Widget>[
                // Gambar Produk
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black),
                      image: DecorationImage(
                          image: AssetImage(this.itemData["image"]),
                          fit: BoxFit.fill)),
                ),

                addVerticalSpace(getProportionateScreenHeight(10)),

                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: 30,
                        width: 30,
                        child: FittedBox(
                          child: FloatingActionButton(
                            heroTag: 'btn_minus',
                            onPressed: minus,
                            child: new Icon(Icons.remove, color: Colors.white),
                            backgroundColor: Colors.deepOrangeAccent,
                          ),
                        ),
                      ),
                      Text('$_n', style: blackMediumText),
                      Container(
                        height: 30,
                        width: 30,
                        child: FittedBox(
                          child: FloatingActionButton(
                            heroTag: 'btn_plus',
                            onPressed:
                                _n >= widget.itemData["stock"] ? null : add,
                            child: new Icon(Icons.add, color: Colors.white),
                            backgroundColor: Colors.deepOrangeAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Quantity Counter
              ]),
            ),
          )
        ],
      ),
    );
  }
}
