import 'package:cleanarcjh/src/core/util/regex_validator.dart';


extension StringValidatorExtension on String {
  bool get isEmailValid => RegexValidator.email.hasMatch(this);
  bool get isPasswordValid => RegexValidator.password.hasMatch(this);
  bool get isPhoneNumberValid => RegexValidator.phoneNumber.hasMatch(this);
  bool get isNameValid => RegexValidator.firstName.hasMatch(this);
  bool get isLastNameValid => RegexValidator.lastName.hasMatch(this);
}
