import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Task {
  String? id;
  String title;
  String description;
  String author;
  DateTime createdDate;
  String authorId;
  bool completed;

  Task(
      {required this.title,
      required this.description,
      required this.author,
      required this.createdDate,
      required this.authorId,
      this.completed = false,
      this.id});

  static Task fromMap(Map<String, dynamic> data, {String? id}) {
    try {
      return Task(
          title: data['title'] ?? '',
          description: data['description'] ?? '',
          author: data['author'] ?? '',
          id: id,
          createdDate: (data['createdDate'] as Timestamp).toDate(),
          authorId: data['authorId'] ?? '',
          completed: data['completed'] ?? false);
    } catch (e) {
      print(e);
      throw (e);
    }
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'author': author,
      'createdDate': createdDate,
      'authorId': authorId,
      'completed': completed,
    };
  }

  get createdDateInString {
    return DateFormat('d/M/y').add_jm().format(createdDate);
  }
}

// List<Task> taskList = [
//   Task(title: 'Task 1', description: 'Task 1 Description'),
//   Task(title: 'Task 2', description: 'Task 2 Description'),
//   Task(title: 'Task 3', description: 'Task 3 Description'),
// ];
