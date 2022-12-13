import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/state/auth/providers/user_id_provider.dart';
import 'package:instagram_clone/state/posts/models/post_key.dart';

import '../../constants/firebase_collection_name.dart';
import '../models/post.dart';

final userPostsProvider = StreamProvider.autoDispose<Iterable<Post>>(
  (ref) {
    final userId = ref.watch(userIdProvider);

    final controller = StreamController<Iterable<Post>>();

    controller.onListen = () {
      controller.sink.add([]);
    };

    final sub = FirebaseFirestore.instance
        .collection(
          FirebaseCollectionName.posts,
        )
        .where(PostKey.userId, isEqualTo: userId)
        .snapshots()
        .listen(
      (snapshot) {
        final documents = snapshot.docs;
        final posts = documents
            //metadata.hasPendingWrites = バックエンドにまだ書き込まれていないローカルの変更がドキュメントに存在するかどうか
            .where((doc) => !doc.metadata.hasPendingWrites)
            .map(
          (doc) {
            //fromJsonまたはfromMap使えば一発
            return Post(postId: doc.id, json: doc.data());
          },
        ).toList();
        controller.add(posts);
      },
    );

    ref.onDispose(() {
      sub.cancel();
      controller.close();
    });
    return controller.stream;
  },
);
