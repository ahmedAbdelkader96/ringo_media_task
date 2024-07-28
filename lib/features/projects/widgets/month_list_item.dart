import 'package:flutter/material.dart';
import 'package:task/features/projects/models/month_model.dart';
import 'package:task/features/projects/widgets/month_indicator.dart';
import 'package:task/global/methods_helpers_functions/media_query.dart';

class MonthListItem extends StatelessWidget {
  const MonthListItem(
      {super.key, required this.monthModel, required this.choosedId, required this.onTap});

  final MonthModel monthModel;
  final int choosedId;
  final Function() onTap;





  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 250,
        width: MQuery.getWidth(context, 48),
        child: Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MonthIndicator(
                  percentValue: monthModel.value.toString(),
                  isAppear: choosedId == monthModel.id ? true : false
              ),
              const SizedBox(height: 14,),
              Container(
                height: (monthModel.value*150)/100,
                width: MQuery.getWidth(context, 48),

                decoration: BoxDecoration(
                    color: choosedId == monthModel.id ? const Color(0xFF191D2B): null,

                    gradient:choosedId == monthModel.id ? null:const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromRGBO(25, 28, 42, 0.12),
                        Color.fromRGBO(25, 28, 42, 0.06)

                      ],
                    ),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),topRight: Radius.circular(8)
                    )

                ),
              ),
              const SizedBox(height: 12,),
              Text(monthModel.name,style: const TextStyle(
                fontWeight:FontWeight.w500 ,fontSize: 14,color: Color.fromRGBO(14, 18, 62, 0.4)
              ),)

            ],
          ),
        ),
      ),
    );
  }
}
