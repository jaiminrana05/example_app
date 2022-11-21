import 'package:example_app/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../person_data.dart';

class BasicNavigation extends StatelessWidget {
  const BasicNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic navigation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) =>
                //         const SecondPage(data: 'Hi from first page'),
                //   ),
                // );
                Navigator.of(context).pushNamed('/second page',
                    arguments: "Hello from Route generator");
              },
              child: Text(Str.current.helloFlutter),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) =>
                //         const SecondPage(data: 'Hi from first page'),
                //   ),
                // );

                Navigator.pushNamed(
                  context,
                  '/person',
                  arguments: Person(name: 'james', age: 15),

                  // arguments: {
                  //   'name': 'james',
                  //   'age': 15,
                  // },

                  //arguments: ['james', 14],
                );
              },
              child: const Text("Person Data"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Cupertino page route',
                    arguments: 'hello Apple IOS');
              },
              child: const Text("Cupertino page route"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/returning data',
                );
              },
              child: const Text("Returning Data"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/sending data');
              },
              child: const Text("Sending Data"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/hero widget');
                // Navigator.of(context).push(
                //   MaterialPageRoute(builder: (_) => const MyHeroWidget()),
                // );
              },
              child: const Text("Hero widget"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MyHeroWidget2(),
                  ),
                );
              },
              child: const Text("Hero widget2"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/page route transition',
                );
              },
              child: const Text("page route transition"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/search page',
                );
              },
              child: const Text("List of wheel"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/my route observer',
                );
              },
              child: const Text("Route observer"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/key navigation',
                );
              },
              child: const Text("Key navigation"),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final String data;

  const SecondPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go to first page'),
            ),
            Text(
              data,
              style: const TextStyle(
                fontSize: 30.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyCupertinoPage extends StatelessWidget {
  final String data;

  const MyCupertinoPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go to first page'),
            ),
            Text(
              data,
              style: const TextStyle(
                fontSize: 30.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GotoSelectButtons extends StatelessWidget {
  const GotoSelectButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tap on button'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.pushNamed(
                  context,
                  '/two button page',
                );

                ScaffoldMessenger.of(context)
                  ..removeCurrentSnackBar()
                  ..showSnackBar(SnackBar(content: Text('$result')));
              },
              child: const Text('Tap to goto two button page'),
            ),
          ],
        ),
      ),
    );
  }
}

class TwoButtonPage extends StatelessWidget {
  const TwoButtonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select any one'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                // Close the screen and return "Yep!" as the result.
                Navigator.pop(context, 'Yep!');
              },
              child: const Text('Go to Yeh!!'),
            ),
            ElevatedButton(
              onPressed: () {
                // Close the screen and return "Nope." as the result.
                Navigator.pop(context, 'Nope.');
              },
              child: const Text('Go to nope'),
            ),
            ElevatedButton(
              onPressed: () {
                // Close the screen and return "Nope." as the result.
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: const Text('Go to Home'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHeroWidget extends StatelessWidget {
  const MyHeroWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/second hero');
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //       settings: const RouteSettings(name: '/'),
            //       builder: (_) => const SecondHero()),
            // );
          },
          onDoubleTap: () {
            Navigator.pop(context);
          },
          child: Hero(
            tag: 'imager',
            child: Image.network(
                'https://images.unsplash.com/photo-1568605117036-5fe5e7bab0b7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y2FyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
          ),
        ),
      ),
    );
  }
}

class SecondHero extends StatelessWidget {
  const SecondHero({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        onDoubleTap: () {
          Navigator.popUntil(
            context,
            ModalRoute.withName('/'),
            //Navigator.popUntil(context, (route) => false)
          );
        },
        child: Hero(
          tag: 'imager',
          child: Image.network(
            'https://images.unsplash.com/photo-1568605117036-5fe5e7bab0b7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y2FyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
            width: 150.0,
            height: 100.0,
          ),
        ),
      ),
    );
  }
}

class MyHeroWidget2 extends StatelessWidget {
  const MyHeroWidget2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SecondHero2(),
              ),
            );
          },
          onDoubleTap: () {
            Navigator.pop(context);
          },
          child: Hero(
            tag: 'imager',
            child: Image.network(
                'https://images.unsplash.com/photo-1568605117036-5fe5e7bab0b7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y2FyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
          ),
        ),
      ),
    );
  }
}

class SecondHero2 extends StatelessWidget {
  const SecondHero2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        onDoubleTap: () {
          Navigator.popUntil(
            context,
            ModalRoute.withName('/'),
          );
        },
        child: Hero(
          tag: 'imager',
          child: Image.network(
            'https://images.unsplash.com/photo-1568605117036-5fe5e7bab0b7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y2FyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
            width: 150.0,
            height: 100.0,
          ),
        ),
      ),
    );
  }
}
