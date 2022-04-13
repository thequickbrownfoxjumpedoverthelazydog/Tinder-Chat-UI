import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

List data = [
    {
      'name': 'Kenneth',
      'skill-level': 'Beginner', 
      'description': 'Loves Tennis',
      'photo' : 'assets/images/MyPhoto.PNG',
    },
    {
      'name': 'Ricky',
      'skill-level': 'Intermediate', 
      'description': 'Loves Tennis',
      'photo':'assets/images/Anaconda Prompt Pic.PNG',
      
    },
    {
      'name': 'Bob',
      'skill-level': 'Advanced', 
      'description': 'Likes Tennis',
      'photo' : 'assets/images/Command Prompt Picture.PNG'
    },
    {
      'name': 'Joe',
      'skill-level': 'Intermediate', 
      'description': 'Loves Tennis',
      'photo' : 'assets/images/VSCode Prompt Pic.PNG',
    },
    {
      'name': 'Jane',
      'skill-level': 'Beginner', 
      'description': 'Likes Tennis',
      'photo' : 'assets/images/WIN_20210823_22_58_58_Pro.jpg',
    },
  ];


class MainFeed extends StatefulWidget {

  @override
  _MainFeedState createState() => _MainFeedState();
}

class _MainFeedState extends State<MainFeed> {
  @override
  void initState() {
    super.initState();
    data.shuffle();
  }
  createDialog(BuildContext context, String name, String description, String level) {
    return showDialog(context: context, builder: (context){
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Column(
                  children: [
                  Text(name),
                  SizedBox(height: 25.0),
                  Text(level), 
                  SizedBox(height: 25.0),
                  Text(description), 
                  SizedBox(height: 25.0),
                  FlatButton.icon(onPressed: (){}, icon: Icon(Icons.message), label: Text('Reach out to $name!')),
                  ],
                ), 
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Feed'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height*0.6,
          child: TinderSwapCard(
            orientation: AmassOrientation.TOP,
            totalNum: data.length,
            stackNum: 2,
            maxWidth: MediaQuery.of(context).size.width * 0.9,
            maxHeight: MediaQuery.of(context).size.width * 0.9,
            minWidth: MediaQuery.of(context).size.width*0.8,
            minHeight: MediaQuery.of(context).size.width * 0.8,
            cardBuilder: (context, index) {
              return InkWell(
                              onTap: (){createDialog(context, data[index]['name'], data[index]['description'], data[index]['skill-level']);},
                              child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Image.asset(data[index]['photo'], fit: BoxFit.fill),
                            ),
                            elevation: 10.0,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}