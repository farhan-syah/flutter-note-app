class Todo {
  int userId;
  int id;
  String title;
  bool completed;

  Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  static Todo fromMap(Map<String, dynamic> data) {
    return Todo(
        userId: data['userId'],
        id: data['id'],
        title: data['title'],
        completed: data['completed']);
  }
}
