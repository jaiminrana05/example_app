import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final text1 = TextEditingController();
  final text2 = TextEditingController();
  final text3 = TextEditingController();
  final focus1 = FocusNode();

  List<Widget> item = [
    const Text(
      'hello',
      style: TextStyle(
        fontSize: 35.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    const Text(
      'hello',
      style: TextStyle(
        fontSize: 85.0,
        shadows: [
          Shadow(
            blurRadius: 5.0,
            color: Colors.red,
            offset: Offset(5.0, 5.0),
          ),
          Shadow(
            blurRadius: 5.0,
            color: Colors.orange,
            offset: Offset(-6.0, -6.0),
          ),
        ],
      ),
    ),
    const Text('hello'),
  ];
  List<String> monthOfTheYear = [
    'jan',
    'feb',
    'mar',
    'april',
    'may',
    'jun',
    'jul',
    'aug',
    'sep',
    'oct',
    'nov',
    'dec',
  ];
  FixedExtentScrollController fixedExtentScrollController =
      FixedExtentScrollController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(child: SizedBox(child: example1())),
    );
  }

  Padding example1() {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Column(
        //mainAxisSize: MainAxisSize.max,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 200,
            child: ListWheelScrollView(
              controller: fixedExtentScrollController,
              physics: const FixedExtentScrollPhysics(),
              children: monthOfTheYear.map((month) {
                return Card(
                    child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        month,
                        style: const TextStyle(fontSize: 18.0),
                      ),
                    )),
                  ],
                ));
              }).toList(),
              itemExtent: 60.0,
            ),
          ),
          // ListView(
          //   physics: const NeverScrollableScrollPhysics(),
          //   shrinkWrap: true,
          //   children: [
          //     ...item,
          //     ...List.generate(50, (index) => Text('$index hello2')),
          //     TextField(
          //       decoration: const InputDecoration(
          //         hintText: 'Enter here username',
          //         enabledBorder: OutlineInputBorder(
          //           borderSide: BorderSide(color: Colors.red, width: 5.0),
          //         ),
          //       ),
          //       controller: text1,
          //       //focusNode: focus1,
          //     ),
          //     TextField(
          //       decoration: const InputDecoration(
          //         hintText: 'Enter here password',
          //       ),
          //       controller: text2,
          //       // focusNode: focus1,
          //     ),
          //     TextField(
          //       decoration: const InputDecoration(
          //         hintText: 'Enter here password',
          //       ),
          //       controller: text3,
          //       // focusNode: focus1,
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
