part of 'pages.dart';

class SearchPage extends StatefulWidget {
  static final routeName = "/search_page";

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
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
  DataSearch();

  @override
  List<Widget> buildActions(BuildContext context) {
    // action for appBar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of the appbar
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
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
    context.bloc<FoodCubit>().getFoodsByName(query);

    return BlocBuilder<FoodCubit, FoodState>(
        builder: (_, state) => (state is FoodSearched)
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                  itemCount: state.foods.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        onTap: () {
                          Get.to(FoodPage(
                            itemData: state.foods[index],
                          ));
                        },
                        leading: Image(
                          image: NetworkImage(
                              imageURL + state.foods[index].images.first.image),
                          height: 60,
                          width: 60,
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          state.foods[index].name,
                          style: GoogleFonts.poppins(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ),
                    );
                  },
                ),
              )
            : loadingIndicator);
  }
}
