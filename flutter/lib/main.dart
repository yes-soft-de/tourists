import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inject/inject.dart';
import 'package:provider/provider.dart';
import 'package:tourists/ui/screens/login/login.dart';

import 'di/components/app.component.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]).then((_) async {
    var appComponent = await AppComponent.create();

    runApp(EasyLocalization(
        child: appComponent.app,
        supportedLocales: [
          Locale('en', 'US'),
          Locale('ar', 'DZ'),
        ],
        path: 'resources/langs/langs.csv',
        assetLoader: JsonAssetLoader()));

  });


}

@provide
class MyApp extends StatelessWidget {

  final Provider<LoginScreen> loginScreen;

  MyApp(this.loginScreen): super();

  @override
  Widget build(BuildContext context) {
    log(context.locale.toString(), name: '${this} # locale Context');
    log('title'.tr().toString(), name: '${this} # locale');
    return MaterialApp(
      title: 'title'.tr(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: loginScreen,
    );
  }
}
