import 'package:flutter/material.dart';
import 'package:flutter_note/model/todo.model.dart';
import 'package:flutter_note/service/api.dart';

class TestApiScreen extends StatelessWidget {
  const TestApiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen to Test API'),
      ),
      body: FutureBuilder<List<Todo>>(
          future: getTodo(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              List<Todo> todoList = snapshot.data!;
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
    );
  }
}
