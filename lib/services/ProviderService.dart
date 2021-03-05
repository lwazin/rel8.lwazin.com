import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Settings with ChangeNotifier, DiagnosticableTreeMixin {
  bool _lock = true;
  bool _dialog = false;
  String _posterUrl = "";
  String _size = "";
  Color _base = Colors.grey[800];
  Color _accent = Colors.black;
  bool _merch = false;

  bool get lock => _lock;
  bool get dialog => _dialog;
  String get posterUrl => _posterUrl;
  String get size => _size;
  Color get base => _base;
  Color get accent => _accent;
  bool get merch => _merch;

  void switchLock() {
    _lock = !_lock;
    notifyListeners();
  }

  void switchDialog() {
    _dialog = !_dialog;
    notifyListeners();
  }

  void switchPoster(String value) {
    _posterUrl = value;

    notifyListeners();
  }

  void switchSize(String value) {
    _size = value;

    notifyListeners();
  }

  void switchBase(Color value) {
    _base = value;
    notifyListeners();
  }

  void switchAccent(Color value) {
    _accent = value;
    notifyListeners();
  }

  void switchMerch() {
    _merch = !_merch;
    notifyListeners();
  }
}
