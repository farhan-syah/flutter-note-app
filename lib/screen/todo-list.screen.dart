import 'package:flutter/material.dart';
import 'package:flutter_note/model/todo.model.dart';
import 'package:flutter_note/providers/task-list.provider.dart';
import 'package:provider/provider.dart';

class TodoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Todo> todoList =
        Provider.of<TaskListProvider>(context, listen: false).todoList;
    return Scaffold(
        appBar: AppBar(
          title: Text('Todo List Screen'),
        ),
        body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            final Todo todo = todoList[index];
            return Container(
              padding: EdgeInsets.all(5),
              child: Row(
                children: [
                  Flexible(
                      fit: FlexFit.loose,
                      child: Text('${todo.id}. ${todo.title}')),
                  todo.completed
                      ? Icon(
                          Icons.check,
                          color: Colors.green,
                        )
                      : Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                ],
              ),
            );
          },
        ));
  }
}
