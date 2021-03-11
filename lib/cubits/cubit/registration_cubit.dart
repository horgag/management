import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:partners_mobile_application/models/email.dart';
import 'package:partners_mobile_application/models/last_name.dart';
import 'package:partners_mobile_application/models/first_name.dart';
import 'package:partners_mobile_application/models/password.dart';
import 'package:partners_mobile_application/models/phone.dart';
import 'package:partners_mobile_application/repositories/manager_repository.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit(this._managerRepository)
      : assert(_managerRepository != null),
        super(const RegistrationState());

  final ManagerRepository _managerRepository;

  void firstNameChanged(String value) {
    final firstName = FirstNameInput.dirty(value: value);
    emit(state.copyWith(
      firstName: firstName,
      status: Formz.validate([
        firstName,
        state.lastName,
        state.phone,
        state.email,
        state.password,
      ]),
    ));
  }

  void lastNameChanged(String value) {
    final lastName = LastNameInput.dirty(value: value);
    emit(state.copyWith(
      lastName: lastName,
      status: Formz.validate([
        state.firstName,
        lastName,
        state.phone,
        state.email,
        state.password,
      ]),
    ));
  }

  void phoneChanged(String value) {
    final phone = PhoneInput.dirty(value: value);
    emit(state.copyWith(
      phone: phone,
      status: Formz.validate([
        state.firstName,
        state.lastName,
        state.phone,
        state.email,
        state.password,
      ]),
    ));
  }

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([
        state.firstName,
        state.lastName,
        state.phone,
        state.password,
      ]),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([state.firstName, state.lastName, state.phone,state.email, password]),
    ));
  }

  Future<void>  register() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _managerRepository.register(
        firstName: state.firstName.value,
        lastName: state.lastName.value,
        phone: state.phone.value,
        email: state.email.value,
        password: state.password.value,
      );
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on Exception {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
