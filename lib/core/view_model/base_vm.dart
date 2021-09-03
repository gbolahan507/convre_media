import 'package:convre/export.dart';
import 'package:flutter/material.dart';




class BaseModel extends ChangeNotifier {
  bool _busy = false;

  bool get busy => _busy;

  DialogService dialog = locator<DialogService>();
  NavigationService navigate = locator<NavigationService>();

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}
