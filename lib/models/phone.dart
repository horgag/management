import 'package:formz/formz.dart';

// Define input validation errors
enum PhoneInputError { empty }

// Extend FormzInput and provide the input type and error type.
class PhoneInput extends FormzInput<String, PhoneInputError> {
  // Call super.pure to represent an unmodified form input.
  const PhoneInput.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const PhoneInput.dirty({String value = ''}) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  PhoneInputError validator(String value) {
    return value?.isNotEmpty == true ? null : PhoneInputError.empty;
  }
}


