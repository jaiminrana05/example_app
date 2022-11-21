import 'package:flutter/material.dart';

class PageRouteTransition extends StatelessWidget {
  const PageRouteTransition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: const Text('Page Route Transition'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    SlideRightRoute(
                      page: const MySecondPage(),
                    ),
                  );
                },
                child: const Text('SlideRightRoute')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    ScaleRoute(
                      page: const MySecondPage(),
                    ),
                  );
                },
                child: const Text('ScaleRoute')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    RotationRoute(
                      page: const MySecondPage(),
                    ),
                  );
                },
                child: const Text('RotationRoute')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    SizeRoute(
                      page: const MySecondPage(),
                    ),
                  );
                },
                child: const Text('SizeRoute')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    FadeRoute(
                      page: const MySecondPage(),
                    ),
                  );
                },
                child: const Text('FadeRoute')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    EnterExitRoute(
                      enterPage: const MySecondPage(),
                      exitPage: this,
                    ),
                  );
                },
                child: const Text('EnterExitRoute')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    ScaleRotateRoute(
                      page: const MySecondPage(),
                    ),
                  );
                },
                child: const Text('ScaleRotateRoute')),
          ],
        ),
      ),
    );
  }
}

class MySecondPage extends StatelessWidget {
  const MySecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Pop'),
        ),
      ),
    );
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  SlideRightRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          //transitionDuration: const Duration(seconds: 1),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1, 0),
              end: Offset.zero,
            ).animate(animation
                // CurvedAnimation(
                //   parent: animation,
                //   curve: Curves.elasticIn,
                // ),
                ),
            child: child,
          ),
        );
}

class ScaleRoute extends PageRouteBuilder {
  final Widget page;
  ScaleRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionDuration: const Duration(seconds: 1),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              ScaleTransition(
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            child: child,
          ),
        );
}

class RotationRoute extends PageRouteBuilder {
  final Widget page;
  RotationRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionDuration: const Duration(seconds: 1),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              RotationTransition(
            turns: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.linear,
              ),
            ),
            child: child,
          ),
        );
}

class SizeRoute extends PageRouteBuilder {
  final Widget page;
  SizeRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              Align(
            child: SizeTransition(
              sizeFactor: animation,
              child: child,
            ),
          ),
        );
}

class FadeRoute extends PageRouteBuilder {
  final Widget page;
  FadeRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}

class EnterExitRoute extends PageRouteBuilder {
  final Widget enterPage;
  final Widget exitPage;
  EnterExitRoute({required this.exitPage, required this.enterPage})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              enterPage,
          transitionDuration: const Duration(seconds: 3),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              Stack(
            children: <Widget>[
              SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.0, 0.0),
                  end: const Offset(-1.0, 0.0),
                ).animate(animation),
                child: exitPage,
              ),
              SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: const Offset(0.0, 0.0),
                ).animate(animation),
                child: enterPage,
              )
            ],
          ),
        );
}

class ScaleRotateRoute extends PageRouteBuilder {
  final Widget page;
  ScaleRotateRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionDuration: const Duration(seconds: 1),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              ScaleTransition(
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            child: RotationTransition(
              turns: Tween<double>(
                begin: 0.0,
                end: 1.0,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.linear,
                ),
              ),
              child: SizeTransition(
                sizeFactor: animation,
                child: child,
              ),
            ),
          ),
        );
}
