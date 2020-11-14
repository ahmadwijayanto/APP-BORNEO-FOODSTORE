import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget addVerticalSpace(double height) {
  return SizedBox(height: height);
}

Widget addHorizontalSpace(double width) {
  return SizedBox(width: width);
}

String formatCurrency(num amount, {int decimalCount = 0}) {
  final formatCurrency =
      new NumberFormat.simpleCurrency(decimalDigits: decimalCount);
  return formatCurrency.format(amount);
}
