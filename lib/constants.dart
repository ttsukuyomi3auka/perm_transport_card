// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:perm_transport_card/models/card.dart';

String defaultId = "96431059033";

PermCard unknown = PermCard("Добавить карту", "", "", "", DateTime.now(), "",
    DateTime.now(), "", "Транспортная карта");

abstract class CustomColor {
  static Color green = Color.fromARGB(255, 50, 118, 57);
  static Color grey = Color.fromARGB(255, 117, 117, 117);
  static Color greyIcon = Color.fromARGB(255, 152, 152, 152);
  static Color blue = Color.fromARGB(255, 33, 82, 184);
  static Color blueLight = Color.fromARGB(255, 145, 199, 209);
  static Color blueIcon = Color.fromARGB(255, 56, 126, 237);
  static Color blackUpDown = Color.fromARGB(255, 18, 18, 18);
  static Color black = Color.fromARGB(255, 34, 34, 34);
}
