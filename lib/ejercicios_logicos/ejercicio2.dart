// ignore_for_file: avoid_print

class MyArray {
  // Expresion regular que valida si los parametros de entrada coinciden con la estructura de una expresion aritmetica coherente.
  String regex =
      r'^(\d+(\.\d+)?([-+*/]\d+(\.\d+)?)+|(\([^()]*\))|(\([^()]*\)[^()]*))|(((\d+(\.\d+)?)|(\([^()]*\)))([-+*/])((\d+(\.\d+)?)|(\([^()]*\))))+|(\(\d+(\.\d+)?([-+*/]\d+(\.\d+)?)+\))$';

  bool operation(String input) {
    String cleanedInput = input.replaceAll(' ', '');
    RegExp regExp = RegExp(regex);

    // Evaluar la paridad de parentesis.
    int leftParenCount = 0;
    int rightParenCount = 0;
    for (int i = 0; i < cleanedInput.length; i++) {
      if (cleanedInput[i] == '(') {
        leftParenCount++;
      } else if (cleanedInput[i] == ')') {
        rightParenCount++;
      }
    }

    // Devuelve true si el número de paréntesis izquierdo y derecho es igual y el String de entrada coincide con la expresión regular.
    return regExp.hasMatch(cleanedInput) && leftParenCount == rightParenCount;
  }

  dynamic compute(String input) {
    // Valida si el parametro de entrada es una expresion aritmetica valida o no, esta respuesta viene dada por la funcion operation().
    if (!operation(input)) {
      // Si la expresion no es válida arroja falso
      return 'false';
    }

    // Si la expresion es valida evalua la expresión matemática
    try {
      return evalExpression(input);
    } catch (e) {
      // Si exites un error al evaluar la expresión arroja falso
      return 'false';
    }
  }

  // Funcion que evalua la expresion aritmetica.
  dynamic evalExpression(String expression) {
    // Exprepsion regular para validar los parentesis.
    final parenRegex = RegExp(r'\(([^()]+)\)');
    // Exprepsion regular para validar los numeros.
    final numbers = RegExp(r'(\d+(\.\d+)?)');
    // Exprepsion regular para validar los operadores logicos.
    final operators = RegExp(r'[-+*/]');

    // Primero evalua los parentesis encontrados en la expresion.
    while (parenRegex.hasMatch(expression)) {
      expression = expression.replaceAllMapped(parenRegex, (match) {
        return evalExpression(match.group(1)!).toString();
      });
    }

    // Segundo: Evalua los numeros encontrados en la expresion.
    final matches = numbers
        .allMatches(expression)
        .map((m) => double.parse(m.group(0)!))
        .toList();
    final ops =
        operators.allMatches(expression).map((m) => m.group(0)!).toList();

    // Tercero: Realiza las operaciones de multiplicacion y division.
    for (int i = 0; i < ops.length; i++) {
      final num = matches[i + 1];
      final op = ops[i];

      if (op == '*' || op == '/') {
        double prevNum = matches[i];
        if (op == '*') {
          matches[i + 1] = prevNum * num;
        } else {
          matches[i + 1] = prevNum / num;
        }
        matches.removeAt(i);
        ops.removeAt(i);
        i--;
      }
    }

    // Cuarto: Realiza las operaciones de suma y resta.
    double result = matches[0];
    for (int i = 0; i < ops.length; i++) {
      final num = matches[i + 1];
      final op = ops[i];

      switch (op) {
        case '+':
          result += num;
          break;
        case '-':
          result -= num;
          break;
      }
    }
    return result;
  }
}

void main() {
  final MyArray s = MyArray();
  String a = "Hello world";
  String b = "2 + 10 / 2 - 20";
  String c = "(2 + 10 ) / 2 - 20";
  String d = "(2 +10 / 2 - 20";
  String e = "2+(3*4)-(5+6)/7";
  print('-------------------------');
  print(s.operation(a));
  print('-------------------------');
  print(s.operation(b));
  print('-------------------------');
  print(s.operation(c));
  print('-------------------------');
  print(s.operation(d));
  print('-------------------------');
  print(s.operation(e));
  print('///////////////////////////////');
  print(s.compute(a));
  print('-------------------------');
  print(s.compute(b));
  print('-------------------------');
  print(s.compute(c));
  print('-------------------------');
  print(s.compute(d));
  print('-------------------------');
  print(s.compute(e));
}
