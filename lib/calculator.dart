import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'qrdata.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  static const IconData qr_code_scanner_rounded =
      IconData(0xf00cc, fontFamily: 'MaterialIcons');

  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  //event handling and calculator logic
  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        equation = "0";
        result = "0";
        equationFontSize = 38.0;
        resultFontSize = 48.0;
      } else if (buttonText == "⌫") {
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (buttonText == "=") {
        equationFontSize = 38.0;
        resultFontSize = 48.0;
      } else if (buttonText == "QR") {
        if (result == "0") {
          QrData.amount = equation;
        } else {
          QrData.amount = result;
        }
        Navigator.pushNamed(context, '/qr', arguments: QrData.getQrData());
      } else if (buttonText == "LED") {
        }
       else if (buttonText == "LT") {
      } else if (buttonText == "AT") {
      } else if (buttonText == "BTN") {
      } else {
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
          if (buttonText != "+" &&
              buttonText != "-" &&
              buttonText != "÷" &&
              buttonText != "×") {
            expression = equation;
            expression = expression.replaceAll("×", '*');
            expression = expression.replaceAll("÷", '/');

            try {
              Parser p = Parser();
              Expression exp = p.parse(expression);
              ContextModel cm = ContextModel();
              result = '${exp.evaluate(EvaluationType.REAL, cm)}';
            } catch (e) {
              result = "Error";
            }
          }
        }
      }
    });
  }

//method to create button
  Widget buildButton(
      String buttonText, double buttonHeight, Color buttonColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      child: ElevatedButton(
          style: TextButton.styleFrom(
            backgroundColor: buttonColor,
            padding: const EdgeInsets.all(16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () => buttonPressed(buttonText),
          child: Text(
            buttonText,
            style:
                const TextStyle(fontSize: 30.0, fontWeight: FontWeight.normal),
          )),
    );
  }

  Widget buildButtonNum(String buttonText, double buttonHeight) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      child: ElevatedButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () => buttonPressed(buttonText),
          child: Text(
            buttonText,
            style:
                const TextStyle(fontSize: 30.0, fontWeight: FontWeight.normal),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // final style = theme.textTheme.displayMedium!.copyWith(
    //   color: theme.colorScheme.onPrimary,
    // );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primaryContainer,
        centerTitle: true,
        title: const Text("Payment Box"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              equation,
              style: TextStyle(
                  color: theme.colorScheme.primaryContainer,
                  fontSize: equationFontSize),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Text(
              result,
              style: TextStyle(
                  color: theme.colorScheme.primary, fontSize: resultFontSize),
            ),
          ),
          const Expanded(
            child: Divider(),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * .75,
                  child: Table(
                    children: [
                      TableRow(children: [
                        buildButtonNum("LT", 1),
                        buildButtonNum("LED", 1),
                        buildButtonNum("AT", 1),
                      ]),
                      TableRow(children: [
                        buildButtonNum("C", 1),
                        buildButtonNum("⌫", 1),
                        buildButtonNum("÷", 1),
                      ]),
                      TableRow(children: [
                        buildButtonNum("7", 1),
                        buildButtonNum("8", 1),
                        buildButtonNum("9", 1),
                      ]),
                      TableRow(children: [
                        buildButtonNum("4", 1),
                        buildButtonNum("5", 1),
                        buildButtonNum("6", 1),
                      ]),
                      TableRow(children: [
                        buildButtonNum("1", 1),
                        buildButtonNum("2", 1),
                        buildButtonNum("3", 1),
                      ]),
                      TableRow(children: [
                        buildButtonNum(".", 1),
                        buildButtonNum("0", 1),
                        buildButtonNum("00", 1),
                      ]),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Table(
                    children: [
                      TableRow(children: [
                        buildButtonNum("BTN", 1),
                      ]),
                      TableRow(children: [
                        buildButtonNum("×", 1),
                      ]),
                      TableRow(children: [
                        buildButtonNum("-", 1),
                      ]),
                      TableRow(children: [
                        buildButtonNum("+", 1),
                      ]),
                      TableRow(children: [
                        buildButtonNum("=", 1),
                      ]),
                      TableRow(children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.1 * 1,
                          color: Theme.of(context).colorScheme.primary,
                          child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.white,
                                padding: const EdgeInsets.all(16.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0.0),
                                    side: const BorderSide(
                                        color: Colors.white,
                                        width: 1,
                                        style: BorderStyle.solid)),
                              ),
                              onPressed: () => buttonPressed("QR"),
                              child: const Icon(
                                qr_code_scanner_rounded,
                                color: Colors.black,
                                size: 70.0,
                              )),
                        )
                      ]),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
