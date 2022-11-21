import 'package:flutter/material.dart';

import '../main.dart';

class KeyNavigation extends StatelessWidget {
  const KeyNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation using Keys'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                navigatorKey.currentState?.push(
                  MaterialPageRoute(
                    builder: (context) => const Key1(),
                  ),
                );
              },
              child: const Text('Go to Key1'),
            ),
            ElevatedButton(
              onPressed: () {
                navigatorKey.currentState?.pop(context);
              },
              child: const Text('Go back to basic navigation'),
            ),
          ],
        ),
      ),
    );
  }
}

class Key1 extends StatelessWidget {
  const Key1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Key 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                navigatorKey.currentState?.pop(context);
              },
              child: const Text(' Go back to Navigation using Keys'),
            ),
            ElevatedButton(
              onPressed: () {
                navigatorKey.currentState?.popUntil((route) => route.isFirst);
              },
              child: const Text(' Go back to Navigation basic'),
            ),
          ],
        ),
      ),
    );
  }
}
