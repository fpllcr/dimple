import 'package:flutter/material.dart';
import 'homepage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main(){
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Dimple",
    theme: ThemeData(
      primarySwatch: Colors.indigo,
      buttonColor: Colors.indigo[200],
      textTheme: TextTheme(body1: TextStyle(color: Colors.black)),
      hintColor: Colors.black
    ),
    home: new HomePage(),
    localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('en', 'GB'),
        const Locale('es', 'AR'),
        const Locale('es', 'ES'),
        const Locale('es', 'BO'),
        const Locale('es', 'CO'),
        const Locale('es', 'EC'),
        const Locale('es', 'PE'),
        const Locale('es', 'PA'),
        const Locale('fr', 'CA'),
        const Locale('fr', 'FR'),
        const Locale('fr', 'BE'),
        const Locale('fr', 'CH'),
        const Locale('ja', 'JP'),
        const Locale('pt', 'PT'),
        const Locale('pt', 'BR'),
        const Locale('de', 'DE'),
        const Locale('it', 'IT'),
        const Locale('ko', 'KR'),
        const Locale('ru', 'RU'),
      ],
  ));
}