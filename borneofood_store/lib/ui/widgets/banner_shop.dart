part of 'widgets.dart';

class ShopBanner extends StatelessWidget {
  final String image;
  const ShopBanner({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.cover,
      child: Image.network(
        imageURL+image
      ),
    );
  }
}