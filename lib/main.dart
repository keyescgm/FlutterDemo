import 'package:flutterdemo1/model/choiceData.dart';
import 'package:flutter/material.dart';

const List<ChoiceData> choicesList = <ChoiceData>[
  ChoiceData(title: 'LOL', type: 'LOL'),
  ChoiceData(title: '王者荣耀', type: 'wzry'),
  ChoiceData(title: '和平精英', type: 'hpjy'),
  ChoiceData(title: '绝地求生', type: 'jdqs'),
  ChoiceData(title: 'APEX英雄', type: 'APEX'),
  ChoiceData(title: 'DNF', type: 'DNF'),
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color.fromRGBO(242, 148, 55, 1)
      ),
      home: DefaultTabController(
          length: choicesList.length,
          child: Scaffold(
            backgroundColor: Color.fromARGB(225, 240, 240, 240),
            appBar: TabBar(
              isScrollable: true,
              indicatorColor: Color.fromARGB(255, 237, 128, 61),
              labelPadding: EdgeInsets.only(
                  top: 20,
                  bottom: 0,
                  right: 5,
                  left: 5
              ),
              tabs: choicesList.map<Widget>((ChoiceData choiceData) {
                return Tab(
                    child: Text(
                        choiceData.title, style: TextStyle(fontSize: 16)));
              }).toList(),
            ),
            body: TabBarView(
              children: choicesList.map<Widget>((ChoiceData choiceData) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: new Container(
                    key: new PageStorageKey(choiceData.type),
                    child: null,
                  ),
                );
              }).toList(),
            ),
          )
      ),
    );
  }

}
void main() => runApp(new MyApp());

