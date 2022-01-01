import 'package:flutter/material.dart';
import 'package:icp_bit_schedule/core/icpSettings.dart';
import 'package:icp_bit_schedule/drawer/drawerPages/drawerICPSchedule.dart';
import 'package:icp_bit_schedule/drawer/drawerPages/icpMap.dart';
import 'package:url_launcher/url_launcher.dart';

class ICPDrawer extends StatelessWidget {
  const ICPDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Image(
              image: AssetImage("assets/icons/icpLogo.png"),
            ),
          ),
          ListTile(
            title: Image(
              image: AssetImage("assets/icons/icpText.png"),
            ),
          ),
          ListTile(
            leading: Icon(Icons.receipt_outlined),
            title: const Text('Schedule'),
            onTap: () => Navigator.push(context,
            MaterialPageRoute(
              builder: (context) => const DrawerICPSchedule()
            ))
          ),
          ListTile(
            leading: Icon(Icons.map_rounded),
            title: const Text('Nepal Block Map'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) => const ICPMap()));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) => const ICPSettings()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.info_outline
            ),
           title: const Text('About Developer'),
           onTap: () {
             showDialog(
               context: context,
               builder: (BuildContext context) =>
               AlertDialog(
                 title: Center(child: Text('About Developer')),
                 content: Column(
                   children: [
                     const Text("""
This app was created and released by Milan Gurung in 2022 AD as a student of Informatics College Pokhara.\n
This project was built under Flutter framework (Dart) 
"""),
                     InkWell(
                       child: Text("Send feedback"),
                       focusColor: Colors.red,
                       onTap: () {
                         launch('mailto:milan.gurung.a21.2@icp.edu.np');
                       },
                     ),
                   ],
                 ),
                 actions: [
                   TextButton(onPressed: () =>
                     Navigator.pop(context), child: const Text("OK"))
                 ],
               ),
             );
           },
          ),
        ],
      ),
    );
  }
}
