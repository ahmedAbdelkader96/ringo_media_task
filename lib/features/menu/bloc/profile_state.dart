part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

// crud states for all users
class ProfileInitialState extends ProfileState {
  @override
  List<Object> get props => [];
}

class LoadingToSignOutState extends ProfileState {
  @override
  List<Object> get props => [];
}
class DoneToSignOutState extends ProfileState {
  @override
  List<Object> get props => [];
}
class ErrorToSignOutState extends ProfileState {
  final String message;

  const ErrorToSignOutState({required this.message});

  @override
  List<Object> get props => [];
}
