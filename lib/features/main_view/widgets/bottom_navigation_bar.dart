import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task/features/main_view/widgets/navigation_plus_button.dart';
import 'package:task/global/methods_helpers_functions/media_query.dart';
import 'package:task/global/widgets/general_raw_material_button.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({
    super.key,
    required this.onTap,
    required this.selectedIndex,
  });

  final Function(int) onTap;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    double w = MQuery.getWidth(context, 375);
    double h = 90;

    double wSmall = MQuery.getWidth(context, 70);
    double hSmall = 74;

    return Container(
      height: h,
      width: w,
      color: Colors.transparent,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Column(
            children: [
              const SizedBox(height: 16),
              Container(
                padding: EdgeInsets.symmetric(horizontal: MQuery.getWidth(context, 8)),
                height: hSmall,
                width: w,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(24),
                        topLeft: Radius.circular(24)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 30,
                          spreadRadius: 2,
                          offset: const Offset(0, 1)
                      )
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GeneralRawMaterialButton(
                        onPressed: () => onTap(0),
                        height: hSmall,
                        width: wSmall,
                        backColor: Colors.transparent,
                        borderSideWidth: 0,
                        borderSideColor: Colors.transparent,
                        radius: 32,
                        child: SvgPicture.asset('assets/images/category.svg',
                            height: 26,color: selectedIndex == 0?Colors.black:const Color(0xFF697896),)),
                    GeneralRawMaterialButton(
                        onPressed: () => onTap(1),
                        height: hSmall,
                        width: wSmall ,
                        backColor: Colors.transparent,
                        borderSideWidth: 0,
                        borderSideColor: Colors.transparent,
                        radius: 32,
                        child: SvgPicture.asset(
                            selectedIndex == 1
                                ? 'assets/images/folder_bold.svg'
                                : 'assets/images/folder.svg',
                            height: 26)),
                    SizedBox(width: MQuery.getWidth(context, 70),),
                    GeneralRawMaterialButton(
                        onPressed: () => onTap(2),
                        height: hSmall,
                        width: wSmall,
                        backColor: Colors.transparent,
                        borderSideWidth: 0,
                        borderSideColor: Colors.transparent,
                        radius: 32,
                        child: SvgPicture.asset(
                            selectedIndex == 2
                                ? 'assets/images/calendar_bold.svg'
                                : 'assets/images/calendar.svg',
                            height: 26)),
                    GeneralRawMaterialButton(
                        onPressed: () => onTap(3),
                        height: hSmall,
                        width: wSmall ,
                        backColor: Colors.transparent,
                        borderSideWidth: 0,
                        borderSideColor: Colors.transparent,
                        radius: 32,
                        child:
                            Container(
                              height: 40,width: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: selectedIndex == 3?Colors.black:Colors.transparent)
                                ),
                                child: Center(child: Image.asset('assets/images/user.png', height: 26)))),
                  ],
                ),
              ),
            ],
          ),
          const Positioned(
            top: 0,
            child: NavigationPlusButton(),
          )
        ],
      ),
    );
  }
}
