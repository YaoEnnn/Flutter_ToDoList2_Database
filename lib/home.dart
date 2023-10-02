import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_todolist_2/data/database.dart';
import 'package:flutter_todolist_2/pop_up.dart';
import 'package:flutter_todolist_2/todo.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget{
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // references hive box
  final _mybox = Hive.box('todo');

  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    super.initState();
    //if this is the first time running app, do this task
    if(_mybox.get('TODOLIST') == null){
      db.createInitialToDo();
    } else {
      db.loadData();
    }
  }

  void checkBoxChanged(bool? value, int index){
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateData();
  }

  void createTask(){
     showDialog(
        context: context,
        builder: (context) {
          return PopUp(addTask: clickCreateTask,);
    });
  }

  void clickCreateTask(String input){
    setState(() {
      db.todoList.add([input, false]);
      Navigator.pop(context);
    });
    db.updateData();
  }

  void deleteTask(index){
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: Platform.isAndroid? 80 : 60,
        title: const Text('TODO LIST',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => createTask(),
        child: const Icon(
            Icons.add,
            size: 40,
        ),
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) => TodoList(
            taskName: db.todoList[index][0],
            taskChecked: db.todoList[index][1],
            onChanged: (value){checkBoxChanged(value, index);},
            deleteTask: (context) => deleteTask(index),
        )
      )
    );
  }
}

