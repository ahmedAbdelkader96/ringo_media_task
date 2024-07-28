import 'package:flutter/material.dart';
import 'package:task/features/calendar/models/task_model.dart';
import 'package:task/features/calendar/widgets/tasks_list_item.dart';

class TasksWidget extends StatefulWidget {
  const TasksWidget({super.key});

  @override
  State<TasksWidget> createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget> {


  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return TasksListItem(taskModel: tasks[index],);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 16,);
        },
        itemCount: tasks.length);
  }



}


DateTime now = DateTime.now();

List<TaskModel> tasks = [
  TaskModel(name: "Meeting Concept", dueDate: now),
  TaskModel(name: "Information Architecture", dueDate: now),
  TaskModel(name: "Monitoring Project", dueDate: now),
  TaskModel(name: "Daily Standup", dueDate: now),

];