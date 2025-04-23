class RegexValidator {
  RegexValidator._();

  static final email = RegExp(
      r'^[a-zA-Z0-9]+([._-][a-zA-Z0-9]+)*@[a-zA-Z0-9]+([.-][a-zA-Z0-9]+)*\.[a-zA-Z]{2,}$');
  static final password = RegExp(r"^(?=.*[a-zA-Z])(?=.*\d)(?=.*[\W_]).+$");

  /// First Name
  /// - Ilk harf büyük
  static final firstName = RegExp(r"^[A-Z][a-z]*$");

  /// Last Name
  /// - Ilk harf büyük
  static final lastName = RegExp(r"^[A-Z][a-z]*$");

  /// Phone Number
  /// - ilk baslangicda +994 olmalidir
  /// example [ +994 50 123 45 67 ]
  static final phoneNumber =
      RegExp(r"^\+994\d{9}$");

  static final doubleNumber = RegExp(r'^[0-9]*\.?[0-9]*$');
}
