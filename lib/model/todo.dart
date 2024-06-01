import 'package:cloud_firestore/cloud_firestore.dart';
class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });


  static List<ToDo> todoList() {
    return [
    //Needs work
      //ToDo(id: '01', todoText: 'Morning Jog', isDone: true),
      //ToDo(id: '02', todoText: 'Load the Dishwasher', ),

    ];
  }
}