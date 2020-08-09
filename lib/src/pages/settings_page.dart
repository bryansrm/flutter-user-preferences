import 'package:flutter/material.dart';

import 'package:app_user_preferences/src/widgets/menu_widget.dart';
import 'package:app_user_preferences/src/share_prefs/user_preferences.dart';

class SettingsPage extends StatefulWidget {

  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _colorSecundario;
  int _genero;
  String _nombre;

  TextEditingController _textController;
  final prefs = new UserPreferences();

  void initState(){
    super.initState();

    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _textController = new TextEditingController(text: prefs.nombreUsuario);
  }

  _setSelectedRadio( value ) {

    prefs.genero = value;

    setState(() {
      _genero = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
        backgroundColor: prefs.colorSecundario ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 15.0),
              child: Text('Settings', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),),
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 0),
              value: _colorSecundario,
              title: Text('Cambiar el color secundario'),
              onChanged: ( value ){
                setState(() {
                  prefs.colorSecundario = value;
                  _colorSecundario = value;
                });
              }
            ),
            RadioListTile(
              value: 1,
              title: Text('Masculino'),
              groupValue: _genero,
              onChanged: _setSelectedRadio,
            ),
            RadioListTile(
              value: 2,
              title: Text('Femenino'),
              groupValue: _genero,
              onChanged: _setSelectedRadio,
            ),
            Container(
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                ),
                onChanged: ( value ){
                  print("nombre usuario: $value");
                  prefs.nombreUsuario = value;
                }
              ),
            )
          ],
        ),
      )
    );
  }
}