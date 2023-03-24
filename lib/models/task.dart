class Task{
  final String? name;
  bool isDone;

  Task({this.name, this.isDone = false});

  void toggleDone(){
    isDone =! isDone;  //Burada eger true ise false, false ise true yaptiriyor.
  }
}