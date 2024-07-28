

class TaskModel {
  String name;
  DateTime dueDate;

  TaskModel({
    required this.name,
    required this.dueDate,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        name: json['name'],
        dueDate: json['dueDate'],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "dueDate": dueDate,
      };
}
