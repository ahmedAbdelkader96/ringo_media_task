import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/authentication/bloc/auth_bloc.dart';
import 'package:task/features/authentication/controller/controller.dart';
import 'package:task/features/lookups/blocs/countries_lookups/countries_lookups_bloc.dart';
import 'package:task/features/lookups/controller/lookups_controller.dart';
import 'package:task/features/main_view/bloc/main_view_bloc.dart';
import 'package:task/features/main_view/controller/controller.dart';
import 'package:task/features/menu/bloc/profile_bloc.dart';
import 'package:task/features/menu/controller/controller.dart';

class BlocProviders {
  static final List<BlocProvider> providers = [
    BlocProvider<CountriesLookupsBloc>(
        create: (_) => CountriesLookupsBloc(LookupsController())),
    BlocProvider<AuthenticationBloc>(
        create: (_) => AuthenticationBloc(AuthController())),
    BlocProvider<MainViewBloc>(
        create: (_) => MainViewBloc(MainViewController())),
    BlocProvider<ProfileBloc>(create: (_) => ProfileBloc(ProfileController())),
  ];
}
