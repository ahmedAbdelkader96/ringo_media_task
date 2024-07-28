import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task/features/projects/widgets/months_list.dart';
import 'package:task/global/methods_helpers_functions/media_query.dart';
import 'package:task/global/widgets/general_raw_material_button.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: MQuery.getWidth(context, 375),
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(
                right: MQuery.getWidth(context, 24),
                left: MQuery.getWidth(context, 24)),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    "Productivity",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF191D2B)),
                  ),
                ),
                GeneralRawMaterialButton(
                    onPressed: (){},
                    height: 40,
                    width: 40,
                    backColor: Colors.transparent,
                    borderSideWidth: 0,
                    borderSideColor: Colors.transparent,
                    radius: 4,
                    child: SvgPicture.asset('assets/images/more.svg'))
              ],
            ),
          ),
          // const SizedBox(
          //   height: 10,
          // ),


          MonthsList(),

          const SizedBox(
            height: 10,
          ),


        ],
      ),
    );
  }
}
