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
                                (context.bloc<UserCubit>().state as UserLoaded)
                                    .user
                                    .name,
                                style: GoogleFonts.poppins(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                (context.bloc<UserCubit>().state as UserLoaded)
                                    .user
                                    .email,
                              )
                            ],
                          )),
                      //// Body
                      Container(
                        width: double.infinity,
                        color: Colors.white,
                        child: Column(
                          children: [],
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
