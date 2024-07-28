class MonthModel {
  int id;
  String name;
  int value;


  MonthModel({
    required this.id,
    required this.name,
    required this.value,
  });

  factory MonthModel.fromJson(Map<String, dynamic> json) =>
      MonthModel(
        id: json['id'],
        name: json['name'],
        value: json['value'],

      );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "name": name,
        "value": value,

      };
}