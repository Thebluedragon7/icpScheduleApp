import 'package:flutter/material.dart';
import 'package:icp_bit_schedule/drawer/icpDrawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ICPSettings extends StatefulWidget {
  const ICPSettings({Key? key}) : super(key: key);

  @override
  State<ICPSettings> createState() => _ICPSettingsState();
}

class _ICPSettingsState extends State<ICPSettings> {

  SharedPreferences? _icpNotificationSetting;
  static const String enableNotificationKey = "alarmNotificationKey";
  static const String minutesNotificationKey = "alarmNotificationTimerKey";

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((icpNotificationSetting) {
      setState(() {
        _icpNotificationSetting = icpNotificationSetting;
        _loadTimeMinutes();
        _loadNotificationStatus();
      });
    });
  }

  bool _alarmStatus = true;
  static const minuteItems = <int>[1, 5, 10, 15, 20, 25, 30, 45, 60];
  final List<DropdownMenuItem<int>> _dropDownTimeItems = minuteItems
      .map(
        (int value) => DropdownMenuItem<int>(
          value: value,
          child: Text(value.toString()),
        ),
      )
      .toList();
  int defaultDropMinute = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const ICPDrawer(),
      backgroundColor: Colors.red,
      body: SafeArea(
        child: ListView(
          children: [
            ListTile(
              textColor: Colors.white70,
              title: Center(
                child: Text("Settings",style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                ),),
              ),
            ),
            SwitchListTile(
              value: _alarmStatus,
              onChanged: (val) {
                setState(() {
                  _alarmStatus = val;
                  _setNotificationStatus(val);
                });
              },
              title: Text("Notify before Class Starts",style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.w700
              ),),
              activeColor: Colors.white70,
            ),
            Visibility(
              visible: _alarmStatus,
              child: ListTile(
                textColor: Colors.white70,
                title: Text("Notify Before ${defaultDropMinute} minutes",
                style: TextStyle(
                  fontWeight: FontWeight.w700
                ),),
                trailing: DropdownButton<int>(
                  value: defaultDropMinute,
                  onChanged: (int? newValue) {
                    if (newValue != null) {
                      setState(() {
                        defaultDropMinute = newValue;
                        _setMinutesNotification(newValue);
                      });
                    }
                  },
                  items: this._dropDownTimeItems,
                  dropdownColor: Colors.black12,
                  alignment: Alignment.center,
                  menuMaxHeight: 200,
                  style: TextStyle(
                    color: Colors.white70
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _loadNotificationStatus() {
    setState(() {
      _alarmStatus = _icpNotificationSetting?.getBool(enableNotificationKey) ?? true;
    });
  }
  void _loadTimeMinutes() {
    setState(() {
      defaultDropMinute = _icpNotificationSetting?.getInt(minutesNotificationKey) ?? 15;
    });
  }

  Future<void> _setNotificationStatus(bool value) async {
    await _icpNotificationSetting?.setBool(enableNotificationKey, value);
  }
  Future<void> _setMinutesNotification(int value) async {
    await _icpNotificationSetting?.setInt(minutesNotificationKey, value);
  }

}
