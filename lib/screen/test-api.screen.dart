import 'package:flutter/material.dart';
import 'package:flutter_note/model/todo.model.dart';
import 'package:flutter_note/providers/task-list.provider.dart';
import 'package:flutter_note/service/api.dart';
import 'package:provider/provider.dart';

class TestApiScreen extends StatefulWidget {
  const TestApiScreen({Key? key}) : super(key: key);

  @override
  _TestApiScreenState createState() => _TestApiScreenState();
}

class _TestApiScreenState extends State<TestApiScreen> {
  Future<List<Todo>> todoList = getTodo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen to Test API'),
      ),
      body: FutureBuilder<List<Todo>>(
          future: todoList,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              List<Todo> todoList = snapshot.data!;
              Provider.of<TaskListProvider>(context, listen: false).todoList =
                  todoList;
              return ListView.builder(
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
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}