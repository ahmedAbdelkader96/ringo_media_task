import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:task/features/calendar/models/task_model.dart';
import 'package:task/global/methods_helpers_functions/media_query.dart';

class TasksListItem extends StatelessWidget {
  const TasksListItem({super.key, required this.taskModel});

  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      width: MQuery.getWidth(context, 327),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.08),
                offset: Offset(4, 8),
                blurRadius: 24,
                spreadRadius: 0)
          ]),
      margin: EdgeInsets.only(
          left: MQuery.getWidth(context, 24),
          right: MQuery.getWidth(context, 24)),
      padding: EdgeInsets.symmetric(horizontal: MQuery.getWidth(context, 16)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  taskModel.name,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF191D2B)),
                ),
                const SizedBox(height: 6,),
                Text(
                  "Due Date : ${Jiffy.parseFromDateTime(taskModel.dueDate).E}, ${taskModel.dueDate.day} ${Jiffy.parseFromDateTime(taskModel.dueDate).MMM} ${taskModel.dueDate.year}",
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF697896)),
                ),
              ],
            ),
          ), 

          Checkbox(shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4)
          ),value: true, onChanged: (v){},
            activeColor: const Color(0xFF5ECEB3),checkColor: Colors.white,tristate: true,)

        ],
      ),
    );
  }
}
