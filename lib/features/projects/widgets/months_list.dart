import 'package:flutter/material.dart';
import 'package:task/features/projects/models/month_model.dart';
import 'package:task/features/projects/widgets/month_list_item.dart';
import 'package:task/global/methods_helpers_functions/media_query.dart';

class MonthsList extends StatefulWidget {
   MonthsList({super.key});

  @override
  State<MonthsList> createState() => _MonthsListState();
}

class _MonthsListState extends State<MonthsList> {

  int choosedId = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: MQuery.getWidth(context, 375),
      child: ListView.separated(
          padding: EdgeInsets.only(
              right: MQuery.getWidth(context, 24),
              left: MQuery.getWidth(context, 24)),
        //shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return MonthListItem(monthModel: months[index],choosedId: choosedId , onTap:(){
              setState(() {
                choosedId = months[index].id;
              });
            });
          },
          separatorBuilder: (context,index){
            return SizedBox(width: MQuery.getWidth(context, 8),);
          },
          itemCount: months.length),
    );
  }

  final List<MonthModel> months = [
    MonthModel(id: 0, name: 'Jan', value: 100),
    MonthModel(id: 1, name: 'Feb', value: 90),
    MonthModel(id: 2, name: 'Mar', value: 50),
    MonthModel(id: 3, name: 'Apr', value: 70),
    MonthModel(id: 4, name: 'May', value: 80),
    MonthModel(id: 5, name: 'Jun', value: 80),
    MonthModel(id: 6, name: 'Jul', value: 55),
    MonthModel(id: 7, name: 'Aug', value: 30),
    MonthModel(id: 8, name: 'Seb', value: 56),
    MonthModel(id: 9, name: 'Oct', value: 100),
    MonthModel(id: 10, name: 'Nov', value: 65),
    MonthModel(id: 11, name: 'Dec', value: 95),

  ];
}
