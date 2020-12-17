part of 'widgets.dart';

class TagTersedia extends StatelessWidget {
  final int stock;
  const TagTersedia({Key key, this.stock}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 1,
        horizontal: 3,
      ),
      decoration: BoxDecoration(
        color: (this.stock <= 0) ? Colors.white : Colors.black,
        border: Border.all(),
      ),
      child: Text(
        (this.stock <= 0) ? 'Habis' : 'Tersedia',
        style: (this.stock <= 0) ? productHabisText : productTersediaText,
      ),
    );
  }
}