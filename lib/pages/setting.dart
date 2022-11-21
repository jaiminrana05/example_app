import 'package:example_app/generated/l10n.dart';
import 'package:flutter/foundation.dart' show describeEnum;
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GeeksForGeeks"),
      ),
      body: const Example(),
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   mainAxisSize: MainAxisSize.min,
      //   children:   [
      //     Center(
      //       child: Container(
      //         clipBehavior: Clip.hardEdge,
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(20.0),
      //         ),
      //         child: Image.network(
      //           'https://images.unsplash.com/photo-1642670329500-cb98747dad0e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=400&q=60',
      //           width: 250,
      //           fit: BoxFit.fill,
      //         ),
      //       ),
      //     ),
      //     Text(
      //       Clip.hardEdge.myName,
      //     ),
      //
      //   ],
      // ),
    );
  }
}

extension CustomClip on Clip {
  String get myName {
    //debugPrint(name);
    debugPrint(describeEnum(this));
    return describeEnum(this);
  }
}

// extension on Widget {
//   ClipRRect hardEdge() {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(25.0),
//       clipBehavior: Clip.hardEdge,
//       child: this,
//     );
//   }
// }

class Example extends StatelessWidget {
  const Example({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Wrap(
        direction: Axis.vertical,
        alignment: WrapAlignment.start,
        // spacing:8.0,
        //runAlignment: WrapAlignment.end,
        runSpacing: 8.0,
        crossAxisAlignment: WrapCrossAlignment.center,
        textDirection: TextDirection.rtl,
        // verticalDirection: VerticalDirection.up,
        children: <Widget>[
          Text(Str.current.helloFlutter),
          Container(
              color: Colors.blue,
              width: 50,
              height: 50,
              child: const Center(
                  child: Text(
                "W1",
                textScaleFactor: 2.5,
              ))),
          Container(
              color: Colors.red,
              width: 50,
              height: 50,
              child: const Center(
                  child: Text(
                "W2",
                textScaleFactor: 2.5,
              ))),
          Container(
              color: Colors.teal,
              width: 50,
              height: 50,
              child: const Center(
                  child: Text(
                "W3",
                textScaleFactor: 2.5,
              ))),
          Container(
              color: Colors.indigo,
              width: 50,
              height: 50,
              child: const Center(
                  child: Text(
                "W4",
                textScaleFactor: 2.5,
              ))),
          Container(
            color: Colors.orange,
            width: 50,
            height: 50,
            child: const Center(
              child: Text(
                "W5",
                textScaleFactor: 2.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
