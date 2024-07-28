import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:task/features/authentication/controller/controller.dart';
import 'package:task/features/authentication/models/user_model.dart';
import 'package:task/global/methods_helpers_functions/handle_errors.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthController authController;

  static AuthenticationBloc get(BuildContext context) {
    return BlocProvider.of(context);
  }

  AuthenticationBloc(this.authController)
      : super(AuthenticationInitialState()) {
    on<SignUpEmailPasswordAndCreateAccount>((event, emit) async {
      try {
        emit(LoadingToSignUpEmailPasswordAndCreateAccountState());

        AuthResponse res = await authController.signUpWithEmailAndPassword(
            email: event.userModel.email.toString(), password: event.password,
        username: event.userModel.name);
        final User? user = res.user;
        if (user != null) {
          final userId = user.id;
          final finalUserModel = UserModel(
              userId: userId,
              createdAt: event.userModel.createdAt,
              name: event.userModel.name,
              jobTitle: event.userModel.jobTitle,
              phone: event.userModel.phone,
              email: event.userModel.email);


          await authController.createAccount(userModel: finalUserModel);
        }

        emit(DoneToSignUpEmailPasswordAndCreateAccountState());


      } on PostgrestException catch (error) {
        PostgrestException message =
        await HandleErrors.handlePostgresException(error: error);
        emit(ErrorToSignUpEmailPasswordAndCreateAccountState(
            message: message.message));
      } catch (error) {
        String message =
        await HandleErrors.handleGeneralException(error: error);
        emit(ErrorToSignUpEmailPasswordAndCreateAccountState(message: message));
      }
    });

    on<SignInEmailPassword>((event, emit) async {
      try {
        emit(LoadingToSignInEmailPasswordState());

         await authController.signInWithEmailAndPassword(
            email: event.email.toString(), password: event.password.toString());
        emit(DoneToSignInEmailPasswordState());

      } on PostgrestException catch (error) {
        PostgrestException message =
        await HandleErrors.handlePostgresException(error: error);
        emit(ErrorToSignInEmailPasswordState(message: message.message));
      } catch (error) {
        String message =
        await HandleErrors.handleGeneralException(error: error);
        emit(ErrorToSignInEmailPasswordState(message: message));
      }
    });

    on<SignInGoogle>((event, emit) async {
      try {
        emit(LoadingToSignInGoogleState());


        GoogleSignInAccount? googleUser = await authController
            .fetchGoogleSignInAccount();
        AuthResponse? res = await authController.signWithGoogleAccount(
            googleUser: googleUser!);
        final User? user = res.user;
        final userId = user!.id;


        bool isAddedBefore =
        await authController.checkIfUserAddedBefore(userId: userId);

        if (!isAddedBefore) {
          final userModel = UserModel(
              userId: userId,
              createdAt: DateTime.now(),
              name: googleUser.displayName.toString(),
              jobTitle: "",
              phone: "",
              email: googleUser.email.toString());
          await authController.createAccount(userModel: userModel);
        }

        emit(DoneToSignInGoogleState());
      } on PostgrestException catch (error) {
        PostgrestException message =
        await HandleErrors.handlePostgresException(error: error);
        emit(ErrorToSignInGoogleState(message: message.message));
      } catch (error) {
        String message =
        await HandleErrors.handleGeneralException(error: error);
        emit(ErrorToSignInGoogleState(message: message));
      }
    });



  }
}
