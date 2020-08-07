import 'package:flutter/material.dart';

import 'package:app_user_preferences/src/pages/home_page.dart';
import 'package:app_user_preferences/src/pages/settings_page.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/menu-img.jpg'),
                fit: BoxFit.cover
              )
            ),
          ),
          ListTile(
            leading: Icon( Icons.home, color: Colors.blue),
            title: Text('Home'),
            onTap: () => Navigator.pushReplacementNamed(context, HomePage.routeName)
          ),
          ListTile(
            leading: Icon( Icons.person, color: Colors.blue),
            title: Text('Person'),
            onTap: (){},
          ),
          ListTile(
            leading: Icon( Icons.warning, color: Colors.blue),
            title: Text('Alertas'),
            onTap: (){},
          ),
          ListTile(
            leading: Icon( Icons.settings, color: Colors.blue),
            title: Text('Ajustes'),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, SettingsPage.routeName);
            }
          ),
        ],
      )
    );
  }
}