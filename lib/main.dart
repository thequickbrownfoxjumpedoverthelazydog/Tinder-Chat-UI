import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:tennis_matchup_project/dms.dart';
import 'package:tennis_matchup_project/feed.dart';
import 'package:tennis_matchup_project/profile.dart';

void main() {
  runApp(MyApp());
}

List data = [
    {
      'name': 'Kenneth',
      'skill-level': 'Beginner', 
      'description': 'Loves Video Games'
    },
    {
      'name': 'Ricky',
      'skill-level': 'Intermediate', 
      'description': 'Loves hanging out with friends'
    },
    {
      'name': 'Bob',
      'skill-level': 'Advanced', 
      'description': 'Likes Baseball'
    },
    {
      'name': 'Joe',
      'skill-level': 'Intermediate', 
      'description': 'Loves playing chess!'
    },
    {
      'name': 'Jane',
      'skill-level': 'Beginner', 
      'description': 'Likes Basketball'
    },
  ];
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  int _currentIndex = 0; 
  List tabs = [
    MainFeed(),
    Profile(),
    ChatPage(),
  ];
  
  void onTappedBar(int index){
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Feed",
            backgroundColor: Colors.blue,  
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
            backgroundColor: Colors.blue,  
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages', 
            backgroundColor: Colors.blue,
          ),
        ],
        onTap: onTappedBar,
      ),
    );
  }
} 