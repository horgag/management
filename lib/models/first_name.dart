import 'package:formz/formz.dart';

// Define input validation errors
enum FirstNameInputError { empty }

// Extend FormzInput and provide the input type and error type.
class FirstNameInput extends FormzInput<String, FirstNameInputError> {
  // Call super.pure to represent an unmodified form input.
  const FirstNameInput.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const FirstNameInput.dirty({String value = ''}) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  FirstNameInputError validator(String value) {
    return value?.isNotEmpty == true ? null : FirstNameInputError.empty;
  }
}


