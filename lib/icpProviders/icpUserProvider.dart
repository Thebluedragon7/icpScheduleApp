import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ICPUserProvider with ChangeNotifier {
  String _section = "C4";
  int _semester = 1;
  String _firstName = "";
  String _lastName = "";
  String _programme = "BIT";

  String get firstName => _firstName;
  String get lastName => _lastName;
  int get semester => _semester;
  String get section => _section;
  String get programme => _programme;

  void setNameAndProg(String fName, String lName, String prog) {
    _firstName = fName;
    _lastName = lName;
    _programme = prog;
    notifyListeners();
  }

  void changeSemAndSec(int sem, String section) {
    _semester = sem;
    _section = section;
    notifyListeners();
  }
}