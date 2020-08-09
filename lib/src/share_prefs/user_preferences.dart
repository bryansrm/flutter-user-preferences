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

  // GET y SET genero
  get genero{
    return _prefs.getInt('genero') ?? 2;
  }

  set genero(int value){
    _prefs.setInt('genero', value);
  }

  get nombreGenero{
    int genero = _prefs.getInt('genero') ?? 1;
    return genero == 1 ? 'Masculino' : 'Femenino';
  }

  // GET y SET color secundario
  get colorSecundario{
    return _prefs.getBool('colorSecundario') ?? false;
  }

  set colorSecundario(bool value){
    _prefs.setBool('colorSecundario', value);
  }

  // GET y SET nombre de usuario
  get nombreUsuario{
    return _prefs.getString('nombreUsuario') ?? '';
  }

  set nombreUsuario(String value){
    _prefs.setString('nombreUsuario', value);
  }

  // GET y SET ultima pagina
  get lastPage{
    return _prefs.getString('lastPage') ?? 'home';
  }

  set lastPage(String value){
    _prefs.setString('lastPage', value);
  }

}