import 'package:flutter/material.dart';

class SizeProvider extends ChangeNotifier {
  static SizeProvider? _instance;

  SizeProvider._private();

  static SizeProvider get instance => _instance ??= SizeProvider._private();

  String? _selectedSize;
  String? get selectedSize => _selectedSize;

  set selectedSize(String? value) {
    _selectedSize = value;
    notifyListeners();
  }
}
