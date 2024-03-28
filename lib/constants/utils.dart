class Utils {
  Utils();

  static validateEmailForm({required String input, required resultMessage}) {
    final RegExp regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (!regExp.hasMatch(input)) {
      return resultMessage;
    } else {
      return null;
    }
  }
}
