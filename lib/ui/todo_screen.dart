import 'package:flutter/material.dart';
import 'package:flutter_assignment_02/ui/new_subject_screen.dart';

class TodoScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TodoScreenState();
  }
}

class TodoScreenState extends State<TodoScreen>{

  int _currentIndex = 0;
  final List<Widget> _children = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo"),
        actions: <Widget>[
          IconButton(
            icon: new Icon(Icons.add),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => NewSubject()));
            },
          )
        ],
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.list),
            title: Text("Task")
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.done_all),
            title: Text("Completed")
          )
        ],
      ),
    );
  }
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      });
  }

}