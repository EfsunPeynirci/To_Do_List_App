import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'task.dart';

class TaskData extends ChangeNotifier{
  List <Task> _tasks = [   //_tasks yaparak private olmasini yani sadece bu sinif icerisinde tanimlanmasini sagladik.
    Task(name:"Buy milk"),
    Task(name: "Buy eggs"),
    Task(name: "Buy bread"),
  ];

  UnmodifiableListView <Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  //UnmodifiableListView yerine List de yazilabilir. Ama onu yazdigimizda baska sınıflardan _tasks a erisebilirler.
  //Ornegin add_task_screen de TextButton ın icindeki onPressed de Provider.of<TaskData>(context).addTask(newTaskTitle!); yerine  Provider.of<TaskData>(context).tasks.add("xyz");
  //yazilabilir. Bu sebepten dolayi UnmodifiableListView kullanildi.

  int get taskCount{
    return _tasks.length;
  }

  void addTask(String newTaskTitle){
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();  //update yapilmasini sagliyor, herkese bir degisiklik oldugunu haber veriyor.
  }

  void updateTask(Task task){
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }
}