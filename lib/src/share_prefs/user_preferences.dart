import 'package:shared_preferences/shared_preferences.dart';


class UserPreferences {

  static final UserPreferences _instance = new UserPreferences._internal();

  factory UserPreferences(){
    return _instance;
  }

  UserPreferences._internal();

  SharedPreferences _prefs;

  initPref() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // bool _colorSecundario;
  // int _genero;<  
  // String _nombre;

  get genero{
    return _prefs.getInt('genero') ?? 2;
  }

  set genero(int value){
    _prefs.setInt('genero', value);
  }

}