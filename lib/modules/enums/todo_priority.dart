enum TodoPriority {
  urgent, mediumUrgent, notUrgent;
  static TodoPriority mapToTodoCategory(String name){
    switch(name){
      case 'urgent': return TodoPriority.urgent;
      case 'mediumUrgent': return TodoPriority.mediumUrgent;
      case'notUrgent': return TodoPriority.notUrgent;
      default: return TodoPriority.notUrgent;
    }
  }
}