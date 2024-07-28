import 'package:task/features/menu/repository/repository.dart';

class ProfileController {
  final repo = ProfileRepository();

   Future<void> signOut() {
    return repo.signOut();
  }
}
