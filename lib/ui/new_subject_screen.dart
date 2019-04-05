import 'package:flutter/material.dart';

class NewSubject extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NewSubjectState();
  }
}
class NewSubjectState extends State<NewSubject>{
  final _formKey = GlobalKey<FormState>();
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