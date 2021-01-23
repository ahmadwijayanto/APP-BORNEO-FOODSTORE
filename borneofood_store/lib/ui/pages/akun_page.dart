part of 'pages.dart';

class AkunPage extends StatefulWidget {
  static final routeName = "/akun_page";
  @override
  _AkunPageState createState() => _AkunPageState();
}

class _AkunPageState extends State<AkunPage> {
  var selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: mainColor,
          centerTitle: true,
          title: Text(
            'Akun',
            style: appBarText,
          )),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (_, state) => (state is UserLoaded)
            ? ListView(
                children: [
                  Column(
                    children: [
                      Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: defaultMargin),
                          height: 220,
                          margin: EdgeInsets.only(bottom: defaultMargin),
                          width: double.infinity,
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 110,
                                height: 110,
                                margin: EdgeInsets.only(bottom: 16),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/photo_border.png'))),
                                child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage('assets/photo.png'),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                              Text(
                                (context.read<UserCubit>().state as UserLoaded)
                                    .user
                                    .name,
                                style: GoogleFonts.poppins(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                (context.read<UserCubit>().state as UserLoaded)
                                    .user
                                    .email,
                              )
                            ],
                          )),
                      //// Body
                      Card(
                        elevation: 3.0,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              CustomListTile(
                                icon: Icons.people,
                                text: "Change Profile",
                                onTap: () {
                                  print("Location");
                                },
                              ),
                              Divider(
                                height: 10.0,
                                color: Colors.grey,
                              ),
                              CustomListTile(
                                icon: Icons.visibility,
                                text: "Change Password",
                                onTap: () {
                                  print("Location");
                                },
                              ),
                              Divider(
                                height: 10.0,
                                color: Colors.grey,
                              ),
                              CustomListTile(
                                icon: Icons.shopping_cart,
                                text: "List Order",
                                onTap: () {
                                  Get.toNamed(OrderPage.routeName);
                                },
                              ),
                              Divider(
                                height: 10.0,
                                color: Colors.grey,
                              ),
                              CustomListTile(
                                icon: Icons.logout,
                                text: "Logout",
                                onTap: () async {
                                  final prefs =
                                      await SharedPreferences.getInstance();
                                  await prefs.clear();
                                  Get.offAll(LoginPage());
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 80,
                      )
                    ],
                  ),
                ],
              )
            : loadingIndicator,
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String text;

  final Function onTap;

  CustomListTile({this.icon, this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 42,
        child: RaisedButton(
          color: Colors.white,
          onPressed: onTap,
          child: Row(
            children: [
              Icon(icon),
              SizedBox(
                width: 16.0,
              ),
              Text(
                text,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                ),
              )
            ],
          ),
        ));
  }
}
