import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiffy/jiffy.dart';
import 'package:task/global/methods_helpers_functions/media_query.dart';

class DayEventsWidget extends StatelessWidget {
  const DayEventsWidget({super.key});



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: MQuery.getWidth(context, 24),
          right: MQuery.getWidth(context, 24)),
      child: DayView(

        headerStyle: const HeaderStyle(
          headerTextStyle: TextStyle(
            fontSize: 0
          ),
          leftIconVisible: false,
            rightIconVisible: false
        ),
        liveTimeIndicatorSettings: const LiveTimeIndicatorSettings(
            color: Colors.black,
            showBullet: true,
            showTime: true,
            showTimeBackgroundView: false,
        ),
        showHalfHours: false,
        heightPerMinute: 1.4,

        pageViewPhysics: const NeverScrollableScrollPhysics(),
        controller: EventController()..addAll(_events),
        eventTileBuilder: (date, events, boundry, start, end) {
          CalendarEventData event = events.where((e)=> e.date == date).toList()[0];
          return Row(
            children: [
              Container(
                width: 5,
                decoration: BoxDecoration(
                    color: event.color,

                    borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),bottomLeft: Radius.circular(16)
                  )
                ),
              ),
              Container(
                width: MQuery.getWidth(context, 264),
                color: event.titleStyle!.backgroundColor,
                padding: EdgeInsets.symmetric(horizontal: MQuery.getWidth(context, 16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Row(
                      children: [
                        Expanded(
                          child: Text(event.title,overflow: TextOverflow.fade,style: const TextStyle(
                            fontWeight: FontWeight.w600,fontSize: 14,color: Color(0xFF191D2B)
                          ),),
                        ),
                      ],
                    ),
                    Row(
                      children: [

                        SvgPicture.asset('assets/images/clock.svg',color: const Color(0xFF96A0B5),) ,
                        SizedBox(width: MQuery.getWidth(context, 8),),
                        Text("${Jiffy.parseFromDateTime(event.startTime!).format(pattern: 'h:mm a')} - ${Jiffy.parseFromDateTime(event.endTime!).format(pattern: 'h:mm a')}",style: const TextStyle(
                            fontWeight: FontWeight.w500,fontSize: 12,color: Color(0xFF96A0B5)
                        ),),

                      ],
                    )



                  ],
                ),
              ),
            ],
          );
        },
        fullDayEventBuilder: (events, date) {
          return Container(
          );
        },
        showVerticalLine: false,
        showLiveTimeLineInAllDays: true,

        minDay: DateTime(1990),
        maxDay: DateTime(2050),
        initialDay: DateTime.now(),
        eventArranger: const SideEventArranger(),
        onEventTap: (events, date) => print(events),
        onEventDoubleTap: (events, date) => print(events),
        onEventLongTap: (events, date) => print(events),
        onDateLongPress: (date) => print(date),
        startHour: 0,
        timeLineWidth: 40,
        timeLineOffset: 6,
        timeLineBuilder: (DateTime date){
          return Text("${date.hour}:00",
          style: const TextStyle(
            fontWeight: FontWeight.w500,fontSize: 12,color: Color(0xFF191D2B)
          ),);
        },
        //startDuration: Duration(hours: 8),
      ),
    );
  }

}


DateTime get _now => DateTime.now();
List<CalendarEventData> _events = [

  CalendarEventData(
      date: _now,
      title: "Sprint Review Period 02 in May 2022",
      description: "Sprint Review Period 02 in May 2022",
      startTime: DateTime(_now.year, _now.month, _now.day, 1, 0),
      endTime: DateTime(_now.year, _now.month, _now.day, 2,0),
      titleStyle: const TextStyle(backgroundColor: Color(0xFFF9F1FB)),
      color: const Color(0xFFD08CDF)
  ),
  CalendarEventData(
      date: _now,
      startTime: DateTime(_now.year, _now.month, _now.day, 4),
      endTime: DateTime(_now.year, _now.month, _now.day, 6),
      title: "Meeting with Client",
      description: "Meeting with Client",
      titleStyle: const TextStyle(backgroundColor: Color(0xFFFEDFCC)),
      color: const Color(0xFFFD7722)
  ),
  CalendarEventData(
      date: _now,
      startTime: DateTime(_now.year, _now.month, _now.day, 7,30),
      endTime: DateTime(_now.year, _now.month, _now.day, 8,0),
      title: "Daily Standup",
      description: "Daily Standup",
      titleStyle: const TextStyle(backgroundColor: Color(0xFFEBF9F5)),
      color: const Color(0xFF5ECEB3)
  ),


  CalendarEventData(
    date: _now,
    title: "Sprint Review Period 02 in May 2022",
    description: "Sprint Review Period 02 in May 2022",
    startTime: DateTime(_now.year, _now.month, _now.day, 9, 0),
    endTime: DateTime(_now.year, _now.month, _now.day, 10,0),
    titleStyle: const TextStyle(backgroundColor: Color(0xFFF9F1FB)),
    color: const Color(0xFFD08CDF)
  ),
  CalendarEventData(
    date: _now,
    startTime: DateTime(_now.year, _now.month, _now.day, 11),
    endTime: DateTime(_now.year, _now.month, _now.day, 12),
    title: "Meeting with Client",
    description: "Meeting with Client",
      titleStyle: const TextStyle(backgroundColor: Color(0xFFFEDFCC)),
      color: const Color(0xFFFD7722)
  ),
  CalendarEventData(
    date: _now,
    startTime: DateTime(_now.year, _now.month, _now.day, 12),
    endTime: DateTime(_now.year, _now.month, _now.day, 12,30),
    title: "Daily Standup",
    description: "Daily Standup",
      titleStyle: const TextStyle(backgroundColor: Color(0xFFEBF9F5)),
      color: const Color(0xFF5ECEB3)
  ),

];