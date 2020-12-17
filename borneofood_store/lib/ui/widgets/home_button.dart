part of 'widgets.dart';

class HomeButton extends StatelessWidget {
  final String text;
  final Function onTap;

  const HomeButton({Key key, this.text, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(50),
      child: FlatButton(
        onPressed: onTap, 
        color: Colors.deepOrangeAccent,
        child: Text(
          text,
          style: mainButtonText
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
      ),
    );
  }
}