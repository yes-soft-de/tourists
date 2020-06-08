import 'app.component.dart' as _i1;
import '../../network/http_client/http_client.dart' as _i2;
import 'dart:async' as _i3;
import '../../main.dart' as _i4;

class AppComponent$Injector implements _i1.AppComponent {
  AppComponent$Injector._();

  _i2.HttpClient _singletonHttpClient;

  static _i3.Future<_i1.AppComponent> create() async {
    final injector = AppComponent$Injector._();

    return injector;
  }

  _i4.MyApp _createMyApp() => _i4.MyApp(null);
  _i2.HttpClient _createHttpClient() =>
      _singletonHttpClient ??= _i2.HttpClient();
  @override
  _i4.MyApp get app => _createMyApp();
  @override
  _i2.HttpClient getHttpClient() => _createHttpClient();
}
