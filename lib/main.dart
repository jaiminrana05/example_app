import 'package:example_app/pages/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'generated/l10n.dart';

void main() => runApp(const MyApp());

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: const [
        Str.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: Str.delegate.supportedLocales,
      theme: ThemeData(platform: TargetPlatform.android),
      //home: const BasicNavigation(),

      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const BasicNavigation(),
      //   '/second page': (context) =>
      //       const SecondPage(data: 'Hi from first page'),
      // },

      //initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      navigatorObservers: [
        routeObserver,
      ], // MyRouteObserver()
      navigatorKey: navigatorKey,
    );
  }
}
