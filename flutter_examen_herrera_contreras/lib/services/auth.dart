

import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  //Obtener token
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('authToken');
  }

  //Verificar si el usuario esta loggeado
  Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null;
  }

  //Eliminar token
  Future<void> deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('authToken');
  }
}
