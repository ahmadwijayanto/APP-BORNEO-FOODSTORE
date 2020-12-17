part of 'widgets.dart';

class NavigationBar extends StatefulWidget {
  final int selectedScreen;

  const NavigationBar({this.selectedScreen});

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _currentIndex;

  @override
  Widget build(BuildContext context) {
    _currentIndex = widget.selectedScreen;
    widget.selectedScreen == -1 ? _currentIndex = 0 : _currentIndex = widget.selectedScreen;

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      backgroundColor: Colors.deepOrangeAccent,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white38,
      selectedFontSize: 11,
      unselectedFontSize: 10,
      selectedLabelStyle: selectedNavBarText,
      unselectedLabelStyle: unselectedNavBarText,
      onTap: (value){
        setState(() {
          _currentIndex = value;
          Navigator.pushReplacementNamed(context, SelectionPage.routeName,
              arguments: ScreenArguments(value, false));
        });
      },
      items: [
        BottomNavigationBarItem(label: "Belanja", icon: Icon(Icons.store)),
        BottomNavigationBarItem(label: "Info", icon: Icon(Icons.shop)),
        BottomNavigationBarItem(label: "Keranjang", icon: Icon(Icons.shopping_cart)),
        BottomNavigationBarItem(label: "Akun", icon: Icon(Icons.person)),
      ],
    );
  }
}
