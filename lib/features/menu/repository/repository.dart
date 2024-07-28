import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:task/features/menu/repository/irepository.dart';

class ProfileRepository implements IProfileRepository {
  final supabase = Supabase.instance.client;

  @override
  Future<void> signOut() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    if (await googleSignIn.isSignedIn()) {
      await googleSignIn.signOut();
    }
    await supabase.auth.signOut();
  }
}
