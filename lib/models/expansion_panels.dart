import 'package:flutter_project/models/small_todo.dart';

class ExpansionPanels {
  String header;
  Set<SmallTodo> smallTodos;
  bool isExpanded;
  bool isCompleted;


  ExpansionPanels({
    required this.header,
    required this.smallTodos,
    this.isExpanded=false,
    this.isCompleted=false
  });

}