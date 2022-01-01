import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ICPTimeProvider with ChangeNotifier {

  // Declaring SharedPreferences
  SharedPreferences? _icpDailyPref;

  // Key Declaration and Initialization
  static const String firstClassStartedKey = "icpFirstClassKey-Start";
  static const String firstClassEndedKey = "icpFirstClassKey-End";
  static const String secondClassStartedKey = "icpSecondClassKey-Start";
  static const String secondClassEndedKey = "icpSecondClassKey-End";
  static const String periodKey = "icpPeriodKey";

  // Variable Declaration
  bool _firstClassStarted = false;
  bool _firstClassEnded = false;
  bool _secondClassStarted = false;
  bool _secondClassEnded = false;
  int _periodIndex = 0;

  // setting up Getters
  bool get firstClassStarted => _firstClassStarted;
  bool get secondClassStarted => _secondClassStarted;
  bool get firstClassEnded => _firstClassEnded;
  bool get secondClassEnded => _secondClassEnded;
  int get periodIndex => _periodIndex;

  loadAll() {
    _loadFirstClassPrefs();
    _loadSecondClassPrefs();
    _loadPeriodPrefs();
  }

  void firstStarted() {
    _firstClassStarted = true;
    _saveFirstClassPrefs(start: true, end: false);
  }
  void firstEnded() {
    _firstClassEnded = true;
    _savePeriodPrefs(1);
    _saveFirstClassPrefs(start: false, end: true);
  }
  void secondStarted() {
    _secondClassStarted = true;
    _saveSecondClassPrefs(start: true, end: false);
  }
  void secondEnded() {
    _secondClassEnded = true;
    _savePeriodPrefs(0);
    _saveSecondClassPrefs(start: true, end: false);
  }

  void reset() {
    _saveFirstClassPrefs(start: false, end: false);
    _saveSecondClassPrefs(start: false, end: false);
    notifyListeners();
  }
  
  _initPrefs() async {
    if (_icpDailyPref == null) {
      _icpDailyPref = await SharedPreferences.getInstance();
    }
  }
  _loadFirstClassPrefs() async {
    await _initPrefs();
    _firstClassStarted = _icpDailyPref?.getBool(firstClassStartedKey) ?? false;
    _firstClassEnded = _icpDailyPref?.getBool(firstClassEndedKey) ?? false;
    notifyListeners();
  }
  _saveFirstClassPrefs({required bool start, required bool end}) async {
    await _initPrefs();
    _icpDailyPref?.setBool(firstClassStartedKey, start);
    _icpDailyPref?.setBool(firstClassEndedKey, end);
    await _loadFirstClassPrefs();
    notifyListeners();
  }
  _loadSecondClassPrefs() async {
    await _initPrefs();
    _secondClassStarted = _icpDailyPref?.getBool(secondClassStartedKey) ?? false;
    _secondClassEnded = _icpDailyPref?.getBool(secondClassEndedKey) ?? false;
    notifyListeners();
  }
  _saveSecondClassPrefs({required bool start, required bool end}) async {
    await _initPrefs();
    _icpDailyPref?.setBool(secondClassStartedKey, start);
    _icpDailyPref?.setBool(secondClassEndedKey, end);
    await _loadSecondClassPrefs();
    notifyListeners();
  }
  _loadPeriodPrefs() async {
    await _initPrefs();
    _periodIndex = _icpDailyPref?.getInt(periodKey) ?? 0;
    notifyListeners();
  }
  _savePeriodPrefs(int index) async {
    await _initPrefs();
    _icpDailyPref?.setInt(periodKey, index);
    await _loadPeriodPrefs();
    notifyListeners();
  }
}