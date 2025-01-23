import 'package:flutter/material.dart';

class MyDraw extends StatefulWidget {
  const MyDraw({super.key});

  @override
  State<MyDraw> createState() => _MyDrawState();
}

class _MyDrawState extends State<MyDraw> {
  List itemlist = [
    {
      'icon': Icons.home,
      'title': '功能1',
      'tap': (context) {
        Navigator.of(context).pop();
      },
    },
    {
      'icon': Icons.person,
      'title': '功能2',
      'tap': (context) {
        Navigator.of(context).pop();
      },
    },
    {
      'icon': Icons.settings,
      'title': '设置',
      'tap': (context) {
        Navigator.of(context).pop();
        Navigator.pushNamed(context, '/setting');
      },
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/banner.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(58.0),
                child: Column(
                  children: [
                    ClipOval(
                      child: Image.network(
                        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                        fit: BoxFit.cover,
                        width: 80,
                        height: 80,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Hello , Welcome',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(itemlist[index]['title']),
                    leading: Icon(itemlist[index]['icon']),
                    onTap: () => itemlist[index]['tap'](context),
                  );
                },
                itemCount: itemlist.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
