import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:task/features/authentication/controller/controller.dart';
import 'package:task/global/navigation_routes/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    initPage();
  }

  Future<void> initPage() async {
    final AuthController authController = AuthController();
    Session? currentSession = await authController.getCurrentSession();

    if (currentSession != null) {
      if (currentSession.isExpired) {
        SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
          Routes.authScreen(context: context);
        });
      } else {
        SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
          Routes.mainViewScreen(context: context);
        });
      }
    } else {
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        Routes.authScreen(context: context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Ringo Media Task",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
            SizedBox(
              height: 30,
            ),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
