import 'package:flutter_neumorphic/flutter_neumorphic.dart';

Color _calcTextColor = const Color(0xFF484848);

// ignore: must_be_immutable
class CalculatorButton extends StatelessWidget {
  final String text;
  final bool textAccent = false;
  bool textVariant = false;
  bool backgroundAccent = false;
  final Function callback;
  CalculatorButton(
    this.backgroundAccent, {
    Key? key,
    required this.text,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _textColor(BuildContext context) {
      if (backgroundAccent) {
        return Colors.white;
      } else if (textAccent) {
        return NeumorphicTheme.accentColor(context);
      } else if (textVariant) {
        return NeumorphicTheme.variantColor(context);
      } else {
        return _calcTextColor;
      }
    }

    Color? _backgroundColor(BuildContext context) {
      return backgroundAccent ? NeumorphicTheme.accentColor(context) : null;
    }

    return Container(
      width: 75,
      height: 80,
      padding: const EdgeInsets.only(top: 10),
      child: NeumorphicButton(
        onPressed: () {
          callback(text);
        },
        style: NeumorphicStyle(
          surfaceIntensity: 0.1,
          depth: 5,
          intensity: 5,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(5)),
          shape: NeumorphicShape.convex,
          color: _backgroundColor(context),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
              color: _textColor(context),
            ),
          ),
        ),
      ),
    );
  }
}
