extension ValidatorString on String? {
  bool get isEmail {
    if (this == null) return false;

    // Expresión regular para validar un correo electrónico
    String pattern = r'^[a-zA-Z0-9._]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
    RegExp regExp = RegExp(pattern);

    return regExp.hasMatch(this!);
  }
}
