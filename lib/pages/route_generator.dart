import 'package:example_app/pages/key_navigation.dart';
import 'package:example_app/pages/page_route_transition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../get_person.dart';
import 'List_of_wheel.dart';
import 'basic_navigation.dart';
import 'new/route_observer.dart';
import 'sending_data.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const BasicNavigation(),
        );
      case '/second page':
        if (arguments is String) {
          return MaterialPageRoute(
            builder: (_) => SecondPage(data: arguments),
          );
        }
        return errorScreen();

      case '/person':
        return MaterialPageRoute(
            builder: (context) => const GetPerson(), settings: settings
            // RouteSettings(
            //   arguments: arguments,
            // ),
            );
      case '/detail':
        return MaterialPageRoute(
          builder: (_) => Description(
            todos: arguments as Todo,
          ),
        );
      case '/Cupertino page route':
        return CupertinoPageRoute(
          builder: (context) => MyCupertinoPage(
            data: arguments.toString(),
          ),
        );
      case '/returning data':
        return CupertinoPageRoute(
          builder: (context) => const GotoSelectButtons(),
        );
      case '/sending data':
        return CupertinoPageRoute(
          builder: (context) => SendingData(),
        );
      case '/hero widget':
        return MaterialPageRoute(
          settings: const RouteSettings(name: '/hero widget'),
          //settings: RouteSettings(name: const MyHeroWidget().toString()),
          builder: (context) => const MyHeroWidget(),
        );
      case '/second hero':
        return MaterialPageRoute(
            settings: const RouteSettings(name: '/second hero'),
            builder: (_) => const SecondHero());
      case '/two button page':
        return MaterialPageRoute(builder: (context) => const TwoButtonPage());
      case '/page route transition':
        return MaterialPageRoute(
          builder: (context) => const PageRouteTransition(),
        );
      case '/search page':
        return MaterialPageRoute(
          builder: (context) => const SearchPage(),
        );
      case '/my route observer':
        return MaterialPageRoute(
          builder: (context) => const MyRouteObserver(),
        );
      case '/key navigation':
        return MaterialPageRoute(
          builder: (context) => const KeyNavigation(),
        );
      default:
        return errorScreen();
    }
  }

  static Route<dynamic> errorScreen() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Error Page"),
        ),
        body: const Center(
          child: Text("Some things went wrong"),
        ),
      );
    });
  }
}
