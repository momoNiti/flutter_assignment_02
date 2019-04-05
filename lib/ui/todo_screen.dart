import 'package:flutter/material.dart';
import 'package:flutter_assignment_02/model/todo.dart';
import 'package:flutter_assignment_02/ui/new_subject_screen.dart';

class TodoScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TodoScreenState();
  }
}

class TodoScreenState extends State<TodoScreen>{

  int _selectedIndex = 0;
  final List<Widget> _children = [];

  TodoProvider todo = TodoProvider();
  List<Todo> todoesUnDone = [];
  List<Todo> todoesDone = [];

  void openFunc() async{
    await todo.open("todo.db");
    todo.getTodoesNotDone().then((todoesUnDone){
      setState(() {
        this.todoesUnDone = todoesUnDone;
      });
    });
  }

  final _widgetOptions = [
    Task(),
    Completed()
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(

          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.white,
              primaryColor: Colors.blue,
              textTheme: Theme.of(context).textTheme.copyWith(
                caption: TextStyle(color: Colors.grey)
              )
            ),
            child: BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.list),
                  title: Text("Task"),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.done_all),
                  title: Text("Completed"),
                )
              ],
            ),
          ),
        ),
      ),
    );


    // Scaffold(
    //   appBar: AppBar(
    //     title: Text("Todo"),
    //     actions: <Widget>[
    //       IconButton(
    //         icon: new Icon(Icons.add),
    //         onPressed: (){
    //           Navigator.push(context, MaterialPageRoute(builder: (context) => NewSubject()));
    //         },
    //       )
    //     ],
    //   ),
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      });
  }

}

class Task extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => NewSubject()));
            },
          )
        ],
      ),
    );
  }

}

class Completed extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: (){
              
            },
          )
        ],
      ),
    );
  }

}