part of 'widgets.dart';

class KeranjangCard extends StatefulWidget {
  final Cart itemData;

  const KeranjangCard({this.itemData});

  @override
  _KeranjangCardState createState() => _KeranjangCardState(itemData);
}

class _KeranjangCardState extends State<KeranjangCard> {
  final Cart itemData;
  bool isLoading = false;
  StateSetter dialogState;
  _KeranjangCardState(this.itemData);

  void add() {
    dialogState(() {
      itemData.qty = itemData.qty + 1;
    });
  }

  void minus() {
    dialogState(() {
      if (itemData.qty != 0) itemData.qty--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image(
        image: NetworkImage(imageURL + itemData.food.images.first.image),
        height: 60,
        width: 60,
        fit: BoxFit.cover,
      ),
      title: Text(
        itemData.food.name,
        style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400),
      ),
      subtitle: Text(
          "${itemData.qty.toString()} Items ${NumberFormat.currency(symbol: "Rp.", decimalDigits: 0, locale: 'id-ID').format(itemData.total)}",
          style: GoogleFonts.poppins(
              fontSize: 12, fontWeight: FontWeight.w400, color: Colors.grey)),
      trailing: FlatButton(
        child: Text("EDIT",
            style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.white)),
        onPressed: () {
          Get.dialog(StatefulBuilder(builder: (context, setState) {
            dialogState = setState;
            return AlertDialog(
              title: Text(
                itemData.food.name,
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w400),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Order Produk:"),
                      Text(itemData.qty.toString())
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FloatingActionButton(
                          heroTag: 'btn_minus',
                          onPressed: minus,
                          child: new Icon(Icons.remove, color: Colors.white),
                          backgroundColor: Colors.deepOrangeAccent,
                        ),
                        Text('${itemData.qty.toString()}',
                            style: blackMediumText),
                        FloatingActionButton(
                          heroTag: 'btn_plus',
                          onPressed:
                              widget.itemData.qty >= widget.itemData.food.stock
                                  ? null
                                  : add,
                          // onPressed: _n >= widget.itemData["stock"] ? null : add,
                          child: new Icon(Icons.add, color: Colors.white),
                          backgroundColor: Colors.deepOrangeAccent,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              actions: [
                isLoading
                    ? loadingIndicator
                    : FlatButton.icon(
                        icon: Icon(Icons.delete),
                        label: Text("HAPUS"),
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });
                          await context.read<CartCubit>().delete(itemData.id);
                          CartState cartState = context.read<CartCubit>().state;
                          if (cartState is CartDeleted) {
                            setState(() {
                              isLoading = false;
                            });
                            Get.back();
                            Get.snackbar(
                                'Information', '1 Produk Berhasil di hapus',
                                backgroundColor: Colors.lightGreen,
                                isDismissible: true,
                                colorText: Colors.white,
                                snackPosition: SnackPosition.BOTTOM,
                                margin: EdgeInsets.all(8),
                                padding: EdgeInsets.all(8));

                            await context.read<CartCubit>().getCarts();
                          }
                        }),
                isLoading
                    ? loadingIndicator
                    : FlatButton.icon(
                        label: Text("SIMPAN"),
                        icon: Icon(Icons.save),
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });
                          await context.read<CartCubit>().updateCart(itemData);
                          CartState cartState = context.read<CartCubit>().state;
                          if (cartState is CartUpdated) {
                            setState(() {
                              isLoading = false;
                            });
                            Get.back();
                            await context.read<CartCubit>().getCarts();
                          }
                        })
              ],
            );
          }));
        },
        color: Colors.deepOrange,
      ),
    );
  }
}
