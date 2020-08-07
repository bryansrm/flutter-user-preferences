import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {

  static final String routName = 'settings';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
      ),
      body: Column(
          children: [
            Text('Ajustes Page'),
          ],
        )
    );
  }
}