import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class TodoList extends StatelessWidget{
  TodoList(
    {super.key,
    required this.taskName,
    required this.taskChecked,
    required this.onChanged,
    required this.deleteTask});


  final String taskName;
  final bool taskChecked;
  Function(bool?) onChanged;
  Function(BuildContext) deleteTask;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, top: 50),
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.3,
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteTask,
              icon: Icons.delete_outline_outlined,
              backgroundColor: Colors.redAccent,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          width: 350,
          margin: const EdgeInsets.only(left: 30),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Checkbox(
                activeColor: const Color(0x69bdbdbd),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3)
                ),
                  value: taskChecked,
                  onChanged: onChanged),
              const SizedBox(width: 10,),
              Text(taskName,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    decoration: taskChecked ? TextDecoration.lineThrough : TextDecoration.none
                ),),
            ],
          ),
        ),
      ),
    );
  }
}