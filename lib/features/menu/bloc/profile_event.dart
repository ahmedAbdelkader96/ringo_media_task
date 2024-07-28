part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}


class SignOut extends ProfileEvent {
  final BuildContext context;

  const SignOut({required this.context});


  @override
  List<Object?> get props => [];
}

