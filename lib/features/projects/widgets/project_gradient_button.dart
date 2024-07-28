import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task/global/methods_helpers_functions/media_query.dart';
import 'package:task/global/widgets/general_raw_material_button.dart';

class ProjectGradientButton extends StatelessWidget {
  const ProjectGradientButton({super.key, required this.onPressed, required this.gradientColors, required this.imagePath, required this.value, required this.title, required this.shadowColor});

  final Function() onPressed;

  final List<Color> gradientColors;
  final Color shadowColor;
  final String imagePath;
  final String value;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      width: MQuery.getWidth(context, 104),
      child: Stack(

        alignment: AlignmentDirectional.center,
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              height: 24,width: MQuery.getWidth(context, 74),
              decoration: BoxDecoration(
                boxShadow:   [
                  BoxShadow(
                    color: shadowColor,
                    blurRadius: 18,
                    spreadRadius: 0.2,
                    offset: const Offset(0, 0),
                    //blurStyle: BlurStyle.inner
                  )
                ],
                borderRadius:  BorderRadius.circular(8),
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
                height: 104,
                width: MQuery.getWidth(context, 104),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: gradientColors,
                    ),

                    borderRadius: BorderRadius.circular(8)
                ),

                child:
                GeneralRawMaterialButton(
                    onPressed: onPressed,
                  height: 104,
                  width: MQuery.getWidth(context, 104),
                    backColor: Colors.transparent,
                    borderSideWidth: 0,
                    borderSideColor: Colors.transparent,
                    radius: 8,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal:MQuery.getWidth(context, 16),
                          vertical: 14),
                      child: Column(
                        children: [

                          Row(
                            children: [
                              Expanded(
                                child: Text(value,style: const TextStyle(
                                    fontWeight: FontWeight.w700,fontSize: 24,color: Color(0xFFFFFFFF)
                                ),),
                              ),
                              SvgPicture.asset(imagePath,height: 16,width: 16,),

                            ],
                          ),
                          const SizedBox(height: 6,),
                          Row(
                            children: [
                              Expanded(
                                child: Text(title,style: const TextStyle(
                                    fontWeight: FontWeight.w500,fontSize: 12,color: Color(0xFFFFFFFF)
                                ),),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                )


            ),
          ),
        ],
      ),
    );
  }
}
