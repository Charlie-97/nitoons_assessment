import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nitoons_assessment/constants/assets_name.dart';
import 'package:nitoons_assessment/main.dart';

class ProfileIcon extends ConsumerStatefulWidget {
  final String posterAvatar;
  final int index;
  const ProfileIcon(
      {super.key, required this.posterAvatar, required this.index, });

  @override
  ConsumerState<ProfileIcon> createState() => _ProfileIconState();
}

class _ProfileIconState extends ConsumerState<ProfileIcon> {
  @override
  Widget build(BuildContext context) {
    final postState = ref.watch(postStateProvider(widget.index));
    return SizedBox(
      height: 53,
      child: Stack(
        children: [
          CircleAvatar(
            radius: 21.5,
            backgroundImage: AssetImage(widget.posterAvatar),
          ),
          if (!postState.followsPoster)
            Positioned(
              bottom: 0,
              left: 11.95,
              child: GestureDetector(
                onTap: () {
                  ref.read(postStateProvider(widget.index).notifier).followPoster();
                },
                child: SvgPicture.asset(
                  subscribeIcon,
                  width: 20,
                  height: 20,
                ),
              ),
            )
        ],
      ),
    );
  }
}
