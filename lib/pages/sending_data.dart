import 'package:flutter/material.dart';

class SendingData extends StatelessWidget {
  SendingData({
    Key? key,
  }) : super(key: key);

  final todos = List.generate(
    20,
    (index) => Todo(
        title: 'Todo-$index',
        description: 'These is the description of Todos $index',
        index: index),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      body: ListView.builder(
          itemCount: todos.length,
          padding: const EdgeInsets.symmetric(vertical: 5),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: ListTile(
                leading: const Icon(
                  Icons.android,
                  color: Colors.green,
                ),
                trailing: const Icon(Icons.chevron_right),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(width: 2.0, color: Colors.black),
                ),
                minVerticalPadding: 5,
                horizontalTitleGap: 20,
                title: Hero(tag: index, child: Text(todos[index].title)),
                onTap: () {
                  Navigator.of(context)
                      .pushNamed('/detail', arguments: todos[index]);
                },
              ),
            );
          }),
    );
  }
}

class Todo {
  final String title;
  final String description;
  final int index;
  Todo({required this.title, required this.description, required this.index});
}

class Description extends StatelessWidget {
  final Todo todos;

  const Description({Key? key, required this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(tag: todos.index, child: Text(todos.title)),
      ),
      body: Text(
        todos.description,
        style: const TextStyle(
          height: 1.5,
          fontSize: 45,
          fontStyle: FontStyle.italic,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
