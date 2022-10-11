import 'dart:io';

import 'package:flutter/cupertino.dart';

class Utils{
  static bool isMobile () => Platform.isAndroid || Platform.isIOS;
  static bool isDesktop () => Platform.isWindows || Platform.isMacOS || Platform.isLinux;

   double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
  static double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
}
