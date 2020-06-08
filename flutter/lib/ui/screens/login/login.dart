import 'package:flutter/material.dart';
import 'package:inject/inject.dart';
import 'package:tourists/bloc/login/login.bloc.dart';
import 'package:tourists/services/login/login.service.dart';

@provide
class LoginScreen extends StatefulWidget {
  final LoginBloc _loginBlock;

  LoginScreen(this._loginBlock);

  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    widget._loginBlock.login('Mick', 'Sawy3r');

    return StreamBuilder(
      stream: widget._loginBlock.loginStatus,
      builder: (context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data) {
            return Container(
              width: 250,
              height: 250,
              color: Colors.green,
            );
          } else {
            return Container(
              width: 250,
              height: 250,
              color: Colors.red,
            );
          }
        } else {
          return Container();
        }
      },
    );
  }
}
