import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ManagerApiClient {
  static const baseUrl = 'http://eatandmore-env.eba-9bzi8ydy.eu-west-2.elasticbeanstalk.com';
  Dio dio;

  ManagerApiClient({@required this.dio}) : assert(dio != null);

  Future<String> signUp(
    String firstName,
    String lastName,
    String phone,
    String email,
    String password,
  ) async {
    final regUrl = '$baseUrl/api/user/register';
    dio.interceptors.add(PrettyDioLogger(requestHeader: true, requestBody: true, responseBody: true, responseHeader: true, error: true, compact: true, maxWidth: 90));
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers['Accept'] = 'application/json';
    final regResponse = await this.dio.post(
      regUrl,
      data: {
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "password": password,
        "phone": phone,
      },
    );
    if (regResponse.statusCode != 200) {
      throw Exception('error siging up');
    }
    final regJson = regResponse.data;

    return regJson.toString();
  }

  Future<String> login(String email, String password) async {
    final regUrl = '$baseUrl/api/user/mobile/login';
    dio.interceptors.add(PrettyDioLogger(requestHeader: true, requestBody: true, responseBody: true, responseHeader: true, error: true, compact: true, maxWidth: 90));
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers['Accept'] = 'application/json';
    final regResponse = await dio.post(
      regUrl,
      data: {"email": email, "password": password},
    );
    print(regResponse.data);
    if (regResponse.statusCode != 200) {
      throw Exception('error logging in');
    }
    final regJson = regResponse.data;
    return regJson;
  }
}
