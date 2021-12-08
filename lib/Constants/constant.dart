import 'package:flutter/material.dart';

/// Get Device Mesurement

double getDeviceWidth(BuildContext context, double precentage) =>
    MediaQuery.of(context).size.width * precentage;

double getDeviceHeight(BuildContext context, double precentage) =>
    MediaQuery.of(context).size.height * precentage;

///  COLOR
///  Color A - 1B343A
///  Color B - 120464F
///  Color C - A1CCA5
///  Color D - 8FB996
///  Color E - 709775

const kColorA = Color(0xFF1B343A);
const kColorB = Color(0xFF20464F);
const kColorC = Color(0xFFA1CCA5);
const kColorD = Color(0xFF8FB996);
const kColorE = Color(0xFF709775);

const kWhite = Colors.white;

void navigatePage(BuildContext context, dynamic page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

void gotoBack(BuildContext context) {
  Navigator.pop(context);
}
