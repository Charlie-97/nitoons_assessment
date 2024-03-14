import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:nitoons_assessment/constants/app_textstyles.dart';
import 'package:nitoons_assessment/constants/assets_name.dart';
import 'package:nitoons_assessment/constants/app_colors.dart';
import 'package:nitoons_assessment/data/dummy_data.dart';
import 'package:nitoons_assessment/widgets/icon_action_buttons.dart';
import 'package:nitoons_assessment/widgets/posts_caption.dart';
import 'package:nitoons_assessment/widgets/profile_icon.dart';
import 'package:video_player/video_player.dart';

class PostView extends ConsumerStatefulWidget {
  final int pageIndex;
  const PostView({
    super.key,
    required this.pageIndex,
  });

  @override
  ConsumerState<PostView> createState() => _PostViewState();
}

class _PostViewState extends ConsumerState<PostView> {
  late VideoPlayerController _controller;
  late bool isPlaying;

  @override
  void initState() {
    _controller =
        VideoPlayerController.asset(dummyData[widget.pageIndex].videoPost);
    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));

    _controller.play();
    isPlaying = true;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            if (isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }

            isPlaying = !isPlaying;
          },
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    VideoPlayer(_controller),
                    Positioned(
                        bottom: 17,
                        left: 12,
                        right: 12,
                        child: Container(
                          padding: EdgeInsets.zero,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: VideoProgressIndicator(
                            _controller,
                            allowScrubbing: true,
                            colors: const VideoProgressColors(
                              playedColor: AppColors.white,
                              backgroundColor: Color.fromARGB(1, 217, 217, 217),
                            ),
                          ),
                        )),
                  ],
                )),
          ),
        ),
        Positioned(
          right: 6,
          bottom: 25,
          child: SizedBox(
            width: 43,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ProfileIcon(
                  posterAvatar: dummyData[widget.pageIndex].posterAvatar,
                  index: widget.pageIndex,
                ),
                const Gap(24),
                IconActionButtons(
                  icon: likeIcon,
                  actionCount: dummyData[widget.pageIndex].likesCount,
                  onPressed: () {},
                ),
                const Gap(24),
                IconActionButtons(
                  icon: commentIcon,
                  actionCount: dummyData[widget.pageIndex].commentsCount,
                  onPressed: () {},
                ),
                const Gap(24),
                IconActionButtons(
                  icon: shareIcon,
                  actionCount: dummyData[widget.pageIndex].shareCount,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 24,
          child: SizedBox(
            width: 270,
            child: ListTile(
              title: Text(dummyData[widget.pageIndex].userName,
                  style: AppTextStyles.posterNameText),
              subtitle: PostCaption(
                text: dummyData[widget.pageIndex].caption,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
