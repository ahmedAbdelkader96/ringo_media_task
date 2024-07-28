import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:task/features/authentication/models/user_model.dart';
import 'package:task/features/main_view/repository/irepository.dart';
import 'package:task/global/methods_helpers_functions/constants.dart';

class MainViewRepository implements IMainViewRepository {
  final supabase = Supabase.instance.client;

  @override
  Future<User?> fetchCurrentUser() async {
    final User? user = supabase.auth.currentUser;
    if (user != null) {
      return user;
    }
    return null;
  }

  @override
  Future<UserModel> fetchCurrentUserData({required String userId}) async {
    final data = await supabase
        .from(Constants.usersTable)
        .select('*')
        .eq(Constants.userIdColumn, userId);

    return data.map((item) => UserModel.fromJson(item)).toList()[0];
  }
}
