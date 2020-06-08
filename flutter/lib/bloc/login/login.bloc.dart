import 'package:rxdart/rxdart.dart';
import 'package:tourists/services/login/login.service.dart';

class LoginBloc {
  LoginService _loginService;

  LoginBloc(this._loginService);

  final _loginChecker = PublishSubject<bool>();

  Stream<bool> get loginStatus => _loginChecker.stream;

  login(String username, String password) async {
    bool loginResponse = await _loginService.login(username, password);

    _loginChecker.add(loginResponse);
  }

  dispose() {
    _loginChecker.close();
  }
}