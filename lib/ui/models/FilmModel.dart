import 'package:flutter/foundation.dart';

class FilmModel extends ChangeNotifier {
  bool _isChecked = false;
  bool get isChecked => _isChecked;
  final Map<String, bool> _map = {};
  Map<String, bool> get map => Map.unmodifiable(_map);

  void toggleState() {
    _isChecked = !_isChecked;
    _map.clear();
    notifyListeners();
  }

  void toggleStateOne(String id) {
    if (_map[id] == null) {
      if (_isChecked) {
        _map[id] = false;
      } else {
        _map[id] = true;
      }
    } else {
      if (_map[id] == true) {
        _map[id] = false;
      } else {
        _map[id] = true;
      }
    }
    notifyListeners();
  }
}