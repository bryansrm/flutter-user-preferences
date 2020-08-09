import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:app_user_preferences/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {

  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _colorSecundario = false;
  int _genero = 1;
  String _nombre = 'Pedro';

  TextEditingController _textController;

  void initState(){
    super.initState();
    _cargarPreferences();
    _textController = new TextEditingController(text: _nombre);
  }

  _cargarPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _genero = prefs.getInt('genero');
    setState(() {});
  }

  _setSelectedRadio( value ) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setInt('genero', value);

    setState(() {
      _genero = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
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
                  _colorSecundario = !_colorSecundario;
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
                  
                }
              ),
            )
          ],
        ),
      )
    );
  }
}