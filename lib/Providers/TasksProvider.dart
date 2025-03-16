import 'package:flutter/material.dart';

import 'package:flutter_tournament/Models/Task.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TasksProvider extends StateNotifier<List<Task>> {
  
  TasksProvider() : super([ Task(title: 'ICS-104 Quiz', date:  DateTime( DateTime.now().year, DateTime.now().month,  DateTime.now().day+3))]);

  addTask(Task task) {
    state = [...state, task];
  }

  deleteTask(Task task) {
    state = List.from(state)..remove(task);
  }
}

final fDutiesProvider = StateNotifierProvider<TasksProvider, List<Task>>((ref) {
  return TasksProvider();
});