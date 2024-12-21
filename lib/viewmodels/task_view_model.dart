import '../models/task.dart';
import '../repositories/task_repository.dart';
import 'package:flutter/foundation.dart';

class TaskViewModel extends ChangeNotifier {
  final TaskRepository _repository = TaskRepository();
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  Future<void> fetchTasks() async {
    _tasks = await _repository.getTasks();
    notifyListeners();
  }

  Future<void> addTask(Task task) async {
    await _repository.createTask(task);
    await fetchTasks();
  }

  Future<void> updateTask(Task task) async {
    await _repository.updateTask(task);
    await fetchTasks();
  }

  Future<void> deleteTask(int id) async {
    await _repository.deleteTask(id);
    await fetchTasks();
  }
}