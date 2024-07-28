import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigationPlusButton extends StatelessWidget {
  const NavigationPlusButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: const StadiumBorder(),

      onTap: (){},
      child: SizedBox(
        height: 60,
        width: 60,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                height: 17,width: 38,
                decoration: const BoxDecoration(
                  boxShadow:   [
                    BoxShadow(
                      color: Color(0xFF697896),
                      blurRadius: 10,
                      spreadRadius: 0.5,
                      offset: Offset(0, 0),
                      //blurStyle: BlurStyle.inner
                    )
                    ],
                  //color: Color(0xFF697896),
                  borderRadius:  BorderRadius.all( Radius.elliptical(38, 17)),
                ),
              ),
            ),
            Positioned(
              top: 0,
              child: Container(
                height: 56,
                width: 56,
                padding: const EdgeInsets.all(8),
                decoration:   const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFF191D2B),
                    // boxShadow: [

                ),
                child: SvgPicture.asset('assets/images/plus.svg',height:20 ,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
