import 'package:flutter/material.dart';

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
    _textController = new TextEditingController(text: _nombre);
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
              onChanged: ( value ){
                setState(() {
                  _genero = value;
                });
              },
            ),
            RadioListTile(
              value: 2,
              title: Text('Femenino'),
              groupValue: _genero,
              onChanged: ( value ){
                setState(() {
                  _genero = value;
                });
              },
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