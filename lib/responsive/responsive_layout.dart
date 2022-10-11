import 'package:adaptive_flutter/responsive/dimension.dart';
import 'package:adaptive_flutter/responsive/mobile_body.dart';
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget desktopBody;
  final Widget tabletBody;

  const ResponsiveLayout({
    super.key,
    required this.desktopBody,
    required this.mobileBody,
    required this.tabletBody,
  });

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 850;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 && MediaQuery.of(context).size.width >= 850;


  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
   final Size _size = MediaQuery.of(context).size;

   if(_size.width >= 1100){
     return desktopBody;
   }else if(_size.width >=850 && _size.width <1100){
     return tabletBody;
   }else{
     return mobileBody;
   }
  }
}
