import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'core/internationalization/internationalization.dart';
import 'core/routes/routes.dart';
import 'core/util/injection_container.dart' as di;

void main() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await SystemChrome.setPreferredOrientations(
        <DeviceOrientation>[
          DeviceOrientation.portraitUp,
        ],
      );
      try {
        await dotenv.load(fileName: '.env');
        await di.init();
      } catch (e) {
        //
      }
      runApp(const MyApp());
    },
    (Object error, StackTrace stackTrace) {
      // print('Error en runZonedGuarded: $error, $stackTrace');
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => GetMaterialApp(
        title: 'Onboarding',
        theme: ThemeData(
          fontFamily: 'Poppins',
        ),
        translations: Internationalization(),
        getPages: getRoutes,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const <Locale>[
          Locale('es'),
        ],
        locale: const Locale('es'),
        initialRoute: '/onboarding_page',
      );
}
