part of 'shared.dart';

const double defaultMargin = 24;

Color mainColor = Color(0xFFF95724);
Color accentColor1 = Color(0xFFC23F16);
Color accentColor2 = Color(0xFFFF7448);
Color accentColor3 = Color(0xFF56352B);
Color clearWhite = Color(0xFFFFFFFF);
Color productNameColor = Color(0xFF292929);

TextStyle appBarText = GoogleFonts.montserrat()
    .copyWith(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18);
TextStyle selectedNavBarText =
    GoogleFonts.montserrat().copyWith(color: Colors.white, fontSize: 11);
TextStyle unselectedNavBarText =
    GoogleFonts.montserrat().copyWith(color: Colors.white38, fontSize: 10);
TextStyle mainButtonText = GoogleFonts.montserrat()
    .copyWith(color: Colors.white, fontWeight: FontWeight.w200, fontSize: 15);
TextStyle productNameText = GoogleFonts.montserrat().copyWith(
    color: Colors.grey[850], fontWeight: FontWeight.w200, fontSize: 17);
TextStyle productPriceText = GoogleFonts.montserrat()
    .copyWith(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 18);

// Bold Text
TextStyle boldSmallText = GoogleFonts.montserrat()
    .copyWith(color: Colors.black, fontWeight: FontWeight.bold);
TextStyle boldMediumText = GoogleFonts.montserrat()
    .copyWith(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18);

// Black Text
TextStyle blackSmallText = GoogleFonts.montserrat()
    .copyWith(color: Colors.black, fontWeight: FontWeight.normal);
TextStyle blackMediumText = GoogleFonts.montserrat()
    .copyWith(color: Colors.black, fontWeight: FontWeight.w200, fontSize: 18);
TextStyle blackLargeText = GoogleFonts.montserrat()
    .copyWith(color: Colors.black, fontWeight: FontWeight.w200, fontSize: 18);


// Grey Text
TextStyle greySmallText = GoogleFonts.montserrat()
    .copyWith(color: Colors.grey, fontWeight: FontWeight.normal);
TextStyle greyMediumText = GoogleFonts.montserrat()
    .copyWith(color: Colors.grey[700], fontWeight: FontWeight.normal, fontSize: 18);

// White Text
TextStyle whiteText = GoogleFonts.montserrat()
    .copyWith(color: Colors.white, fontWeight: FontWeight.normal);

// Product Tag Text
TextStyle productTersediaText = GoogleFonts.roboto()
    .copyWith(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 12);
TextStyle productHabisText = GoogleFonts.roboto()
    .copyWith(color: Colors.deepOrange, fontWeight: FontWeight.normal, fontSize: 12);
