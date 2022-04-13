import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:image_picker/image_picker.dart';
class Profile extends StatefulWidget {

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  
  String name = '';
  String skillLevel = 'Beginner';
  List skillLevels = ['Beginner', 'Intermediate', 'Advanced'];
  String description = '';
  String descriptionError = '';
  final _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change your profile!'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Name'),
                    validator: (val) => val.isEmpty ? "Please enter a proper name!" : null,
                    onChanged: (val){
                      setState(() {
                        name = val; 
                      });
                    },
                  ),
                  SizedBox(height: 15.0), 
                  DropdownButtonFormField(
                    decoration: textInputDecoration,
                    value: skillLevel,
                    items: skillLevels.map((level) {
                      return DropdownMenuItem(
                        value: level, 
                        child: Text(level), 
                      );
                    }).toList(), 
                    onChanged: (val) => setState(() => skillLevel = val),
                  ),
                  SizedBox(height: 15.0),
                  TextField(
                    onChanged: (val) => setState(() => description = val),
                    maxLines: 5,
                    decoration: textInputDecoration.copyWith(hintText: 'Enter your description!'),
                    
                  ),
                  SizedBox(height: 3.0),
                  Text(descriptionError, style: TextStyle(color: Colors.red)),
                  SizedBox(height: 15.0),
                  FlatButton(
                    child: Text('Update Profile!'), 
                    color: Colors. red, 
                    onPressed: () {
                      if (_formKey.currentState.validate() && description != ''){
                        print("$name + $description + $skillLevel");
                        setState(() {
                          descriptionError = '';
                        });
                      } 
                      else if (_formKey.currentState.validate()){
                        if (description == '') {
                          setState(() {
                            descriptionError = 'Description must not be empty!';
                          });
                        }      
                      }
                    }
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}