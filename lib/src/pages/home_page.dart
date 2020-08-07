import 'package:app_user_preferences/src/pages/settings_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  static final String routName = 'home';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de usuario'),
      ),
      drawer: _crearMenu(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Color secundario:'),
          Divider(),
          Text('Género:'),
          Divider(),
          Text('Nombre de usuario:'),
          Divider(),
        ],
      )
    );
  }

  Drawer _crearMenu(BuildContext context){
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
            onTap: () => Navigator.pop(context),
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
              Navigator.pushReplacementNamed(context, SettingsPage.routName);
            }
          ),
        ],
      )
    );
  }
}