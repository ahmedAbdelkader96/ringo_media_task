

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:task/features/authentication/models/user_model.dart';

abstract class IMainViewRepository {

  Future<User?> fetchCurrentUser();
  Future<UserModel> fetchCurrentUserData({required String userId});
}
