import 'package:calculator/cal_button.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  // ignore: unused_field
  String _history = '';
  String _expression = '';
  final Color _calcTextColor = const Color(0xFF484848);

  void numberClick(String text) {
    setState(() {
      _expression += text;
    });
  }

  void allClear(String text) {
    setState(() {
      _expression = '';
      _history = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void callBack(String text) {
    setState(() {
      _expression = text;
    });
  }

  void evalute(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    setState(() {
      _history = _expression;
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Widget _header() {
    //   return Padding(
    //     padding: const EdgeInsets.only(top: 30),
    //     child: Neumorphic(
    //       style: NeumorphicStyle(
    //         depth: -1,
    //         // intensity: 20,
    //         shape: NeumorphicShape.convex,
    //         boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
    //       ),
    //       child: SizedBox(
    //         width: 300,
    //         height: 50,
    //         child: Padding(
    //             padding: const EdgeInsets.only(top: 5, left: 10, right: 0),
    //             child: Text(
    //               '',
    //               style: TextStyle(
    //                 color: Colors.black.withOpacity(0.5),
    //                 fontSize: 30,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //               textAlign: TextAlign.center,
    //             )),
    //       ),
    //     ),
    //   );
    // }

    Widget _buttonColumn() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButton(true, text: "AC", callback: allClear),
              CalculatorButton(true, text: "C", callback: clear),
              CalculatorButton(true, text: "%", callback: numberClick),
              CalculatorButton(true, text: "/", callback: numberClick)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButton(false, text: "7", callback: numberClick),
              CalculatorButton(false, text: "8", callback: numberClick),
              CalculatorButton(false, text: "9", callback: numberClick),
              CalculatorButton(true, text: "*", callback: numberClick),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButton(false, text: "4", callback: numberClick),
              CalculatorButton(false, text: "5", callback: numberClick),
              CalculatorButton(false, text: "6", callback: numberClick),
              CalculatorButton(true, text: "-", callback: numberClick),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButton(false, text: "1", callback: numberClick),
              CalculatorButton(false, text: "2", callback: numberClick),
              CalculatorButton(false, text: "3", callback: numberClick),
              CalculatorButton(true, text: "+", callback: numberClick),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButton(false, text: ".", callback: numberClick),
              CalculatorButton(false, text: "0", callback: numberClick),
              CalculatorButton(false, text: "00", callback: numberClick),
              CalculatorButton(
                true,
                text: "=",
                callback: evalute,
              ),
            ],
          ),
        ],
      );
    }

    Widget _topScreen() {
      return Neumorphic(
        style: NeumorphicStyle(
          depth: -5,
          intensity: 30,
          surfaceIntensity: 30,
          boxShape: NeumorphicBoxShape.roundRect(
            BorderRadius.circular(10),
          ),
        ),
        child: FractionallySizedBox(
          widthFactor: 1,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  _expression,
                  style: TextStyle(
                    fontSize: 45,
                    color: _calcTextColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return NeumorphicBackground(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Align(
            alignment: Alignment.topLeft,
            // child: _header(),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 60, left: 10, right: 10),
              child: _topScreen(),
            ),
          ),
          Expanded(
            flex: 3,
            child: _buttonColumn(),
          ),
        ],
      ),
    );
  }
}

// class _TopScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Neumorphic(
//       style: NeumorphicStyle(
//         depth: 2,
//         boxShape: NeumorphicBoxShape.roundRect(
//           BorderRadius.circular(20),
//         ),
//       ),
//       child: FractionallySizedBox(
//         widthFactor: 1,
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             children: const [Text(_)],
//           ),
//         ),
//       ),
//     );
//   }
// }
