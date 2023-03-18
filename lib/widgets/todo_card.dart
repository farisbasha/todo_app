import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controller/home_controller.dart';
import 'package:todo_app/model/todo.dart';

class TodoCard extends StatefulWidget {
  const TodoCard({
    super.key,
    required this.todo,
  });

  final Todo todo;

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(children: [
            Expanded(
              child: CheckboxListTile(
                title: Text(
                  widget.todo.msg,
                  style: TextStyle(
                    decoration: isChecked
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                value: isChecked,
                onChanged: (newValue) {
                  isChecked = newValue!;
                  setState(() {});
                },
                controlAffinity: ListTileControlAffinity.leading,
                secondary: ElevatedButton(
                    onPressed: () {
                      Get.find<HomeController>().removeTodoById(widget.todo.id);
                    },
                    child: Icon(Icons.delete),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    )),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
