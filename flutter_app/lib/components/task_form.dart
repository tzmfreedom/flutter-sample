import 'package:flutter/material.dart';
import 'package:flutterapp/models/task.dart';
import 'package:flutterapp/components/task_view_model.dart';
import 'package:provider/provider.dart';

class NewTaskForm extends StatefulWidget {
  @override
  NewTaskFormState createState() {
    return NewTaskFormState();
  }
}

class NewTaskFormState extends State<NewTaskForm> {
  final _formKey = GlobalKey<FormState>();

  String inputTitle = '';
  String inputBody = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            onChanged: (text) {
              setState(() {
                inputTitle = text;
              });
            }
          ),
          TextFormField(
              onChanged: (text) {
                setState(() {
                  inputBody = text;
                });
              }
          ),
          RaisedButton(
            onPressed: () {
              final viewModel = Provider
                  .of<TaskViewModel>(context, listen: false);
              if (_formKey.currentState.validate()) {
                viewModel.add(Task(
                    id: 0,
                    done: false,
                    title: inputTitle,
                    body: inputBody
                ));
                Navigator.pop(context, 'New Task Created');
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
