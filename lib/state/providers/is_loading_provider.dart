import 'package:instagram_clone/state/image_upload/providers/image_uploader_provider.dart';
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
  final isUploadingImage = ref.watch(imageUploaderProvider);
  return authState.isLoading || isUploadingImage;
});
