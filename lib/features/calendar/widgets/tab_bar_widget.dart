import 'package:flutter/material.dart';
import 'package:task/features/calendar/widgets/day_events_widget.dart';
import 'package:task/features/calendar/widgets/tasks_widget.dart';
import 'package:task/global/methods_helpers_functions/media_query.dart';

class TabBarWidget extends StatefulWidget {
   TabBarWidget({super.key});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  @override
  Widget build(BuildContext context) {


    return Expanded(
      child:  DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Container(
                height: 42,
                color: const Color(0xFFF6F7F8),

                child: TabBar(

                  padding: EdgeInsets.zero,
                  tabAlignment: TabAlignment.fill ,
                  dividerHeight: 0,
                  labelStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF191D2B)),
                  unselectedLabelStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF96A0B5)),
                  indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(width: 1.5),
                  ),

                  tabs: [
                    Container(
                      color: const Color(0xFFF6F7F8),
                      height: 42,
                      width: MQuery.getWidth(context, 400)/2,
                      child: const Tab(
                        text: 'Schedule',
                      ),
                    ),
                    Container(
                      color: const Color(0xFFF6F7F8),
                      height: 42,

                      width: MQuery.getWidth(context, 375)/2,
                      child: const Tab(text: 'Task'),
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: TabBarView(children: [
                  DayEventsWidget(),
                  TasksWidget(),
                ]),
              )
            ],
          ),
        ),
    );
  }




}
