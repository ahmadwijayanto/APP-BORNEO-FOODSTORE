part of 'pages.dart';

class BelanjaPage extends StatefulWidget {
  static final routeName = "/belanja_page";

  @override
  _BelanjaPageState createState() => _BelanjaPageState();
}

class _BelanjaPageState extends State<BelanjaPage> {
  // private variable
  int currentBanner = 0;
  String payloadString = "";
  String selectedCategory = "Semua";
  Payload payload = new Payload();

  // list fom payload
  List<Product> filteredProduct = new List<Product>();
  List<Product> allProduct = new List<Product>();
  List<Category> allCategory = new List<Category>();
  List<Banners> allBanner = new List<Banners>();

  PageController bannerController = PageController(
    initialPage: 0,
  );

  Future loadPayload() async {
    String jsonString = await rootBundle.loadString("assets/product.json"); // get payload json as string
    final jsonData = json.decode(jsonString); // convert json string to real json
    payload = Payload.fromJson(jsonData); // put the real json into the right class so it can be accessed
    setStringVal(KEY_PAYLOAD, jsonString);

    setState(() {
      allBanner = payload.getBanner;
      allCategory = payload.getCategory;
      allProduct = payload.getProduct;
      filteredProduct = payload.getProduct;
    });
  }

  void updateListProduct(String category) {
    filteredProduct = new List<Product>();

    if (category == "Semua") {
        filteredProduct.addAll(allProduct);
        return;
    }

    for (var i = 0; i < allProduct.length; i++) {
      if (allProduct[i].getCategory == category) {
        filteredProduct.add(allProduct[i]);
      }
    }
  }

  @override
  void initState() {
    //cek login state
    // kalau sudah login tulisan dan gambar "akun"
    // kalau belum login tulisan dan gambar "masuk"

    loadPayload();

    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (currentBanner < 2) {
        currentBanner++;
      } else {
        currentBanner = 0;
      }

      if (bannerController.hasClients) {
        bannerController.animateToPage(
        currentBanner,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          color: mainColor,
        ),
        SafeArea(
            child: Container(
                color: Colors.white,
                child: Column(children: <Widget>[
                  // Banner
                  Expanded(
                    flex: 2,
                    child: Stack(children: [
                      PageView.builder(
                        controller: bannerController,
                        onPageChanged: (value) {
                          setState(() {
                            currentBanner = value;
                          });
                        },
                        itemCount: allBanner.length,
                        // itemCount: BANNER_DATA.length,
                        itemBuilder: (context, index) => ShopBanner(
                          image: allBanner[index].getImageUrl,
                          // image: BANNER_DATA[index]["image"],
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 20,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, SearchPage.routeName);
                              },
                              child: Container(
                                child: Row(
                                  children: [
                                    addHorizontalSpace(10),
                                    Icon(Icons.search,
                                        color: Colors.grey, size: 20),
                                    FlatButton(
                                      child: Text(
                                        'Cari produk',
                                        style: greySmallText,
                                      ),
                                      onPressed: null,
                                    ),
                                  ],
                                ),
                                alignment: Alignment.centerLeft,
                                height: getProportionateScreenHeight(45),
                                width: getProportionateScreenWidth(250),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                            IconButton(
                                icon: Icon(Icons.chat, color: Colors.white),
                                onPressed: null),
                            IconButton(
                                icon: Icon(Icons.mark_as_unread,
                                    color: Colors.white),
                                onPressed: null),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Container(
                          padding: EdgeInsets.all(3),
                          child: Text('Borneofood', style: whiteText),
                          decoration: BoxDecoration(
                            color: Colors.deepOrange,
                          ),
                        ),
                      )
                    ]),
                  ),

                  // Banner Indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        BANNER_DATA.length,
                        (index) => BannerIndicator(
                              index: index,
                              currentBanner: currentBanner,
                            )),
                  ),

                  // Category
                  Container(
                    height: getProportionateScreenHeight(60),
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      
                      itemCount: allCategory.length,
                      // itemCount: CATEGORY_DATA.length,

                      itemBuilder: (_, index) => Container(
                        margin: EdgeInsets.only(
                          left: (index == 0) ? 5 : 0,

                          right: (index < allCategory.length - 1) ? 5 : 5,
                          // right: (index < CATEGORY_DATA.length - 1) ? 5 : 5,
                        
                        ),
                        child: CategoryCard(

                          allCategory[index].getName,
                          // CATEGORY_DATA[index]["name"],
                          
                          isSelected:
                              selectedCategory == allCategory[index].getName,
                              // selectedCategory == CATEGORY_DATA[index]["name"],
                          onTap: () {
                            setState(() {
                              selectedCategory = allCategory[index].getName;
                              updateListProduct(selectedCategory);
                              // selectedCategory = CATEGORY_DATA[index]["name"];
                            });
                          },
                        ),
                      ),
                    ),
                  ),

                  // Product
                  Expanded(
                      flex: 4,
                      child: Container(
                        color: Colors.grey.withOpacity(0.2),
                        child: Container(
                          margin: EdgeInsets.only(left: 10.0, right: 10.0),
                          child: GridView.builder(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,

                            itemCount: selectedCategory == "semua" ? allProduct.length : filteredProduct.length,
                            // itemCount: PRODUCT_DATA.length,

                            gridDelegate:
                                new SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1 / 1.35,
                            ),
                            itemBuilder: (_, index) => Container(
                                margin: EdgeInsets.only(
                                  top: (index <= 1) ? 10.0 : 0,
                                  bottom: 2.0,
                                ),
                                child: ProductCard(

                                  itemData: selectedCategory == "semua" ? allProduct[index] : filteredProduct[index],
                                  // itemData: PRODUCT_DATA[index],

                                )),
                          ),
                        ),
                      )),
                ])))
      ]),
    );
  }
}
