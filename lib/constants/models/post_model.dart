// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Post {
  final int id;
  final String userName;
  final String caption;
  final int likesCount;
  final int commentsCount;
  final int shareCount;
  final bool isLiked;
  final bool followsPoster;
  final String videoPost;
  final String posterAvatar;

  const Post({
    required this.id,
    required this.userName,
    required this.caption,
    required this.likesCount,
    required this.commentsCount,
    required this.shareCount,
    this.isLiked = false,
    this.followsPoster = false,
    required this.videoPost,
    required this.posterAvatar,
  });

  Post copyWith({
    int? id,
    String? userName,
    String? caption,
    int? likesCount,
    int? commentsCount,
    int? shareCount,
    bool? isLiked,
    bool? followsPoster,
    String? videoPost,
    String? posterAvatar,
  }) {
    return Post(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      caption: caption ?? this.caption,
      likesCount: likesCount ?? this.likesCount,
      commentsCount: commentsCount ?? this.commentsCount,
      shareCount: shareCount ?? this.shareCount,
      isLiked: isLiked ?? this.isLiked,
      followsPoster: followsPoster ?? this.followsPoster,
      videoPost: videoPost ?? this.videoPost,
      posterAvatar: posterAvatar ?? this.posterAvatar,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userName': userName,
      'caption': caption,
      'likesCount': likesCount,
      'commentsCount': commentsCount,
      'shareCount': shareCount,
      'isLiked': isLiked,
      'followsPoster': followsPoster,
      'videoPost': videoPost,
      'posterAvatar': posterAvatar,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'] as int,
      userName: map['userName'] as String,
      caption: map['caption'] as String,
      likesCount: map['likesCount'] as int,
      commentsCount: map['commentsCount'] as int,
      shareCount: map['shareCount'] as int,
      isLiked: map['isLiked'] as bool,
      followsPoster: map['followsPoster'] as bool,
      videoPost: map['videoPost'] as String,
      posterAvatar: map['posterAvatar'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) =>
      Post.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Post(id: $id, userName: $userName, caption: $caption, likesCount: $likesCount, commentsCount: $commentsCount, shareCount: $shareCount, isLiked: $isLiked, followsPoster: $followsPoster, videoPost: $videoPost, posterAvatar: $posterAvatar)';
  }

  @override
  bool operator ==(covariant Post other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.userName == userName &&
        other.caption == caption &&
        other.likesCount == likesCount &&
        other.commentsCount == commentsCount &&
        other.shareCount == shareCount &&
        other.isLiked == isLiked &&
        other.followsPoster == followsPoster &&
        other.videoPost == videoPost &&
        other.posterAvatar == posterAvatar;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userName.hashCode ^
        caption.hashCode ^
        likesCount.hashCode ^
        commentsCount.hashCode ^
        shareCount.hashCode ^
        isLiked.hashCode ^
        followsPoster.hashCode ^
        videoPost.hashCode ^
        posterAvatar.hashCode;
  }
}
