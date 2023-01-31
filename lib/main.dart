import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thikdr/ui/home/home.dart';
import 'package:thikdr/ui/login/login.dart';
import 'package:thikdr/utils/color_constant.dart';
import 'package:thikdr/utils/pref_utils.dart';

import 'localization/locale_constants.dart';
import 'localization/localizations_delegate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static void setLocale(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(newLocale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Locale _locale=Locale('en');

  @override
  void initState() {
    super.initState();

  }

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() async {
    getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thikdr',
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Splash Screen Page'),
      debugShowCheckedModeBanner: false,
      locale: _locale,
      supportedLocales: [
        Locale('en', ''),
        Locale('hi', ''),
      ],
      localizationsDelegates: [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode &&
              supportedLocale.countryCode == locale?.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();

    gotoNextPage();
  }

  void gotoNextPage() async{
    var token = await PrefUtils().getPreferencesData("token");
    if(token == null || token.toString().isEmpty) {
      Timer(
          Duration(seconds: 3),
              () =>
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage())));
    }else if (token != null && token.toString().isNotEmpty){
      Timer(
          Duration(seconds: 3),
              () =>
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage())));
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        /*appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),*/
        body: Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: const Alignment(0.0073, 0.02821),
              end: const Alignment(0.9940, 1.0),
              colors: [ColorConstant.red900, ColorConstant.deepOrange400De])),
      child: Center(
        child: Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: const Image(image: AssetImage('assets/images/logo.png')),
        ),
      ),
      /* floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), */ // This trailing comma makes auto-formatting nicer for build methods.
    ));
  }
}
