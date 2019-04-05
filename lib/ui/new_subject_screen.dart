import 'package:flutter/material.dart';
import 'package:flutter_assignment_02/model/todo.dart';

class NewSubject extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return NewSubjectState();
  }
}
class NewSubjectState extends State<NewSubject>{

  final _formKey = GlobalKey<FormState>();

  final textController = TextEditingController();

  TodoProvider todo = TodoProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Subject"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            TextFormField(
              controller: textController,
              validator: (value){
                if (value.isEmpty){
                  return "Please fill subject";
                }
              },
              decoration: InputDecoration(
                labelText: "Subject"
              ),
            ),
            RaisedButton(
              child: Text("Save"),
              onPressed: (){
                _formKey.currentState.validate();
              },
            )
          ],
        ),
      ),
    );
  }

}