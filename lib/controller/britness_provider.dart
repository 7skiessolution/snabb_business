import 'package:flutter/material.dart';

enum AppBritness { light, dart }

class BritnessProvider with ChangeNotifier {
  AppBritness _britness = AppBritness.light;
  AppBritness get britness => _britness;

  set britness(AppBritness value) {
    _britness = value;
    notifyListeners();
  }
}
