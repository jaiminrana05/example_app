import 'package:flutter/material.dart';

import '../basic_navigation.dart';
import 'route_aware.dart';

class MyRouteObserver extends StatefulWidget {
  const MyRouteObserver({Key? key}) : super(key: key);

  @override
  _MyRouteObserverState createState() => _MyRouteObserverState();
}

class _MyRouteObserverState extends State<MyRouteObserver> with RouteAware {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
//                    builder: (context) => const FirstRoutePage(),
                    builder: (context) => const RouteAwareWidget(
                      'first',
                      child: FirstRoutePage(),
                    ),
                  ),
                );
              },
              child: const Text('go to first'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('pop first'),
            ),
          ],
        ),
      ),
    );
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  // }
  //
  // @override
  // void dispose() {
  //   routeObserver.unsubscribe(this);
  //   super.dispose();
  // }
  //
  // @override
  // void didPush() {
  //   debugPrint('didPush FirstRoutePage');
  // }
  //
  // @override
  // void didPop() {
  //   debugPrint('didPop FirstRoutePage');
  // }
  //
  // @override
  // void didPopNext() {
  //   debugPrint('didPopNext FirstRoutePage');
  // }
}

class FirstRoutePage extends StatefulWidget {
  const FirstRoutePage({Key? key}) : super(key: key);

  @override
  _FirstRoutePageState createState() => _FirstRoutePageState();
}

class _FirstRoutePageState extends State<FirstRoutePage> with RouteAware {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RouteAwareWidget(
                      'second',
                      child: SecondRoutePage(),
                    ),
                  ),
                );
              },
              child: const Text('go to second'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('pop second'),
            ),
          ],
        ),
      ),
    );
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  // }
  //
  // @override
  // void dispose() {
  //   routeObserver.unsubscribe(this);
  //   super.dispose();
  // }
  //
  // @override
  // void didPush() {
  //   debugPrint('didPush SecondRoutePage');
  // }
  //
  // @override
  // void didPop() {
  //   debugPrint('didPop SecondRoutePage');
  // }
  //
  // @override
  // void didPopNext() {
  //   debugPrint('didPopNext SecondRoutePage');
  // }
}

class SecondRoutePage extends StatefulWidget {
  const SecondRoutePage({Key? key}) : super(key: key);

  @override
  _SecondRoutePageState createState() => _SecondRoutePageState();
}

class _SecondRoutePageState extends State<SecondRoutePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RouteAwareWidget(
                    'first',
                    child: FirstRoutePage(),
                  ),
                ),
              );
            },
            child: const Text('go to first'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RouteAwareWidget(
                    'basic',
                    child: BasicNavigation(),
                  ),
                ),
              );
            },
            child: const Text('go to basic navigation'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('pop last page'),
          ),
        ],
      ),
    );
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  // }
  //
  // @override
  // void dispose() {
  //   routeObserver.unsubscribe(this);
  //   super.dispose();
  // }
  //
  // @override
  // void didPush() {
  //   debugPrint('didPush Screen3');
  // }
  //
  // @override
  // void didPop() {
  //   debugPrint('didPop Screen3');
  // }
  //
  // @override
  // void didPopNext() {
  //   debugPrint('didPopNext Screen3');
  // }
}
