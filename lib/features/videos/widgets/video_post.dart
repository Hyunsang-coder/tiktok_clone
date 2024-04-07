import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/features/videos/widgets/video_button.dart';
import 'package:tiktok_clone/features/videos/widgets/video_comments.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../constants/gaps.dart';
import '../../../constants/sizes.dart';

class VideoPost extends StatefulWidget {
  final Function onVideoFinished;
  final int index;

  const VideoPost(
      {super.key, required this.onVideoFinished, required this.index});

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost> with TickerProviderStateMixin {
  late final VideoPlayerController _videoController;

  late final AnimationController _animationController;

  bool isPaused = false;

  final Duration _animationDuration = const Duration(milliseconds: 200);
  bool seeMore = false;

  _initVideoPlayer() async {
    _videoController = VideoPlayerController.asset('assets/videos/subway.mp4');
    await _videoController.initialize();
    await _videoController.setLooping(true);

    setState(() {
      _videoController.addListener(_onVideoEnded);
    });
  }

  void _onVideoEnded() {
    if (_videoController.value.isInitialized &&
        _videoController.value.duration == _videoController.value.position) {
      widget.onVideoFinished();
    }
  }

  void _initAnimationController() {
    _animationController = AnimationController(
      vsync: this,
      lowerBound: 1.0,
      upperBound: 1.5,
      value: 1.5,
      duration: _animationDuration,
    );
  }

  @override
  void initState() {
    super.initState();
    _initVideoPlayer();
    _initAnimationController();
  }

  @override
  void dispose() {
    _videoController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction == 1 &&
        !isPaused &&
        !_videoController.value.isPlaying) {
      _videoController.play();
    }

    if (_videoController.value.isPlaying && info.visibleFraction == 0) {
      _onTogglePause();
    }
  }

  void _onTogglePause() {
    if (_videoController.value.isPlaying) {
      _videoController.pause();
      _animationController.reverse();
    } else {
      _videoController.play();
      _animationController.forward();
    }

    setState(() {
      isPaused = !isPaused;
    });
  }

  void _onTapComments(BuildContext context) async {
    if (_videoController.value.isPlaying) {
      _onTogglePause();
    }
    await showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => const VideoComments());

    _onTogglePause();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key("${widget.index}"),
      onVisibilityChanged: _onVisibilityChanged,
      child: Stack(
        children: [
          Positioned.fill(
            child: _videoController.value.isInitialized
                ? VideoPlayer(_videoController)
                : Container(
                    color: Colors.black,
                  ),
          ),
          Positioned.fill(
              child: GestureDetector(
            onTap: _onTogglePause,
          )),
          Positioned.fill(
            child: IgnorePointer(
              child: Center(
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _animationController.value,
                      child: child,
                    );
                  },
                  child: AnimatedOpacity(
                    opacity: isPaused ? 1 : 0,
                    duration: _animationDuration,
                    child: const Icon(FontAwesomeIcons.play,
                        size: Sizes.size52, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "@현상",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gaps.v10,
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Text(
                        "Scene from the subway to work:) Isn't it beautiful?",
                        overflow: seeMore
                            ? TextOverflow.visible
                            : TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: Sizes.size14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    if (!seeMore)
                      TextButton(
                        onPressed: () {
                          seeMore = !seeMore;
                          setState(() {});
                        },
                        child: const Text("See more",
                            style: TextStyle(
                              fontSize: Sizes.size14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            right: 10,
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  // foregroundImage: NetworkImage(
                  //   "https://avatars.githubusercontent.com/u/3612017",
                  // ),
                  child: Text("니꼬"),
                ),
                Gaps.v24,
                const VideoButton(
                  icon: FontAwesomeIcons.solidHeart,
                  text: "2.9M",
                ),
                Gaps.v24,
                GestureDetector(
                  onTap: () => _onTapComments(context),
                  child: const VideoButton(
                    icon: FontAwesomeIcons.solidComment,
                    text: "33K",
                  ),
                ),
                Gaps.v24,
                const VideoButton(
                  icon: FontAwesomeIcons.share,
                  text: "Share",
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
