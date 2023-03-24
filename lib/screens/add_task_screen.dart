import 'package:flutter/material.dart';
import 'package:to_do_list/models/task.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    String? newTaskTitle;

    return Container(
      color: Color(0xff757575),  //artiya basildiginda arka planinin karanlik olmasi saglandi
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0),),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
                "Add Task",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.lightBlueAccent,
            ),
            ),
            TextField(
              autofocus: true,  //arti tusuna bastiginda otomatik olarak klavyenin gelmesi saglaniyor
              textAlign: TextAlign.center,  //imlecin ortada olmasi saglandi
              onChanged: (newText){
                newTaskTitle = newText;
              },
            ),
            TextButton(
                child: Text(
                    "Add",
                style: TextStyle(
                  color: Colors.white,
                ),
                ),
                onPressed: (){
                  Provider.of<TaskData>(context, listen: false).addTask(newTaskTitle!);
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
