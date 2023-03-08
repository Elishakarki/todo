import 'package:quiz/model.dart';

import 'package:flutter/material.dart';
import 'package:quiz/model.dart';
import 'package:quiz/modelchange.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  String newtasktitle = "";
  AddTaskScreen({
    Key? key,
    newtasktitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Add new Todo list"),
          TextFormField(
            autofocus: true,
            textAlign: TextAlign.center,
            decoration: InputDecoration(hintText: "Enter  to  do task"),
            keyboardType: TextInputType.text,
            onSaved: (newValue) {
              newtasktitle = newValue!;
            },
          ),
          ElevatedButton(
              onPressed: (() {
                Provider.of<Todotask>(context,listen: false)
                    .addtask(newtasktitle);
                Navigator.pop(context);
              }),
              child: Text("Add"))
        ],
      ),
    );
  }
}
