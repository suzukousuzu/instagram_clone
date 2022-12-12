import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../auth/providers/auth_state_provider.dart';
//
// part 'is_loading_provider.g.dart';
//
// @riverpod
// bool isLoading(IsLoadingRef ref) {
//   final authState = ref.watch(authStateProvider);
//
//   return authState.isLoading;
// }

final isLoadingProvider = Provider<bool>((ref) {
  final authState = ref.watch(authStateProvider);
  return authState.isLoading;
});
