part of 'pages.dart';

class BelanjaPage extends StatefulWidget {
  static final routeName = "/belanja_page";

  @override
  _BelanjaPageState createState() => _BelanjaPageState();
}

class _BelanjaPageState extends State<BelanjaPage> {
  String selectedCategory = "Semua";
  int currentBanner = 0;

  PageController bannerController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    //cek login state
    // kalau sudah login tulisan dan gambar "akun"
    // kalau belum login tulisan dan gambar "masuk"

    super.initState();



    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (currentBanner < 2) {
        currentBanner++;
      } else {
        currentBanner = 0;
      }

      bannerController.animateToPage(
        currentBanner,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
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
                        itemCount: BANNER_DATA.length,
                        itemBuilder: (context, index) => ShopBanner(
                          image: BANNER_DATA[index]["image"],
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
                      itemCount: CATEGORY_DATA.length,
                      itemBuilder: (_, index) => Container(
                        margin: EdgeInsets.only(
                          left: (index == 0) ? 5 : 0,
                          right: (index < CATEGORY_DATA.length - 1) ? 5 : 5,
                        ),
                        child: CategoryCard(
                          CATEGORY_DATA[index]["name"],
                          isSelected:
                              selectedCategory == CATEGORY_DATA[index]["name"],
                          onTap: () {
                            setState(() {
                              selectedCategory = CATEGORY_DATA[index]["name"];
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
                            itemCount: PRODUCT_DATA.length,
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
                                  itemData: PRODUCT_DATA[index],

                                )),
                          ),
                        ),
                      )),
                ])))
      ]),
    );
  }
}
