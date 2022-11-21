import 'package:example_app/person_data.dart';
import 'package:flutter/material.dart';

class GetPerson extends StatelessWidget {
  const GetPerson({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as Person;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Person Data'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(arguments.name),
            Text(arguments.age.toString()),

            ///map
            // Text(arguments['name']),
            // Text(arguments['age'].toString()),

            /// list
            // Text(arguments[0]),
            // Text(arguments[1].toString()),
          ],
        ),
      ),
    );
  }
}
