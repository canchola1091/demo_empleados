
import 'package:shared_preferences/shared_preferences.dart';

class GlobalPreferences {
  
  static final GlobalPreferences _instancia = GlobalPreferences._internal(); 
  factory GlobalPreferences() {
    return _instancia;
  }
  GlobalPreferences._internal();
  late SharedPreferences _globalPreferences;
  initVarsPermanentes() async {
    _globalPreferences = await SharedPreferences.getInstance();
  }

  /// NOMBRE DE USUARIO
  String? get userName => _globalPreferences.getString('userName');
  set userName(String? value) => _globalPreferences.setString('userName', value ?? '');

  // LOGIN
  bool? get isSession => _globalPreferences.getBool('isSession'); // TODO: Revisar valor null
  set isSession(bool? value) => _globalPreferences.setBool('isSession', value ?? false);
} 