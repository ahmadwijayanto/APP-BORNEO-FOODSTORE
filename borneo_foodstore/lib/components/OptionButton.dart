import 'package:flutter/material.dart';
import 'package:borneo_foodstore/utils/utils_function.dart';

class OptionButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final double width;

  const OptionButton(
      {Key key, @required this.text, @required this.icon, @required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: FlatButton(
          color: Colors.blueAccent,
          splashColor: Colors.white.withAlpha(55),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              addHorizontalSpace(10),
              Text(
                text,
                style: TextStyle(color: Colors.white),
              )
            ],
          )),
    );
  }
}
