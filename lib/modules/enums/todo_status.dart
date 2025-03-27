enum TodoStatus {
  completed, pending;
  static TodoStatus mapToTodoCategory(String name){
    switch(name){
      case 'completed': return TodoStatus.completed;
      case 'pending': return TodoStatus.pending;
      default: return TodoStatus.pending;
    }
  }
}