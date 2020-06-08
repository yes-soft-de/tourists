import 'dart:convert';

import 'package:inject/inject.dart';
import 'package:tourists/consts/urls.dart';
import 'package:tourists/network/http_client/http_client.dart';
import 'package:tourists/responses/login.response.dart';

@provide
class LoginRepository {
  HttpClient _httpClient;

  LoginRepository(this._httpClient);

  Future<Map<String, dynamic>> login(String username, String password) async {
    var response = await _httpClient.post(Urls.loginAPI, {
      'username': username,
      'password': password
    });

    return jsonDecode(response);
  }
}