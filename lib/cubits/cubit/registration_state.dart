part of 'registration_cubit.dart';

class RegistrationState extends Equatable {
  const RegistrationState({
    this.firstName = const FirstNameInput.pure(),
    this.lastName = const LastNameInput.pure(),
    this.phone = const PhoneInput.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
  });

  final FirstNameInput firstName;
  final LastNameInput lastName;
  final PhoneInput phone;
  final Email email;
  final Password password;
  final FormzStatus status;

  @override
  List<Object> get props => [firstName, lastName,email, phone,password, status];

  RegistrationState copyWith({
    FirstNameInput firstName,
    LastNameInput lastName,
    PhoneInput phone,
    Email email,
    Password password,
    FormzStatus status,
  }) {
    return RegistrationState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }
}
