import 'package:flutter/material.dart';
import 'readingPageOne.dart';
import 'readingPageTwo.dart';
import 'readingPageThree.dart';
import 'readingPageFour.dart';


void main() => runApp(BambooHome());


class BambooHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bamboo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Bamboo'),
        ),
        body:
        BodyLayout(),
      ),
    );
  }
}

class BodyLayout extends StatelessWidget {
  BodyLayout();
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}

Widget _myListView(BuildContext context) {
  return ListView(
    children: ListTile.divideTiles(
      context: context,
      tiles: [
        ListTile(
          title: Text('Level 1'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LevelOne()),//changes page to reading page
            );
          },
        ),
        ListTile(
          title: Text('Level 2'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LevelTwo()),//changes page to reading page
            );
          },
        ),
        ListTile(
          title: Text('Level 3'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LevelThree()),//changes page to reading page
            );
          },
        ),
        ListTile(
          title: Text('Level 4'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LevelFour()),//changes page to reading page
            );
          },
        ),
      ],
    ).toList(),
  );
}
