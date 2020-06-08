import 'package:inject/inject.dart';
import 'package:tourists/managers/login/login.manager.dart';
import 'package:tourists/responses/login.response.dart';

@provide
class LoginService {

  LoginManager _loginManager;

  LoginService(this._loginManager);

  Future<bool> login(String username, String password) async {
    LoginResponse loginResponse = await _loginManager.login(username, password);

    if (loginResponse != null) {
      // TODO: Cache the Token Here
      return true;
    } else {
      return false;
    }
  }
}