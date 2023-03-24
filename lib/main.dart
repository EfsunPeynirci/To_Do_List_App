import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/screens/tasks_screen.dart';
import 'models/task_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(    //ChangeNotifierData dedikten sonra bizim diğer sınıflarda kullanacğımız sınıfı TaskData' yı create diyerek belirtiyoruz.
      create: (BuildContext context) {
        return TaskData();
      },
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}

