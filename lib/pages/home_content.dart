import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_exercise_form_todolist/util/store.dart';
import 'package:provider/provider.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  var _time = "";
  Timer _timer = Timer.periodic(Duration(seconds: 1), (timer) {});
  void _updateTime() {
    if (mounted) {
      setState(() {
        _time = DateTime.now().toString().replaceAll(RegExp(r'\.\d+'), "");
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _updateTime();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _updateTime();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [Text(_time), Text('${context.watch<StateData>().userName}')],
      )),
    );
  }
}
