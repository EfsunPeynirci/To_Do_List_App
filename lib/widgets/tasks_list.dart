import 'package:flutter/material.dart';
import '../models/task.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer <TaskData>(
      builder: (context, taskData, child){
        return ListView.builder(
          itemBuilder: (context, index){  //Build context widget'ın kendisi hakkında değil, bir widget'ın, widget tree'deki yeri hakkında bilgi içermesidir.
            final task = taskData.tasks[index];
            return TaskTile(
                taskTitle: task.name,
                isChecked: task.isDone,
                checkboxCallback: (checkboxState){  //bu tusun acik ise kapali veya kapaliysa acik olmasini sagliyor
                  taskData.updateTask(task);
                },
                longPressCallback: (){
                  taskData.deleteTask(task);
            },
            );
          },
          itemCount: taskData.taskCount, //Bu da kac tane gorevin oldugunu soyleyecek
        );
      },
    );
  }
}

//Normalde Consumer olmadan return ListView.builder dediğimiz kısmı yazarak da yapabiliriz.
//TaskData kısmında aldığımız yerleri Provider.of<TaskData>(context) diyerek yaparız.
//Ornegin name yerinde Provider.of<TaskData>(context).tasks![index].name deriz.
//Ama surekli bunu yapmak yerine Consumer yazarak ilk baslangicta belirterek yapariz.
//TaskData yazacagimiz yeri builder' ın icinde taskData olarak adlandirdik. Onların yerine taskData yazabiliriz.