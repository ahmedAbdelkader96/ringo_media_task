import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

class DatePickerTimeLineWidget extends StatelessWidget {
  const DatePickerTimeLineWidget({super.key, required this.controller, required this.selectedValue,required this.onDateChange});
  final EasyInfiniteDateTimelineController controller ;
  final DateTime selectedValue;
  final Function(DateTime)? onDateChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        EasyInfiniteDateTimeLine(
          controller: controller,
          onDateChange:onDateChange ,
          activeColor: Colors.amber,
          headerBuilder: (context,_){
            return const SizedBox.shrink();
          },
          dayProps: const EasyDayProps(
              todayHighlightStyle: TodayHighlightStyle.none,
              todayStyle: DayStyle(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8)),

                ),
                dayNumStyle: TextStyle(fontSize: 12,
                    fontWeight: FontWeight.w700,
                    //color: Color(0xFFFFFFFF)
                ),
                monthStrStyle:   TextStyle(fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Color(0xFF96A0B5)
              ),
                dayStrStyle:TextStyle(fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF96A0B5)
                ),

              ),

              dayStructure: DayStructure.dayStrDayNum,
              activeDayNumStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFFFFFFF)),
              inactiveDayNumStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF191D2B)),
              activeDayStrStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFFFFFFF)),
              inactiveDayStrStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF96A0B5)),
              activeDayDecoration: BoxDecoration(
                  color: Color(0xff191D2B),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(25, 29, 43, 0.05),
                        offset: Offset(0, 12),
                        blurRadius: 30,
                        spreadRadius: 0)
                  ]),
              inactiveDayDecoration: BoxDecoration(
                color: Color(0xffFFFFFF),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),

              height: 60,
              width: 48),
          firstDate: DateTime.now(),
          lastDate:  DateTime.now().add(const Duration(days: 365)),
          focusDate: selectedValue,
          selectionMode: const SelectionMode.autoCenter(),
        ),
      ],
    );
  }
}
