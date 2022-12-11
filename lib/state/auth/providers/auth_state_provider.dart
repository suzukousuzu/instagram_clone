import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/state/auth/models/auth_state_original.dart';
import 'package:instagram_clone/state/auth/notifiers/auth_state_notifier.dart';
import 'package:instagram_clone/state/user_info/backend/user_info_storage.dart';

import '../backend/authenticator.dart';

final authStateProvider =
    StateNotifierProvider<AuthStateNotifier, AuthStateOriginal>(
  (ref) => AuthStateNotifier(
    authenticator: ref.watch(authenticatorProvider),
    userInfoStorage: ref.watch(userInfoStorageProvider),
  ),
);
