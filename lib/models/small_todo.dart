class SmallTodo{
  String id;
  String title;
  bool isCompleted;

  SmallTodo(
      {required this.id,
      required this.title,
      this.isCompleted = false});
}