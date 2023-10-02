import 'package:flutter/material.dart';

class PopUp extends StatelessWidget {
  PopUp({
    super.key, required this.addTask,
  });

  late String userInput;

  final Function addTask;

  void clickCreateTask(){
    if(userInput.isEmpty){
      return;
    }
    addTask(userInput);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
      ),
      title: const Center(child: Text('Create A New Task',
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w200
        ),)),
      content: Container(
        width: 120,
        height: 115,
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                userInput = value;
              },
              decoration: const InputDecoration(
                  hintText: "Your Task",
                  border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 7),
            ElevatedButton(
              onPressed: clickCreateTask,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
              ),
              child: const Text('CREATE'),
            )
          ],
        ),
      ),
    );
  }
}