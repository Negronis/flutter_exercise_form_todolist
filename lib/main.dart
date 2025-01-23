import 'package:flutter/material.dart';

import 'package:flutter_exercise_form_todolist/pages/home.dart';
import 'package:flutter_exercise_form_todolist/pages/inherit.dart';
import 'package:flutter_exercise_form_todolist/pages/login.dart';
import 'package:flutter_exercise_form_todolist/pages/setting.dart';
import 'package:flutter_exercise_form_todolist/util/store.dart';
import 'package:provider/provider.dart';

//修改main函数，挂载Provider
void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => StateData(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //app标题
      title: 'Flutter项目练习 - TodoList + From表单提交',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      // 使用动态路由
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (context) {
            var routeName = settings.name;
            if (context.watch<StateData>().token == '') {
              return Login();
            }
            switch (routeName) {
              case '/':
                return HomePage();
              case '/setting':
                return Setting();
              case '/inherit':
                return InheritTest();
              case '/login':
                return Login();
            }
            return HomePage();
          },
        );
      },
      //使用静态路由表
      // routes: {
      //   '/': (context) => HomePage(),
      //   '/setting': (context) => Setting(),
      //   "/inherit": (context) => InheritTest(),
      //   '/login': (context) => Login()
      // },
    );
  }
}
