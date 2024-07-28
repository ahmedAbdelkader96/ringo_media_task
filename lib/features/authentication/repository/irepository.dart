import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:task/features/authentication/models/user_model.dart';

abstract class IAuthRepository {
  Future<AuthResponse> signUpWithEmailAndPassword(
      {required String email,
      required String password,
      required String username});

  Future<AuthResponse> signInWithEmailAndPassword(
      {required String email, required String password});

  Future<UserModel> createAccount({required UserModel userModel});

  Future<bool> checkIfUserAddedBefore({required String userId});

  Future<GoogleSignInAccount?> fetchGoogleSignInAccount();

  Future<AuthResponse> signWithGoogleAccount(
      {required GoogleSignInAccount googleUser});

  Future<void> sendOTP({required String phone});

  Future<AuthResponse> verifyOTP({required String phone, required String otp});


  Future<Session?> getCurrentSession();
}
