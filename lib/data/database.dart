import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  //references hive box
  final _mybox = Hive.box('todo');

  List todoList = [];

  void createInitialToDo(){
    todoList = [
      ['Make Tutorial', false],
      ['Code Flutter', false]
    ];
  }

  //load data from db
  void loadData(){
    todoList = _mybox.get('TODOLIST');
  }

  //update db
  void updateData(){
    _mybox.put('TODOLIST', todoList);
  }

}