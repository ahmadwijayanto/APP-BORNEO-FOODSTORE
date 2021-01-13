part of 'widgets.dart';

class ProductCard extends StatelessWidget {
  // final dynamic itemData;
  final Food itemData;
  final double width;
  final double height;

  ProductCard({
    this.itemData,
    this.width = 150,
    this.height = 250,
  });

  bool isTerbaru() {
    // 23/06/2020
    DateTime today = DateTime.now();
    DateTime release = DateTime.parse(this.itemData.getCreatedAt);
    // DateTime release = format.parse(this.itemData["created_at"]);

    int difference = today.difference(release).inDays;
    return difference <= 30;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => FoodPage(
                  itemData: itemData,
                )));
      },
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.symmetric(horizontal: 5),
        width: getProportionateScreenWidth(this.width),
        height: getProportionateScreenHeight(this.height),
        decoration: BoxDecoration(
          color: Colors.white,
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
        child: Column(children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(imageURL+this.itemData.images.first.image),
                    // image: AssetImage(this.itemData["image"]),
                    fit: BoxFit.cover)),
            child: Stack(children: <Widget>[
              Positioned(
                bottom: 0,
                left: 0,
                child: TagTersedia(stock: this.itemData.getStock),
                // child: TagTersedia(stock: this.itemData["stock"]),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: isTerbaru() ? TagTerbaru() : SizedBox(),
              )
            ]),
          ),
          addVerticalSpace(getProportionateScreenHeight(10)),
          Align(
              alignment: Alignment.centerLeft,
              child: Text(this.itemData.getName)),
              // child: Text(this.itemData["name"])),
          addVerticalSpace(getProportionateScreenHeight(5)),
          Row(
            children: [
              Text(NumberFormat.currency(
                  symbol: 'Rp ', decimalDigits: 0, locale: 'id-ID')
                  .format(itemData.price), style: boldSmallText),
              // Text(this.itemData["price"].toString(), style: boldSmallText),
            ],
          ),
        ]),
      ),
    );
  }
}
