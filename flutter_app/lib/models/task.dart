class Task {
  const Task({ this.id, this.done, this.title, this.body });

  factory Task.fromJson(Map<String, dynamic> attributes) {
    return Task(
      id: attributes['id'] as int,
      done: attributes['done'] as bool,
      title: attributes['title'] as String,
      body: attributes['body'] as String,
    );
  }

  final int id;
  final bool done;
  final String title;
  final String body;
}
