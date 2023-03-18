import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/model/todo.dart';

class HomeController extends GetxController {
  final List<Todo> todoList = <Todo>[].obs;

  void addTodo(String msg) {
    final o = Todo(
      id: UniqueKey().hashCode,
      msg: msg,
    );
    print(o.id);
    todoList.add(o);
  }

  void removeTodoById(int id) {
    todoList.removeWhere((o) => o.id == id);
  }
}
