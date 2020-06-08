import 'package:inject/inject.dart';
import 'package:tourists/repositories/login/login.repository.dart';
import 'package:tourists/responses/login.response.dart';

@provide
class LoginManager {
  LoginRepository _loginRepository;

  LoginManager(this._loginRepository);

  Future<LoginResponse> login(String username, String password) async {
    var response = await this._loginRepository.login(username, password);

    return LoginResponse(response);
  }
}