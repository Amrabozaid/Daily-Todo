import '../models/todo.dart';

class TodoController {
  List<Todo> allTodo = [];


  void addTodo(Todo todo) {
    allTodo.add(todo);
  }

  void updateTodo(Todo todo) {
    int index = allTodo.indexWhere((t) => t.id == todo.id);
    if (index != -1) {
      allTodo[index] = todo;
    }
  }

  void deleteTodo(Todo todo) {
    allTodo.removeWhere((t) => t.id == todo.id);
  }

  void toggleComplete(Todo todo) {
    todo.isCompleted = !todo.isCompleted;
  }
}
