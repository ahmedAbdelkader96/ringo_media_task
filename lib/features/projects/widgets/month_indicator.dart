import 'package:flutter/material.dart';
import 'package:task/features/projects/widgets/traingle_painter.dart';

class MonthIndicator extends StatelessWidget {
  const MonthIndicator({super.key, required this.percentValue, required this.isAppear});
  final String percentValue;
  final bool isAppear;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,width: 65,
        child: !isAppear? const SizedBox.shrink(): Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Container(
              height: 32,width: 65,

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xFF191D2B),
                  boxShadow: const[
                     BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.08),
                        offset: Offset(0,8),
                        blurRadius: 24,
                        spreadRadius: 0
                    )
                  ]
              ),
              child: Center(
                child: Text("$percentValue%",
                style: const TextStyle(
                  fontSize: 16,fontWeight: FontWeight.w700,color: Color(0xFFFFFFFF)
                ),),
              ),
            ),
            Positioned(
              top: 31,
              child: CustomPaint(
                painter: TrianglePainter(
                  strokeColor: const Color(0xFF191D2B),
                  strokeWidth: 0,
                  paintingStyle: PaintingStyle.fill,
                ),
                child: const SizedBox(
                  height: 8,
                  width: 18,
                ),
              ),
            ),
          ],
        ),
    );
  }
}
