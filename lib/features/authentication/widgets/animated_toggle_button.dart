import 'package:flutter/material.dart';

class AnimatedToggleButton extends StatelessWidget {
  const AnimatedToggleButton({super.key, required this.isSwitched, required this.onTap});
  final bool isSwitched;
  final Function() onTap;



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        height: 35.0,
        width: 60.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: isSwitched ? Colors.green : Colors.grey,
        ),
        child: Stack(
          children: <Widget>[
            AnimatedPositioned(
              duration: const Duration(milliseconds: 150),
              curve: Curves.easeIn,
              top: 5.0,
              left: isSwitched ? 30.0 : 0.0,
              right: isSwitched ? 0.0 : 30.0,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 150),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return RotationTransition(
                    turns: animation,
                    child: child,
                  );
                },
                child: isSwitched
                    ? Icon(
                        Icons.check_circle,
                        color: Colors.white,
                        key: UniqueKey(),
                      )
                    : Icon(
                        Icons.remove_circle_outline,
                        color: Colors.white,
                        key: UniqueKey(),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
