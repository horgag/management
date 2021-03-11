import 'package:formz/formz.dart';

// Define input validation errors
enum LastNameInputError { empty }

// Extend FormzInput and provide the input type and error type.
class LastNameInput extends FormzInput<String, LastNameInputError> {
  // Call super.pure to represent an unmodified form input.
  const LastNameInput.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const LastNameInput.dirty({String value = ''}) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  LastNameInputError validator(String value) {
    return value?.isNotEmpty == true ? null : LastNameInputError.empty;
  }
}


