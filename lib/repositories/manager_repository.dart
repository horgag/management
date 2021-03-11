import 'package:flutter/material.dart';
import 'package:partners_mobile_application/repositories/manager_api_client.dart';

class ManagerRepository {
  ManagerRepository({@required this.managerApiClient}) : assert(managerApiClient != null);
  final ManagerApiClient managerApiClient;

  Future<String> register({String firstName, String lastName, String email, String password, String phone}) async {
    final String userId = await managerApiClient.signUp(firstName, lastName,phone,email,password );
    return userId;
  }

  Future<String> logInWithEmailAndPassword({String email, String password}) async {
    final String userId = await managerApiClient.login(email, password);
    return userId;
  }
}
