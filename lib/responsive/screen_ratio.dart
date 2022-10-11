import 'package:flutter/cupertino.dart';

class ScreenRatio{
  final BuildContext context;

  ScreenRatio(this.context);

  double get width => MediaQuery.of(context).size.width;

  double get height => MediaQuery.of(context).size.height;

  bool get is4on3 => width / height == 4 / 3.toInt();

  bool get is16on9 => width / height == 16 / 9.toInt();
}