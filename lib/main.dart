import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partners_mobile_application/cubits/cubit/registration_cubit.dart';
import 'package:partners_mobile_application/cubits/cubit/login_cubit.dart';
import 'package:partners_mobile_application/manager_bloc_observer.dart';
import 'package:partners_mobile_application/repositories/manager_api_client.dart';
import 'package:partners_mobile_application/repositories/manager_repository.dart';
import 'package:http/http.dart' as http;
import 'package:partners_mobile_application/widgets/login_screen.dart';

void main() {
  Bloc.observer = RegisterBlocObserver();

  final ManagerRepository managerRepository = ManagerRepository(
    managerApiClient: ManagerApiClient(
      dio: Dio(),
    ),
  );


  runApp(App(managerRepository: managerRepository,));
}

class App extends StatelessWidget {
  final ManagerRepository managerRepository;

  App({Key key, @required this.managerRepository})
      : assert(managerRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegistrationCubit(managerRepository),
      child: BlocProvider(
        create: (_) => LoginCubit(managerRepository),
              child: MaterialApp(
          
          home: LoginPage(),
        ),
      ),
    );
  }
}
