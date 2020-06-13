class Task {
  final int id;
  final bool done;
  final String title;
  final String body;
  Task({ this.id, this.done, this.title, this.body });

  factory Task.fromJson(Map<String, dynamic> attributes) {
    return Task(
        id: attributes['id'],
        done: attributes['done'],
        title: attributes['title'],
        body: attributes['body']
    );
  }
}
