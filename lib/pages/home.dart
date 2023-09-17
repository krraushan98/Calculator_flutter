import 'dart:math';

import 'package:calculator/util/calculation.dart';
import 'package:flutter/material.dart';
import 'package:calculator/util/my_button.dart';
import 'package:calculator/util/stack.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void btnOnClick(String btnVal) {
    calculation(btnVal);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(title: const Text('Calculator',),
      // centerTitle: true,
      // backgroundColor: Colors.grey,
      // ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              alignment: Alignment.bottomRight,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 88, 92, 105),
                border: Border.all(
                  color: Colors.black, // Border color
                  width: 2.0, // Border width
                ),
                borderRadius: BorderRadius.circular(25.0), // Border radius
              ),
              child: Text(
                '$text ',
                style: const TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyButton(
                  onPressed: () {
                    btnOnClick("AC");
                  },
                  text: "AC",
                  color: Colors.green),
              MyButton(
                  onPressed: () {
                    btnOnClick("+/-");
                  },
                  text: "±",
                  color: Colors.blue),
              MyButton(
                  onPressed: () {
                    btnOnClick("%");
                  },
                  text: "%",
                  color: Colors.blue),
              // MyButton(onPressed: () {}, text: "cancel"),
              MaterialButton(
                onPressed: () {
                  btnOnClick("<");
                },
                color: Colors.red,
                minWidth: 80.0,
                height: 75,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: const Icon(Icons.backspace_outlined),
              ),
            ],
          ),
          const SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyButton(
                  onPressed: () {
                    btnOnClick("7");
                  },
                  text: "7",
                  color: const Color.fromARGB(255, 90, 88, 88)),
              MyButton(
                  onPressed: () {
                    btnOnClick("8");
                  },
                  text: "8",
                  color: const Color.fromARGB(255, 90, 88, 88)),
              MyButton(
                  onPressed: () {
                    btnOnClick("9");
                  },
                  text: "9",
                  color: const Color.fromARGB(255, 90, 88, 88)),
              MyButton(
                  onPressed: () {
                    btnOnClick("/");
                  },
                  text: "÷",
                  color: Colors.blue),
            ],
          ),
          const SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyButton(
                  onPressed: () {
                    btnOnClick("4");
                  },
                  text: "4",
                  color: const Color.fromARGB(255, 90, 88, 88)),
              MyButton(
                  onPressed: () {
                    btnOnClick("5");
                  },
                  text: "5",
                  color: const Color.fromARGB(255, 90, 88, 88)),
              MyButton(
                  onPressed: () {
                    btnOnClick("6");
                  },
                  text: "6",
                  color: const Color.fromARGB(255, 90, 88, 88)),
              MyButton(
                  onPressed: () {
                    btnOnClick("x");
                  },
                  text: "x",
                  color: Colors.blue),
            ],
          ),
          const SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyButton(
                  onPressed: () {
                    btnOnClick("1");
                  },
                  text: "1",
                  color: const Color.fromARGB(255, 90, 88, 88)),
              MyButton(
                  onPressed: () {
                    btnOnClick("2");
                  },
                  text: "2",
                  color: const Color.fromARGB(255, 90, 88, 88)),
              MyButton(
                  onPressed: () {
                    btnOnClick("3");
                  },
                  text: "3",
                  color: const Color.fromARGB(255, 90, 88, 88)),
              MyButton(
                  onPressed: () {
                    btnOnClick("-");
                  },
                  text: "-",
                  color: Colors.blue),
            ],
          ),
          const SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyButton(
                  onPressed: () {
                    btnOnClick("0");
                  },
                  text: "0",
                  color: const Color.fromARGB(255, 90, 88, 88)),
              MyButton(
                  onPressed: () {
                    btnOnClick(".");
                  },
                  text: ".",
                  color: const Color.fromARGB(255, 90, 88, 88)),
              MyButton(
                  onPressed: () {
                    btnOnClick("=");
                  },
                  text: "=",
                  color: Color.fromARGB(255, 21, 70, 185)),
              MyButton(
                  onPressed: () {
                    btnOnClick("+");
                  },
                  text: "+",
                  color: Colors.blue),
            ],
          ),
          const SizedBox(
            height: 15.0,
          ),
        ],
      ),
    );
  }

  dynamic text = '';
  double numOne = 0;
  double numTwo = 0;
  String result = '';
  void calculation(btnText) {
    if (btnText == "<") {
      if (result.isNotEmpty) {
        result = result.substring(0, result.length - 1);
      }
    } else if (btnText == "+/-") {
      result.startsWith('-')
          ? result = result.substring(1)
          : result = '-' + result;
    } else if (btnText == "AC") {
      result = '';
      numOne = 0;
      numTwo = 0;
    } else if (btnText == "=") {
      //result = evaluateExpression(result).toString();
      List<String> num = result.split(RegExp(r'(?<=[-+x/%])|(?=[-+x/%])'));
      if (num.length > 3) {
        result = "Support only 2 number";
        // return;
      } else {
        try {
          String operator = num[1];
          print(operator);
          numOne = double.parse(num[0]);
          numTwo = double.parse(num[2]);
          if (operator == "+") {
            result = (numOne + numTwo).toString();
          } else if (operator == "-") {
            result = (numOne - numTwo).toString();
          } else if (operator == "x") {
            result = (numOne * numTwo).toString();
          } else if (operator == "/") {
            result = (numOne / numTwo).toString();
          }
          else if (operator == "%") {
            result = ((numOne / numTwo)*100).toString();
          }
        } catch (e) {
          result = "Error";
        }
      }
    } else {
      result = result + btnText;
    }
    setState(() {
      text = result;
    });
  }

  // dynamic evaluateExpression(String expression) {
  //   // Split the expression into tokens.
  //   List<String> tokens =
  //       expression.split(RegExp(r'(?=[-+x/()])|(?<=[-+x/()])'));

  //   // Create a stack to store the operators and operands.
  //   Stack_dart<String> operators = Stack_dart<String>();
  //   Stack_dart<double> operands = Stack_dart<double>();

  //   // Evaluate the expression from left to right.
  //   for (String token in tokens) {
  //     if (isOperator(token)) {
  //       operators.push(token);
  //     } else {
  //       double operand = double.parse(token);
  //       while (operators.isNotEmpty &&
  //           hasHigherPrecedence(operators.peak(), token)) {
  //         String operator = operators.pop();
  //         if (operands.isEmpty) {
  //           // Handle invalid expression.
  //           return null;
  //         }
  //         double operand2 = operands.pop();
  //         double operand1 = operands.pop();
  //         double result = evaluate(operand1, operator, operand2);
  //         operands.push(result);
  //       }
  //       operands.push(operand);
  //     }
  //   }

  //   // Evaluate any remaining operators.
  //   while (operators.isNotEmpty) {
  //     if (operands.isEmpty) {
  //       // Handle invalid expression.
  //       return null;
  //     }
  //     String operator = operators.pop();
  //     double operand2 = operands.pop();
  //     double operand1 = operands.pop();
  //     double result = evaluate(operand1, operator, operand2);
  //     operands.push(result);
  //   }

  //   return operands.pop();
  // }

  // bool isOperator(String token) {
  //   return token == "+" ||
  //       token == "-" ||
  //       token == "*" ||
  //       token == "/" ||
  //       token == "^";
  // }

  // bool hasHigherPrecedence(String operator1, String operator2) {
  //   if (operator1 == "^") {
  //     return true;
  //   } else if (operator2 == "^") {
  //     return false;
  //   } else if (operator1 == "*" || operator1 == "/") {
  //     return true;
  //   } else if (operator2 == "*" || operator2 == "/") {
  //     return false;
  //   } else {
  //     return false;
  //   }
  // }

  // double evaluate(double operand1, String operator, double operand2) {
  //   switch (operator) {
  //     case "+":
  //       return operand1 + operand2;
  //     case "-":
  //       return operand1 - operand2;
  //     case "*":
  //       return operand1 * operand2;
  //     case "/":
  //       return operand1 / operand2;
  //     default:
  //       return 0.0;
  //   }
  // }
}
