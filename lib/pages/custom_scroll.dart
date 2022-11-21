import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';

Future main() async => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Material(
            color: Colors.black38,
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 400.0,
                  maxHeight: constraints.maxHeight,
                ),
                child: ListView.builder(
                  physics: CustomScrollPhysics(),
                  itemExtent: 150.0,
                  itemBuilder: (BuildContext context, int index) => Container(
                    padding: const EdgeInsets.symmetric(vertical: 9.0),
                    child: Material(
                      elevation: 4.0,
                      borderRadius: BorderRadius.circular(5.0),
                      color: index % 2 == 0 ? Colors.cyan : Colors.deepOrange,
                      child: Center(
                        child: Text(index.toString()),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CustomSimulation extends Simulation {
  double initPosition;
  double velocity;

  CustomSimulation({this.initPosition = 0.0, this.velocity = 0.0});

  @override
  double x(double time) {
    var max =
        math.max(math.min(initPosition, 0.0), initPosition + velocity * time);

    //print(max.toString());

    return max;
  }

  @override
  double dx(double time) {
    // print(velocity.toString());
    return velocity;
  }

  @override
  bool isDone(double time) {
    return false;
  }
}

class CustomScrollPhysics extends ScrollPhysics {
  @override
  ScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return CustomScrollPhysics();
  }

  @override
  Simulation createBallisticSimulation(
      ScrollMetrics position, double velocity) {
    return CustomSimulation(
      initPosition: position.pixels,
      velocity: velocity,
    );
  }
}
