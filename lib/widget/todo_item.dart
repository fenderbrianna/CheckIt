import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp/model/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;
  ToDoItem({
    Key? key,
    required this.todo,
    required this.onToDoChanged,
    required this.onDeleteItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onToDoChanged(todo);
          if (todo.isDone = todo.isDone) {
            var query = FirebaseFirestore.instance.collection("checkits").doc(
                todo.id).update(
                {
                  "isDone": true,
                }
            ).then((value) {
              print("Successfully update the todo to true");
            }).catchError((error) {
              print("Failed to update the todo.");
              print(error);
            });
          } else {
            var query = FirebaseFirestore.instance.collection("checkits").doc(
                todo.id).update(
                {
                  "isDone": false,
                }
            ).then((value) {
              print("Successfully update the todo to false.");
            }).catchError((error) {
              print("Failed to update the todo.");
              print(error);
            });
          }
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
         ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.green,
        ),
        title: Text(
          todo.todoText!,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12,),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: Icon(Icons.delete),
            onPressed: () {
              onDeleteItem(todo.id);
              var query = FirebaseFirestore.instance.collection("checkits").doc(todo.id).delete().
              then((value) {
                print("Successfully deleted the todo.");
              }).catchError((error) {
                print("Failed to delete the todo.");
                print(error);
              });
            }
          ),
        ),
      ),
    );
  }
}