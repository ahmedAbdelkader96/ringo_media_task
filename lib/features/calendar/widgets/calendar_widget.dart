import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiffy/jiffy.dart';
import 'package:task/features/calendar/widgets/date_picker_time_line_widget.dart';
import 'package:task/features/calendar/widgets/tab_bar_widget.dart';
import 'package:task/global/methods_helpers_functions/bottom_sheets_handler.dart';
import 'package:task/global/methods_helpers_functions/media_query.dart';
import 'package:task/global/widgets/general_raw_material_button.dart';
import 'package:task/global/widgets/global_app_bar.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget>with TickerProviderStateMixin  {

  late AnimationController animationController;


  DateTime selectedValue = DateTime.now();
  EasyInfiniteDateTimelineController controller =
      EasyInfiniteDateTimelineController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = BottomSheet.createAnimationController(this);
    animationController.duration = const Duration(milliseconds: 500);
  }


  @override
  void dispose() {
    animationController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: const Color(0xFFF6F7F8),
          child: Column(
            children: [
              const GlobalAppBar(
                title: 'Calendar',
              ),
              SizedBox(
                height: MQuery.getheight(context, 14),
              ),

              Padding(
                padding: EdgeInsets.only(
                    left: MQuery.getWidth(context, 14),
                    right: MQuery.getWidth(context, 24)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(4),
                          onTap: () async {
                            DateTime? date = await BottomSheetsHandler.pickDateTime(context: context,
                                animationController: animationController,
                                date: selectedValue);

                            if(date != null){
                              setState(() {
                                selectedValue = date;
                                controller.animateToDate(selectedValue,duration: const Duration(milliseconds: 200));

                              });
                            }

                          },
                          child: SizedBox(
                              height: 40,
                              child: Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 6),
                                child: Row(
                                  children: [
                                    Text(
                                      Jiffy.parseFromDateTime(selectedValue).yMMMM,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18,
                                          color: Color(0xFF191D2B)),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    SvgPicture.asset(
                                      'assets/images/arrow_down.svg',
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              )),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        GeneralRawMaterialButton(
                            onPressed: () {
                              setState(() {
                                selectedValue = Jiffy.parseFromDateTime(selectedValue).subtract(months: 1).dateTime;
                                controller.animateToDate(selectedValue,duration: const Duration(milliseconds: 200));
                              });
                            },
                            height: 32,
                            width: 32,
                            backColor: Colors.transparent,
                            borderSideWidth: 1.5,
                            borderSideColor: const Color(0xFFE8EAEE),
                            radius: 8,
                            child: SvgPicture.asset(
                                'assets/images/arrow-left.svg')),
                        GeneralRawMaterialButton(
                            onPressed: () {
                              setState(() {
                                selectedValue = Jiffy.parseFromDateTime(selectedValue).add(months: 1).dateTime;
                                controller.animateToDate(selectedValue,duration: const Duration(milliseconds: 200));
                              });
                            },
                            height: 32,
                            width: 32,
                            backColor: Colors.transparent,
                            borderSideWidth: 1.5,
                            borderSideColor: const Color(0xFFE8EAEE),
                            radius: 8,
                            child: SvgPicture.asset(
                                'assets/images/arrow-right.svg'))
                      ],
                    ),
                  ],
                ),
              ),
              DatePickerTimeLineWidget(
                  controller: controller,
                  selectedValue: selectedValue,
                  onDateChange: (selectedDate) {
                    setState(() {
                      selectedValue = selectedDate;
                    });
                    //[selectedDate] the new date selected.
                  }
              ),
              SizedBox(
                height: MQuery.getheight(context, 24),
              ),

            ],
          ),
        ),

         TabBarWidget(),

      ],
    );
  }
}
