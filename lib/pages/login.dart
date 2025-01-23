import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exercise_form_todolist/util/api.dart';
import 'package:flutter_exercise_form_todolist/util/dialog.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //创建控制器，用于获取表单内容
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();

  void _Login(context) async {
    if ((_formKey.currentState as FormState).validate()) {
      //验证通过，提交数据
      Loading loading = Loading(context: context);
      loading.showLoadingDialog();
      Response respones = await Api().login('15733586963', 'zhyl1234');
      loading.clearLoadingDialog();
      print(respones.data['msg']);
    } else {
      print('验证不通过');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Expanded(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10.0),
                width: double.infinity,
                height: 400.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/login.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Builder(builder: (builder) {
                        Runes runes = Runes('\u{1f600}');
                        return Text(String.fromCharCodes(runes));
                      }),
                      Text(
                        "欢 迎 登 录",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "Welcome To Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8, top: 18, bottom: 8),
                      child: TextFormField(
                        controller: _username,
                        decoration: InputDecoration(
                          labelText: "用户名",
                          hintText: "请输入用户名",
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1),
                          ),
                        ),
                        validator: (v) {
                          return v == null || v.trim().isNotEmpty
                              ? null
                              : '用户名不能为空';
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _password,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "密码",
                          hintText: "请输入密码",
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1),
                          ),
                        ),
                        validator: (v) {
                          return v == null || v.trim().isNotEmpty
                              ? null
                              : '密码不能为空';
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => _Login(context),
                        style: ButtonStyle(
                            padding:
                                WidgetStateProperty.all(EdgeInsets.all(15.0)),
                            backgroundColor: WidgetStateProperty.all(
                              Colors.blue[400],
                            ),
                            foregroundColor: WidgetStateProperty.all(
                              Colors.white,
                            ),
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            textStyle: WidgetStateProperty.all(TextStyle(
                              fontSize: 16,
                            ))),
                        child: Text("登录"),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
