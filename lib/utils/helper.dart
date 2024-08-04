import 'package:flutter/material.dart';

List<Color> txnHistoryColorList = const [
  Color(0xFFE8AFAF),
  Color(0xFFAFD3E8),
  Color(0xFFE8D1AF),
  Color(0xFFFFA0A0),
  Color(0xFF9ED1FF),
  Color(0xFFFFEDAA),
  Color(0xFFCEAFF4),
  Color(0xFFFFAD94),
  Color(0xFFA6AFFF),
  Color(0xFFA3D9AE),
  Color(0xFF7DE0E7),
  Color(0xFF4B4B4B),
  Color(0xFFD9D9D9)
];

String getShortName(String name) {
  if (name.isEmpty) {
    return "";
  } else {
    return name.split(' +').map((var el) => el[0]).join('');
  }
}

int calculateSumOfaName(String name) {
  int score = 0;
  for (int j = 0; j < name.length; j++) {
    score += name.codeUnitAt(j);
  }
  return score;
}

Color getColor(String name) {
  int score = calculateSumOfaName(name);
  int index = score % txnHistoryColorList.length;
  return txnHistoryColorList[index];
}
