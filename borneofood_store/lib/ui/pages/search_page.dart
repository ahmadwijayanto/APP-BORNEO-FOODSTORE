part of 'pages.dart';

class SearchPage extends StatelessWidget {
  static final routeName = "/search_page";

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
              showSearch(context: context, delegate: DataSearch());
            },
          )
        ],
        centerTitle: true,
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {

  final product = [
    "urat mayang sapi",
    "babat sapi bersih",
    "french fries crinkle cut",
    "tetelan leher neck trimming",
    "barts french fries shoestring",
    "daging tetelan sapi",
    "daging kerbau sop",
    "iga sapi konro",
    "lemak timbul fat trimming",
    "kentang goreng",
    "kentang goreng lapis keju",
    "keju mozarella belgee",
    "ceker bebek",
    "bebek ungkep bumbu",
    "daging tenderloin",
    "daging kerbau semur",
    "daging sapi rendang",
    "daging kerbau rendang",
    "kambing potong",
    "telur bebek",
    "tunggir ayam",
    "ayam fillet dada",
    "ikan dori",
  ];

  final recentProduct = [
    "telur bebek",
    "tunggir ayam",
    "ayam fillet dada",
    "ikan dori",
  ];

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
    return SizedBox();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something
    final suggestionList = query.isEmpty  ? recentProduct : product.where((element) => element.startsWith(query)).toList();
    // final suggestionList = query.isEmpty  ? recentProduct : product.where((element) => element.contains(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: (){
          showResults(context);
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
