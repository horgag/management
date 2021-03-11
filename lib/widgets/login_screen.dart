import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partners_mobile_application/cubits/cubit/registration_cubit.dart';
import 'package:partners_mobile_application/cubits/cubit/login_cubit.dart';
import 'package:formz/formz.dart';

import 'package:partners_mobile_application/widgets/log_in_form.dart';
import 'package:partners_mobile_application/widgets/order_screen.dart';
import 'package:partners_mobile_application/widgets/sign_in_form.dart';

class LoginPage extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => LoginPage());
  }

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController textEditingControllerFirstName;
  TextEditingController textEditingControllerLastName;
  TextEditingController textEditingControllerEmail;
  TextEditingController textEditingControllerPhone;
  TextEditingController textEditingControllerPassword;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocListener<RegistrationCubit, RegistrationState>(
            listener: (context, state) {
              if (state.status.isSubmissionSuccess) {
                Scaffold.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(content: Text('Registration Success!')),
                  );
                Future.delayed(const Duration(milliseconds: 500));

                Navigator.pop(context);
              }
              if (state.status.isSubmissionFailure) {
                print("ssssssssssss");
                Navigator.of(context).pop();
                Scaffold.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(content: Text('Registration Failure: Maybe all ready registered')),
                  ); 
              }
            },
            child: BlocListener<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state.status.isSubmissionSuccess) {
                  Scaffold.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      const SnackBar(content: Text('Login Success!')),
                    );
                  Future.delayed(const Duration(milliseconds: 500));

                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OrderScreen()));
                }
                if (state.status.isSubmissionSuccess) {
                  Scaffold.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      const SnackBar(content: Text('Login Failure')),
                    );
                }
              },
              child: Column(
                children: [
                  LoginForm(),
                ],
              ),
            ),
          )),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _settingModalBottomSheet(context);
          },
          child: Icon(Icons.app_registration)),
    );
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext bc) {
          return SignInForm();
        });
  }

  @override
  void initState() {
    textEditingControllerFirstName = TextEditingController();
    textEditingControllerLastName = TextEditingController();
    textEditingControllerEmail = TextEditingController();
    textEditingControllerPassword = TextEditingController();
    textEditingControllerPhone = TextEditingController();
    super.initState();
  }
}
