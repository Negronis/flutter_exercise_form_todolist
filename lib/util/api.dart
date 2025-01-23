import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';

class Api {
  Future login(String account, String password) async {
    var dio = Dio();
    final formData = FormData.fromMap({
      'account': account,
      'password': password,
      'openid': "",
    });
    var response = await dio.post(
      'https://ccc.hebzhhd.com/api/user/login',
      data: formData,
    );
    return response;
  }
}
