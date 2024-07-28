import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:task/features/menu/controller/controller.dart';
import 'package:task/global/methods_helpers_functions/handle_errors.dart';
import 'package:task/global/navigation_routes/routes.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileController controller;

  static ProfileBloc get(BuildContext context) {
    return BlocProvider.of(context);
  }

  ProfileBloc(this.controller) : super(ProfileInitialState()) {
    on<SignOut>((event, emit) async {
      try {
        emit(LoadingToSignOutState());

        await controller.signOut().then((v){
          Routes.authScreen(context:  event.context);
        });


        emit(DoneToSignOutState());
      } on PostgrestException catch (error) {
        PostgrestException message =
            await HandleErrors.handlePostgresException(error: error);
        emit(ErrorToSignOutState(message: message.message));
      } catch (error) {
        String message =
            await HandleErrors.handleGeneralException(error: error);
        emit(ErrorToSignOutState(message: message));
      }
    });
  }
}
