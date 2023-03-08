import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/addtask.dart';
import 'package:quiz/modelchange.dart';

// void main(List<String> args) {
//   runApp(MaterialApp(
      
//       ),
//       home: ChangeNotifierProvider<Todotask>(
//           create: ((context) => Todotask()), child: MyScreen())));
// }
void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Todotask>(
      create: (_) => Todotask(),
      child: MaterialApp(
        theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.pink,),
        title: 'Flutter Demo',
        home: MyScreen(),
      ),
    );
  }
}



class MyScreen extends StatefulWidget {
  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  @override
  Widget build(BuildContext context) {
   var  titles =context.watch<Todotask>().titles;
    // Use the screen width and height to build your UI
    
      return SafeArea(
        child: Scaffold(
          body: ListView.builder(
            itemCount: titles.length,
            itemBuilder: (context, index) {
              return Card(
                shadowColor: Colors.grey,
                elevation: 3,
                child: ListTile(
                  leading: Checkbox(
                      checkColor: Colors.blue,
                      value: titles[index].ischecked,
                      onChanged: ((bool? value) {
                        setState(() {
                        titles[index].ischecked = value!;
                        });
                      })),
                  title: Text(titles[index].title, style: TextStyle(color: Colors.black),),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: (() {
                      setState(() {
                       titles.removeAt(index);
                      });
                    }),
                  ),
                ),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (() {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return AddTaskScreen();
                  });
            }),
            child: Icon(Icons.add),
          ),
        ),
      );
    
  }
}
