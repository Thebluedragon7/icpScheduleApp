import 'package:flutter/cupertino.dart';

class RouteProvider with ChangeNotifier {
  final List<String> _icpRoutes = ["/userSetup", "/home", "/classesOver"];

  int _routeIndex = 1;

  String get icpRoute => _icpRoutes[_routeIndex];

  void loggedIn() {
    _routeIndex = 1;
  }
  void classOver() {
    _routeIndex = 2;
  }
}