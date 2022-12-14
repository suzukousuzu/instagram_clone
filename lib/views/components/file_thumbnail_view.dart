import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/state/image_upload/providers/thumnail_providers.dart';
import 'package:instagram_clone/views/components/animations/loading_animation_view.dart';
import 'package:instagram_clone/views/components/animations/small_error_animation_view.dart';

import '../../state/image_upload/model/thumbnail_request.dart';

class FileThumbnailView extends ConsumerWidget {
  const FileThumbnailView({
    Key? key,
    required this.thumbnailRequest,
  }) : super(key: key);

  final ThumbnailRequest thumbnailRequest;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final thumbnail = ref.watch(thumbnailProvider(thumbnailRequest));
    return thumbnail.when(
      data: (imageWithAspectRatio) {
        return AspectRatio(
          aspectRatio: imageWithAspectRatio.aspectRatio,
          child: imageWithAspectRatio.image,
        );
      },
      error: (error, stackTrace) {
        return const SmallErrorAnimationView();
      },
      loading: () {
        return const LoadingAnimationView();
      },
    );
  }
}
