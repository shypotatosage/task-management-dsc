import '../models/task.dart';
import '../services/database_service.dart';

class TaskRepository {
  final DatabaseService _databaseService = DatabaseService();

  Future<List<Task>> getTasks() async {
    final maps = await _databaseService.getTasks();

    return maps.map((map) => Task.fromMap(map)).toList();
  }

  Future<void> createTask(Task task) async {
    await _databaseService.createTask(task.toMap());
  }

  Future<void> updateTask(Task task) async {
    await _databaseService.updateTask(task.id, task.toMap());
  }

  Future<void> deleteTask(int id) async {
    await _databaseService.deleteTask(id);
  }
}
