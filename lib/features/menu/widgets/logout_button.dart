import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task/features/menu/widgets/general_profile_button.dart';
import 'package:task/global/methods_helpers_functions/toast.dart';

import '../bloc/profile_bloc.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is ErrorToSignOutState) {
          ToastClass.toast(
              context: context, data: state.message, seconds: 3);
          debugPrint(state.message);
        }

        if (state is DoneToSignOutState) {

          ToastClass.toast(context: context, data: "Signed Out successfully", seconds: 3);
        }
      },
      builder: (context, state) {
        return
          GeneralProfileButton(
              onPressed: (){
                context.read<ProfileBloc>().add(SignOut(context: context));

              },
              title: "LogOut",
              isLoading: state is LoadingToSignOutState,
              child: SvgPicture.asset('assets/images/logout.svg') );
      },
    );
  }
}
