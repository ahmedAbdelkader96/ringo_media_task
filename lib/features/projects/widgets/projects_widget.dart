import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task/features/projects/widgets/chart_widget.dart';
import 'package:task/features/projects/widgets/project_gradient_button.dart';
import 'package:task/global/methods_helpers_functions/media_query.dart';
import 'package:task/global/widgets/general_raw_material_button.dart';
import 'package:task/global/widgets/general_text_field_with_floating_label.dart';
import 'package:task/global/widgets/global_app_bar.dart';

class ProjectsWidget extends StatefulWidget {
  const ProjectsWidget({super.key});

  @override
  State<ProjectsWidget> createState() => _ProjectsWidgetState();
}

class _ProjectsWidgetState extends State<ProjectsWidget> {
  TextEditingController projectController = TextEditingController();

  @override
  void dispose() {
    projectController.dispose();
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


              const GlobalAppBar(title: 'Project Summary',),


              SizedBox(
                height: MQuery.getheight(context, 14),
              ),
            ],
          ),
        ),

        Expanded(child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Container(
                color: const Color(0xFFF6F7F8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MQuery.getheight(context, 10),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: MQuery.getWidth(context, 24),
                          left: MQuery.getWidth(context, 24)),
                      child: const Text(
                        "Search",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF191D2B)),
                      ),
                    ),
                    SizedBox(
                      height: MQuery.getheight(context, 8),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: MQuery.getWidth(context, 24),
                          left: MQuery.getWidth(context, 24)),
                      child: GeneralTextFieldWithFloatingLabel(
                          controller: projectController,
                          hintText: "Search project here",
                          onChanged: (v) {},
                          validator: (value) {
                            return null;
                          },
                          suffixIcon: SvgPicture.asset('assets/images/search.svg')),
                    ),

                    SizedBox(
                      height: MQuery.getheight(context, 24),
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                          right: MQuery.getWidth(context, 24),
                          left: MQuery.getWidth(context, 24)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ProjectGradientButton(
                              onPressed: () {},
                              gradientColors: const [
                                Color(0xFF3A9ADE),
                                Color(0xFF5EACE4)
                              ],
                              shadowColor: const Color.fromRGBO(94, 172, 228, 0.8),
                              imagePath: 'assets/images/clock.svg',
                              value: '10',
                              title: 'Project In Progress'),

                          ProjectGradientButton(
                              onPressed: () {},
                              gradientColors: const [
                                Color(0xFF3F8B8D),
                                Color(0xFF58B2B4)
                              ],
                              shadowColor: const Color.fromRGBO(88, 178, 180, 0.8),

                              imagePath: 'assets/images/verify.svg',
                              value: '24',
                              title: 'Project Competed'),


                          ProjectGradientButton(
                              onPressed: () {},
                              gradientColors: const [
                                Color(0xFFDD4A4A),
                                Color(0xFFE87777)
                              ],
                              shadowColor: const Color.fromRGBO(231, 116, 116, 0.8),

                              imagePath: 'assets/images/close-circle.svg',
                              value: '5',
                              title: 'Project Cancelled'),

                        ],
                      ),
                    ),


                    SizedBox(
                      height: MQuery.getheight(context, 24),
                    ),


                    Center(
                      child: GeneralRawMaterialButton(
                          onPressed: (){},
                          height: 48,
                          width: MQuery.getWidth(context, 327),
                          backColor: Colors.transparent,
                          borderSideWidth: 1.5,
                          borderSideColor: const Color(0xFF191D2B),
                          radius: 8,
                          child: const Text("View All Project",style: TextStyle(
                              fontSize:14 ,fontWeight: FontWeight.w700,color: Color(0xFF191D2B)
                          ),)),
                    ),

                    SizedBox(
                      height: MQuery.getheight(context, 24),
                    ),
                  ],
                ),
              ),
              const ChartWidget(),








            ],
          ),
        ))
      ],
    );
  }
}
