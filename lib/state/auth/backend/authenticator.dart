import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/state/auth/constants/constant.dart';

import '../../posts/typedefs/user_id.dart';
import '../models/auth_result.dart';

//backendのproviderを作成しても良い？
final authenticatorProvider = Provider((_) => const Authenticator());

class Authenticator {
  const Authenticator();
  bool get isAlreadyLoggedIn => userId != null;
  UserId? get userId => FirebaseAuth.instance.currentUser?.uid;

  String get displayName =>
      FirebaseAuth.instance.currentUser?.displayName ?? '';
  String? get email => FirebaseAuth.instance.currentUser?.email;

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    await FacebookAuth.instance.logOut();
  }

  Future<AuthResult> loginWithFacebook() async {
    final loginResult = await FacebookAuth.instance.login();
    final token = loginResult.accessToken?.token;
    if (token == null) {
      return AuthResult.aborted;
    }
    final oauthCredentials = FacebookAuthProvider.credential(token);

    try {
      //認証情報を使ってFirebaseに非同期にサインインし、追加のIDプロバイダデータを返す
      await FirebaseAuth.instance.signInWithCredential(oauthCredentials);
      return AuthResult.success;
    } on FirebaseAuthException catch (e) {
      final email = e.email;
      final credential = e.credential;
      //account-exists-with-different-credential(クレデンシャルによってアサートされた電子メールアドレスを持つアカウントがすでに存在する場合にスローされます。)
      if (e.code == Constants.accountExistsWithDifferentCredential &&
          email != null &&
          credential != null) {
        //指定されたユーザのサインインに使用できるサインインメソッドのリストを返す
        //複数の認証メカニズムをサポートしている場合、Eメールファーストの認証フローを実装する場合に便利
        final providers =
            await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
        if (providers.contains(Constants.googleCom)) {
          await loginWithGoogle();
          FirebaseAuth.instance.currentUser?.linkWithCredential(credential);
        }
        return AuthResult.success;
      }
      return AuthResult.failure;
    }
  }

  Future<AuthResult> loginWithGoogle() async {
    final googleSignIn = GoogleSignIn(scopes: [Constants.emailScope]);
    final signInAccount = await googleSignIn.signIn();
    if (signInAccount == null) {
      return AuthResult.aborted;
    }
    final googleAuth = await signInAccount.authentication;
    final oauthCredentials = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );
    try {
      await FirebaseAuth.instance.signInWithCredential(oauthCredentials);
      return AuthResult.success;
    } catch (e) {
      return AuthResult.failure;
    }
  }
}
