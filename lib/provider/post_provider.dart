import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nitoons_assessment/constants/models/post_model.dart';

class PostStateNotifier extends StateNotifier<Post> {
  PostStateNotifier()
      : super(
          const Post(
            id: 0,
            posterAvatar: '',
            videoPost: '',
            userName: '',
            caption: '',
            likesCount: 0,
            commentsCount: 0,
            shareCount: 0,
          ),
        );

  void likePost() {
    if (state.isLiked) {
      state = state.copyWith(
        likesCount: state.likesCount - 1,
        isLiked: !state.isLiked,
      );
    } else {
      state = state.copyWith(
        isLiked: !state.isLiked,
        likesCount: state.likesCount + 1,
      );
    }
  }

  void sharePost() {
    state = state.copyWith(
      shareCount: state.shareCount + 1,
    );
  }

  void addComment() {
    state = state.copyWith(
      commentsCount: state.commentsCount + 1,
    );
  }

  void followPoster() {
    state = state.copyWith(
      followsPoster: !state.followsPoster,
    );
  }
}
