import 'package:flutter/material.dart';
import 'readingPage.dart';
import 'Constants.dart';
import 'dart:math';

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
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: choiceAction,
              itemBuilder: (BuildContext context){
                return Constants.choices.map((String choice){
                  return PopupMenuItem<String>( //settings menu
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },//itemBuilder
            )
          ],
        ),
        body:
        BodyLayout(),
      ),
    );
  }
}

void choiceAction(String choice){
  print('Working');
}

class BodyLayout extends StatelessWidget {
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
            print('Level 2 Selected');
          },
        ),
        ListTile(
          title: Text('Level 3'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            print('Level 3 Selected');
          },
        ),
        ListTile(
          title: Text('Level 4'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            print('Level 4 Selected');
          },
        ),
        ListTile(
          title: Text('Level 5'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            print('Level 5 Selected');
          },
        ),
        ListTile(
          title: Text('Level 6'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            print('Level 6 Selected');
          },
        ),
        ListTile(
          title: Text('Level 7'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            print('Level 7 Selected');
          },
        ),
        ListTile(
          title: Text('Level 8'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            print('Level 8 Selected');
          },
        ),
      ],
    ).toList(),
  );
}
