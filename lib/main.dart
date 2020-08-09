import 'package:flutter/material.dart';
 
import 'package:app_user_preferences/src/pages/home_page.dart';
import 'package:app_user_preferences/src/pages/settings_page.dart';
import 'package:app_user_preferences/src/share_prefs/user_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new UserPreferences();
  await prefs.initPref();
  
  runApp(MyApp());
} 
 
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User preferences',
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName     : (BuildContext context) => HomePage(),
        SettingsPage.routeName : (BuildContext context) => SettingsPage(),
      },
    );
  }
}