import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controller/home_controller.dart';

class AddTodoPage extends StatelessWidget {
  AddTodoPage({super.key});

  final _todoMessageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Todo"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "Todo Message",
                ),
                controller: _todoMessageController,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Get.find<HomeController>()
                      .addTodo(_todoMessageController.text);
                  _todoMessageController.clear();
                  Get.back();
                },
                child: Text("Add Todo"),
              ),
            ],
          ),
        ));
  }
}
