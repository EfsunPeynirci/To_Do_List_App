import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/tasks_list.dart';
import 'add_task_screen.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/models/task_data.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.lightBlueAccent,
        onPressed: (){
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => SingleChildScrollView(  //Bu sayede klavyenin butona degmemesini sagliyoruz. OLmazsa add butonu gozukmeyecek. Ne yazdigini anlayamacaksin.
                  child: Container(
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: AddTaskScreen(),
                  ),
                )
            );  //showModlaBottomSheet ekstradan asagidan bir sayfa gelmesini sagladi
          },
      ),
      body: Column( //iki container olusturduk bunun sebebi ise ilk kisimda sagdan ve yukaridan kac br uzaklikta olacagini belirttik. Ama biz beyazda butun ekrani kapsamasini istiyorduk.
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: SafeArea(  //AfeArea ile telefon hatlarinda kalmamiz saglaniyor
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                      child: Icon(
                        Icons.list,
                        size: 30.0,
                        color: Colors.lightBlueAccent,
                      ),
                    backgroundColor: Colors.white,
                    radius: 30.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                      'To Do List',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '${Provider.of<TaskData>(context).taskCount} Tasks',   //TaskData sınıfından verilerin alındıgını belirterek yapıyoruz.
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0,),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
              ),
              child: TasksList(),
            ),
          ),
        ],
      ),
    );
  }
}



