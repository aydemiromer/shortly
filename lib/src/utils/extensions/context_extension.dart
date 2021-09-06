import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double dynamicWidth(double val) => MediaQuery.of(this).size.width * val;
  double dynamicHeight(double val) => MediaQuery.of(this).size.height * val;
}

extension PaddingExtension on BuildContext {
  EdgeInsets get paddingAllow => EdgeInsets.all(dynamicHeight(0.06));

  EdgeInsets get paddingSymetric =>
      EdgeInsets.symmetric(vertical: 20, horizontal: 20);

  EdgeInsets get paddingTop => EdgeInsets.fromLTRB(0, 20, 0, 0);
}
