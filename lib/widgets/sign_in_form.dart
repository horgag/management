import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:partners_mobile_application/cubits/cubit/registration_cubit.dart';

class SignInForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16.0),
            Text(
              "REGISTRATION",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            _FirstNameInput(),
            const SizedBox(height: 16.0),
            _LastNameInput(),
            const SizedBox(height: 16.0),
            _PhoneInput(),
            const SizedBox(height: 16.0),
            _EmailInput(),
            const SizedBox(height: 8.0),
            _PasswordInput(),
            const SizedBox(height: 8.0),
            _RegistrationButton(),
            SizedBox(
              height: 200,
            )
          ],
        ),
      ),
    );
  }
}

class _FirstNameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationCubit, RegistrationState>(
      buildWhen: (previous, current) => previous.firstName != current.firstName,
      builder: (context, state) {
        return TextField(
          onChanged: (firstName) => context.read<RegistrationCubit>().firstNameChanged(firstName),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'First name',
            helperText: '',
            errorText: state.email.invalid ? 'invalid name' : null,
          ),
        );
      },
    );
  }
}

class _LastNameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationCubit, RegistrationState>(
      buildWhen: (previous, current) => previous.firstName != current.firstName,
      builder: (context, state) {
        return TextField(
          onChanged: (lastName) => context.read<RegistrationCubit>().lastNameChanged(lastName),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Last name',
            helperText: '',
            errorText: state.email.invalid ? 'invalid name' : null,
          ),
        );
      },
    );
  }
}

class _PhoneInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationCubit, RegistrationState>(
      buildWhen: (previous, current) => previous.firstName != current.firstName,
      builder: (context, state) {
        return TextField(
          onChanged: (phone) => context.read<RegistrationCubit>().phoneChanged(phone),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Phone',
            helperText: '',
            errorText: state.email.invalid ? 'invalid number' : null,
          ),
        );
      },
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationCubit, RegistrationState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          onChanged: (email) => context.read<RegistrationCubit>().emailChanged(email),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'email',
            helperText: '',
            errorText: state.email.invalid ? 'invalid email' : null,
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationCubit, RegistrationState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          onChanged: (password) => context.read<RegistrationCubit>().passwordChanged(password),
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'password',
            helperText: '',
            errorText: state.password.invalid ? 'invalid password' : null,
          ),
        );
      },
    );
  }
}

class _RegistrationButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationCubit, RegistrationState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : RaisedButton(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text('REGISTER',style: TextStyle(fontSize: 24),),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                color: const Color(0xFFFFD600),
                onPressed: state.status.isValidated ? () => context.read<RegistrationCubit>().register() : null,
              );
      },
    );
  }
}
