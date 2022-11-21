import 'package:flutter/material.dart';

import 'focus_scope.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isTrue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            onChanged: (value) {},
            decoration: InputDecoration(
              hintText: isTrue ? 'hello' : 'hello world',
            ),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                isTrue = !isTrue;
              });
            },
            child: const Text('click me'),
          ),
          InkWell(
            onTap: () {},
            child: const Text('Ink well'),
          ),
          const SizedBox(
            height: 50.0,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyFocus()),
              );
            },
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: const Text(
                'gesture detector',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.deepOrange,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
