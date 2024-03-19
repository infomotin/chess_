import 'package:flutter/material.dart';

class GameProvider extends ChangeNotifier {
  //State Declaration
  bool _vsComputer = false;
  bool _vsPlayer = false;
  bool _vsCustom = false;
  bool _isDark = false;
  bool _isLoading = false;

  //Getters
  bool get vsComputer => _vsComputer;
  bool get vsPlayer => _vsPlayer;
  bool get vsCustom => _vsCustom;
  bool get isDark => _isDark;
  bool get isLoading => _isLoading;

  //Setters
  Future<void> setVsComputer({required bool value}) async {
    _vsComputer = value;
    notifyListeners();
  }
  void setVsPlayer({required bool value}) {
    _vsPlayer = value;
    notifyListeners();
  }
  void setVsCustom( {required bool value}) {
    _vsCustom = value;
    notifyListeners();
  }
  void setIsDark( {required bool value}) {
    _isDark = value;
    notifyListeners();
  }
void setIsLoading( {required bool value}) {
    _isLoading = value;
    notifyListeners();
  }

}