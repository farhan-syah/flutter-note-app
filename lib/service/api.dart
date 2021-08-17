import 'package:dio/dio.dart';
import 'package:flutter_note/model/todo.model.dart';

Future<List<Todo>> getTodo() async {
  try {
    Response response =
        await Dio().get('https://jsonplaceholder.typicode.com/todos');
    List<dynamic> data = response.data;
    List<Todo> todoList = data.map((e) => Todo.fromMap(e)).toList();
    return todoList;
  } catch (e) {
    print(e);
    return [];
  }
}
