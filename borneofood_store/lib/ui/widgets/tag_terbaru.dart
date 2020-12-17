part of 'widgets.dart';

class TagTerbaru extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 1,
        horizontal: 3,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(),
      ),
      child: Text(
        'Terbaru',
        style: productHabisText,
      ),
    );
  }
}