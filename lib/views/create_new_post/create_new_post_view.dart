import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/views/constants/strings.dart';

import '../../state/auth/providers/user_id_provider.dart';
import '../../state/image_upload/model/file_type.dart';
import '../../state/image_upload/model/thumbnail_request.dart';
import '../../state/image_upload/providers/image_uploader_provider.dart';
import '../../state/post_setting/models/post_setting.dart';
import '../../state/post_setting/providers/post_settings_provider.dart';
import '../components/file_thumbnail_view.dart';

class CreateNewPostView extends HookConsumerWidget {
  const CreateNewPostView({
    Key? key,
    required this.fileToPost,
    required this.fileType,
  }) : super(key: key);

  final File fileToPost;
  final FileType fileType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final thumbnailRequest = ThumbnailRequest(
      file: fileToPost,
      fileType: fileType,
    );
    final postSettings = ref.watch(postSettingProvider);
    final postController = useTextEditingController();
    final isPostButtonEnabled = useState(false);
    final isMounted = useIsMounted();

    //textFieldのonChangedに書いても可
    useEffect(() {
      void listener() {
        isPostButtonEnabled.value = postController.text.isNotEmpty;
      }

      postController.addListener(listener);
      return () {
        postController.removeListener(listener);
      };
    }, [postController]);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          Strings.createNewPost,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: isPostButtonEnabled.value
                ? () async {
                    // get the user id first
                    final userId = ref.read(userIdProvider);
                    if (userId == null) {
                      return;
                    }
                    final message = postController.text;
                    final isUploaded =
                        await ref.read(imageUploaderProvider.notifier).upload(
                              file: fileToPost,
                              fileType: fileType,
                              message: message,
                              postSettings: postSettings,
                              userId: userId,
                            );
                    if (isUploaded) {
                      Navigator.of(context).pop();
                    }
                  }
                : null,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // thumbnail
            FileThumbnailView(
              thumbnailRequest: thumbnailRequest,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: Strings.pleaseWriteYourMessageHere,
                ),
                autofocus: true,
                maxLines: null,
                controller: postController,
              ),
            ),
            ...PostSetting.values.map(
              (postSetting) => ListTile(
                title: Text(postSetting.title),
                subtitle: Text(postSetting.description),
                trailing: Switch(
                  value: postSettings[postSetting] ?? false,
                  onChanged: (isOn) {
                    ref.read(postSettingProvider.notifier).setSetting(
                          postSetting,
                          isOn,
                        );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
