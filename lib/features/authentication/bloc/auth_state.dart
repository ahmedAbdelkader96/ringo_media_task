part of 'auth_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
}

// crud states for all users
class AuthenticationInitialState extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class LoadingToSignUpEmailPasswordAndCreateAccountState extends AuthenticationState {
  @override
  List<Object> get props => [];
}
class DoneToSignUpEmailPasswordAndCreateAccountState extends AuthenticationState {

  @override
  List<Object> get props => [];
}
class ErrorToSignUpEmailPasswordAndCreateAccountState extends AuthenticationState {
  final String message;

  const ErrorToSignUpEmailPasswordAndCreateAccountState({required this.message});

  @override
  List<Object> get props => [];
}




class LoadingToSignInEmailPasswordState extends AuthenticationState {
  @override
  List<Object> get props => [];
}
class DoneToSignInEmailPasswordState extends AuthenticationState {

  @override
  List<Object> get props => [];
}
class ErrorToSignInEmailPasswordState extends AuthenticationState {
  final String message;

  const ErrorToSignInEmailPasswordState({required this.message});

  @override
  List<Object> get props => [];
}




class LoadingToSignInGoogleState extends AuthenticationState {
  @override
  List<Object> get props => [];
}
class DoneToSignInGoogleState extends AuthenticationState {

  @override
  List<Object> get props => [];
}
class ErrorToSignInGoogleState extends AuthenticationState {
  final String message;

  const ErrorToSignInGoogleState({required this.message});

  @override
  List<Object> get props => [];
}











