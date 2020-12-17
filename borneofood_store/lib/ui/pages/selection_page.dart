part of 'pages.dart';

class SelectionPage extends StatefulWidget {
  static final routeName = "/selection_page";

  @override
  _SelectionPageState createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  int _selectedScreen = 0;
  bool loggedIn = false;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    // args.selectedIndex == -1
    //     ? _pageController = PageController(initialPage: 0)
    //     : _pageController = PageController(initialPage: args.selectedIndex);
    // args.selectedIndex == -1
    //     ? _selectedScreen = 0
    //     : _selectedScreen = args.selectedIndex;

    return Scaffold(
      body: PageView(
        children: [
          BelanjaPage(),
          InfoPage(),
          KeranjangPage(),
          args.loggedIn ? 
            AkunPage() :
            SignInNumberPage(),  
          // AkunPage(),
        ],
        onPageChanged: (index) {
          setState(() {
            _selectedScreen = index;
          });
        },
        controller: _pageController,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedScreen,
        backgroundColor: Colors.deepOrangeAccent,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white38,
        selectedFontSize: 11,
        unselectedFontSize: 10,
        selectedLabelStyle: selectedNavBarText,
        unselectedLabelStyle: unselectedNavBarText,
        onTap: (value) {
          setState(() {
            _selectedScreen = value;
            _pageController.animateToPage(
              _selectedScreen,
              duration: Duration(
                milliseconds: 200,
              ),
              curve: Curves.easeIn,
            );
          });
        },
        items: [
          BottomNavigationBarItem(label: "Belanja", icon: Icon(Icons.store)),
          BottomNavigationBarItem(label: "Info", icon: Icon(Icons.shop)),
          BottomNavigationBarItem(
              label: "Keranjang", icon: Icon(Icons.shopping_cart)),
              args.loggedIn ? 
              BottomNavigationBarItem(label: "Akun", icon: Icon(Icons.person)) :
              BottomNavigationBarItem(label: "Masuk", icon: Icon(Icons.person)),
          // BottomNavigationBarItem(label: "Akun", icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
