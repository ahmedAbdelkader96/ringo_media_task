import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/authentication/widgets/auth_custom_button.dart';
import 'package:task/global/methods_helpers_functions/toast.dart';
import 'package:task/global/navigation_routes/routes.dart';

import '../bloc/auth_bloc.dart';

class SignWithGoogleButton extends StatelessWidget {
  const SignWithGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) async {
        if (state is ErrorToSignInGoogleState) {
          ToastClass.toast(context: context, data: state.message, seconds: 3);
          log(state.message);
        }

        if (state is DoneToSignInGoogleState) {
          ToastClass.toast(
              context: context,
              data: "Account verified successfully",
              seconds: 3);
          Routes.mainViewScreen(context: context);
        }
      },
      builder: (context, state) {
        return AuthCustomButton(
          onPressed: () {
            if (state is LoadingToSignInGoogleState) {
            } else {
              context.read<AuthenticationBloc>().add(SignInGoogle());
            }
          },
          imagePath: 'assets/images/google_colored.svg',
          title: 'Continue with Google',
          isLoading: state is LoadingToSignInGoogleState

        );
      },
    );
  }
}
