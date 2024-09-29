import '../models/expansion_panels.dart';
import '../models/small_todo.dart';

class ExpansionPanelController {
  List<ExpansionPanels> allPanels=[];

  void addPanel(ExpansionPanels panel){
    allPanels.add(panel);
  }

  void updatePanel(String header, Set<String> newSmallTodos) {
    int index = allPanels.indexWhere((p) => p.header == header);
    ExpansionPanels currentPanel = allPanels[index];
    if (index != -1) {
      for (var newSTD in newSmallTodos) {
        if(!currentPanel.smallTodos.map((std)=>std.title).contains(newSTD)){
          currentPanel.smallTodos.add(
            new SmallTodo(
              id: currentPanel.header, 
              title: newSTD
            )
          );
        }
      }
    }
  }

  void deleteSmallTodo(String header, String smallTodoTitle) {
    int index = allPanels.indexWhere((p) => p.header == header);
    ExpansionPanels currentPanel = allPanels[index];
    if (index != -1) {
      currentPanel.smallTodos.removeWhere((std)=>std.title == smallTodoTitle);
    }
    if(currentPanel.smallTodos.length==0){
      allPanels.removeAt(index);
    }
  }
  void toggleTodoCompletion(String header, String smallTodoTitle) {
    int index = allPanels.indexWhere((p) => p.header == header);
    if (index != -1) {
      SmallTodo smallTodo = allPanels[index].smallTodos.where((std)=>std.title == smallTodoTitle).first;
      smallTodo.isCompleted = !smallTodo.isCompleted;
    }
  }

  int isCompletedLength(ExpansionPanels panel){
    return panel.smallTodos.where((s) => s.isCompleted).length;
  }

  void updateSmallTodo(String header, String oldTitle, String newTitle) {
    int panelIndex = allPanels.indexWhere((p) => p.header == header);
    if (panelIndex != -1) {
      ExpansionPanels currentPanel = allPanels[panelIndex];
      if(!currentPanel.smallTodos.map((std)=>std.title).contains(newTitle)){
        SmallTodo smallTodo = currentPanel.smallTodos.where((std)=>std.title == oldTitle).first;
        smallTodo.title = newTitle;
      }
    }
  }
}