import 'package:flutter/material.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView"),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const HeaderWidget("Header 1"),
                const HeaderWidget("Header 2"),
                const HeaderWidget("Header 3"),
                const HeaderWidget("Header 4"),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const BodyWidget(Colors.blue),
                const BodyWidget(Colors.red),
                const BodyWidget(Colors.green),
                const BodyWidget(Colors.orange),
                const BodyWidget(Colors.blue),
                const BodyWidget(Colors.red),
              ],
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            delegate: SliverChildListDelegate(
              [
                const BodyWidget(Colors.blue),
                const BodyWidget(Colors.green),
                const BodyWidget(Colors.yellow),
                const BodyWidget(Colors.orange),
                const BodyWidget(Colors.blue),
                const BodyWidget(Colors.red),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  final String text;

  const HeaderWidget(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Text(text),
      color: Colors.grey[200],
    );
  }
}

class BodyWidget extends StatelessWidget {
  final Color color;

  const BodyWidget(this.color, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      color: color,
      alignment: Alignment.center,
    );
  }
}
