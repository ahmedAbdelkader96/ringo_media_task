import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task/features/calendar/date_time_picker/src/date/days_picker.dart';
import 'package:task/global/methods_helpers_functions/media_query.dart';
import 'package:task/global/widgets/general_raw_material_button.dart';

class PickDateTimeBottomSheet extends StatefulWidget {
  const PickDateTimeBottomSheet({super.key, required this.date});

  final DateTime date;

  @override
  State<PickDateTimeBottomSheet> createState() =>
      _PickDateTimeBottomSheetState();
}

class _PickDateTimeBottomSheetState extends State<PickDateTimeBottomSheet> {
  DateTime? selectedValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedValue = widget.date;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: MQuery.getWidth(context, 16)),
      child: Column(
        children: [
          SizedBox(
            height: MQuery.getheight(context, 5),
          ),
          Row(
            children: [
              const SizedBox(width: 35,height: 30,),
              const Expanded(
                child: Text(
                  "Choose Date",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),

              GeneralRawMaterialButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  height: 30,
                  width: 35,
                  backColor: Colors.transparent,
                  borderSideWidth: 0,
                  borderSideColor: Colors.transparent,
                  radius: 4,
                  child: Center(child: SvgPicture.asset('assets/images/close.svg'),)),
            ],
          ),

          const Divider(
            height: 1.5,
            color: Color(0xFFE8EAEE),
          ),
          SizedBox(
            height: MQuery.getheight(context, 24),
          ),
          SizedBox(
            width: 300,
            height: 390,
            child: DaysPicker(
              selectedDate: selectedValue,
              selectedCellTextStyle:const TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.white) ,
              selectedCellDecoration: const BoxDecoration(
                shape: BoxShape.circle,color: Colors.black
              ),





              minDate: DateTime(2021, 1, 1),
              maxDate: DateTime(2050, 12, 31),
              onDateSelected: (value) {
                setState(() {
                  selectedValue = value;
                });
                // Handle selected date
              },
            ),
          ),
          const Divider(
            thickness: 1.5,
            color: Color(0xFFE8EAEE),
          ),
          SizedBox(
            height: MQuery.getheight(context, 24),
          ),
          GeneralRawMaterialButton(
              onPressed: () {
                print(selectedValue!.day);
                Navigator.pop(context, selectedValue);
              },
              height: 56,
              width: MQuery.getWidth(context, 327),
              backColor: const Color(0xFF191D2B),
              borderSideWidth: 0,
              borderSideColor: Colors.transparent,
              radius: 8,
              child: const Text(
                "Continue",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Colors.white),
              )),
          SizedBox(
            height: MQuery.getheight(context, 48),
          ),
        ],
      ),
    );
  }
}
