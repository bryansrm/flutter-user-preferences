import 'package:app_user_preferences/src/share_prefs/user_preferences.dart';
import 'package:flutter/material.dart';

import 'package:app_user_preferences/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {

  final prefs = new UserPreferences();

  static final String routeName = 'home';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de usuario'),
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Color secundario:'),
          Divider(),
          Text('Género: ${prefs.genero}'),
          Divider(),
          Text('Nombre de usuario:'),
          Divider(),
        ],
      )
    );
  }
}