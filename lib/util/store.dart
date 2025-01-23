import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//用于Provider状态管理的类
class StateData with ChangeNotifier, DiagnosticableTreeMixin {
  String _userName = '123';
  String _token = '';
  String get userName => _userName;
  String get token => _token;
  void setUserName(String userName) {
    _userName = userName;
    notifyListeners();
  }

  void setToken(String token) {
    _token = token;
    notifyListeners();
  }

  @override
  void debugFillPropertiees(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('userName', userName));
    properties.add(StringProperty('token', token));
  }
}
