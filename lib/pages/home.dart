import 'package:flutter/material.dart';
import 'package:flutter_exercise_form_todolist/pages/home_content.dart';
import 'package:flutter_exercise_form_todolist/pages/mydraw.dart';
import 'package:flutter_exercise_form_todolist/pages/form.dart';
import 'package:flutter_exercise_form_todolist/pages/todo.dart';

class HomePage extends StatefulWidget {
  @override
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int routerIndex = 0;
  Widget buildWidget() {
    if (routerIndex == 0) {
      return HomeContent();
    } else {
      return routelist[routerIndex];
    }
  }

  static final List routelist = [
    // HomePage(),
    '',
    TodoList(),
    FormPage(),
  ];
  void changNav(val) {
    setState(() {
      routerIndex = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
        centerTitle: true,
        backgroundColor: Colors.blue[100],
      ),
      drawer: MyDraw(),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: routerIndex,
          onTap: changNav,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '首页',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_rounded),
              label: '我的日程',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '个人中心',
            ),
          ]),
      body: buildWidget(),
    );
  }
}
