import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ICPNotificationProvider with ChangeNotifier {
  bool _notificationStatus = true;
  int _minuteTime = 15;

  bool get status => _notificationStatus;
  int get minutes => _minuteTime;

  void switchStatus(bool val) {
    _notificationStatus = val;
    notifyListeners();
  }
  void changeTimeTo(int val) {
    _minuteTime = val;
    notifyListeners();
  }
}