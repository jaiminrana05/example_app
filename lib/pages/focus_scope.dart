import 'package:flutter/material.dart';

class MyFocus extends StatefulWidget {
  const MyFocus({Key? key}) : super(key: key);

  @override
  _MyFocusState createState() => _MyFocusState();
}

class _MyFocusState extends State<MyFocus> {
  FocusNode nodeOne = FocusNode();
  FocusNode nodeTwo = FocusNode();

  FocusNode nodeThree = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Focus Scope'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Name
            TextField(
              //textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              autofocus: true,
              focusNode: nodeOne,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
                hintText: 'Enter your name',
              ),
            ),
            //Email
            TextField(
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'john@doe.com',
              ),
              //textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              focusNode: nodeTwo,
            ),
            // password
            TextField(
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
              //textInputAction: TextInputAction.done,
              focusNode: nodeThree,
            ),
            // submit
            ElevatedButton(
              onPressed: () {
                FocusScope.of(context).requestFocus(nodeThree);
              },
              child: const Text("Next Field"),
            ),
          ],
        ),
      ),
    );
  }
}
