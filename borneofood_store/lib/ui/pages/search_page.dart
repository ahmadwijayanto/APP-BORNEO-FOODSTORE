part of 'pages.dart';

class SearchPage extends StatefulWidget {
  static final routeName = "/search_page";

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String payloadString = '';
  List<Food> allProduct = new List<Food>();
  List<String> productName = new List<String>();
  List<String> recentProductName = new List<String>();

  void getPayload() async {

  }

  // void getAllProductName() {
  //   allProduct = payload.getProduct;

  //   for (var i = 0; i < allProduct.length; i++) {
  //     productName.add(allProduct[i].getName);
  //   }
  // }

  @override
  void initState() {
    getPayload();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        backgroundColor: mainColor,
        title: Text(
          "Search",
          style: appBarText,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.white,
            onPressed: () {
              showSearch(context: context, delegate: DataSearch(allProduct: allProduct, productName: productName, recentProductName: recentProductName));
            },
          )
        ],
        centerTitle: true,
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {

  DataSearch({
        this.allProduct,
        this.productName,
        this.recentProductName,
      });

  final List<Food> allProduct;
  final List<String> productName;
  final List<String> recentProductName;

  Food selectedProduct;

  // List<Product> allProduct = _SearchPageState().allProduct;
  // List<String> productName = _SearchPageState().productName;
  // List<String> recentProductName = _SearchPageState().recentProductName;

  // final product = [
  //   "urat mayang sapi",
  //   "babat sapi bersih",
  //   "french fries crinkle cut",
  //   "tetelan leher neck trimming",
  //   "barts french fries shoestring",
  //   "daging tetelan sapi",
  //   "daging kerbau sop",
  //   "iga sapi konro",
  //   "lemak timbul fat trimming",
  //   "kentang goreng",
  //   "kentang goreng lapis keju",
  //   "keju mozarella belgee",
  //   "ceker bebek",
  //   "bebek ungkep bumbu",
  //   "daging tenderloin",
  //   "daging kerbau semur",
  //   "daging sapi rendang",
  //   "daging kerbau rendang",
  //   "kambing potong",
  //   "telur bebek",
  //   "tunggir ayam",
  //   "ayam fillet dada",
  //   "ikan dori",
  // ];

  // final recentProduct = [
  //   "telur bebek",
  //   "tunggir ayam",
  //   "ayam fillet dada",
  //   "ikan dori",
  // ];

  @override
  List<Widget> buildActions(BuildContext context) {
    // action for appBar
    return [IconButton(icon: Icon(Icons.clear), onPressed: () {
      query = "";
    })];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of the appbar
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation), 
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some result based on the selection
    // return ProductCard(itemData: selectedProduct);
    return SizedBox();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something
    final suggestionList = query.isEmpty  ? recentProductName : productName.where((element) => element.toLowerCase().contains(query.toLowerCase())).toList();
    // final suggestionList = query.isEmpty  ? recentProductNproductNameame : productName.where((element) => element.startsWith(query)).toList();
    // final suggestionList = query.isEmpty  ? recentProduct : product.where((element) => element.startsWith(query)).toList();
    // final suggestionList = query.isEmpty  ? recentProduct : product.where((element) => element.contains(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: (){
          if (!recentProductName.contains(suggestionList[index])) {
            if (recentProductName.length > 10) {
              recentProductName.removeAt(0);
            }
            recentProductName.add(suggestionList[index]);
          }
          for (var i = 0 ; i < allProduct.length ; i++) {
            if (allProduct[i].getName == suggestionList[index]) {
              selectedProduct = allProduct[i];
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => FoodPage(
                  itemData: selectedProduct,
                )));
            }
          }
          // showResults(context);
        },
        leading: Icon(Icons.set_meal),
        title: RichText(text: TextSpan(
          text: suggestionList[index].substring(0, query.length),
          style: boldSmallText,
          children: [
            TextSpan(
              text: suggestionList[index].substring(query.length),
              style: greySmallText,
            )
          ]
        )),
      ),
      itemCount: suggestionList.length,
      );
  }
}
