import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool? isChecked;  //Stateless oldugu icin final ekledik
  final String? taskTitle;
  final void Function(bool?)? checkboxCallback;
  final void Function()? longPressCallback;

  TaskTile({this.isChecked, this.taskTitle, this.checkboxCallback, this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(   //ListTile icinde leading, title gibi ozellikler barindiriyor
      onLongPress: longPressCallback,
      title: Text(
        taskTitle!,
        style: TextStyle(
            decoration: isChecked! ? TextDecoration.lineThrough : null   //Eger tiklendiyse yazinin üzerinin cizilmesi saglandi
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}


