import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

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
  final VideoPlayerController _videoController =
      VideoPlayerController.asset('assets/videos/subway.mp4');

  late final AnimationController _animationController;

  bool isPaused = false;

  final Duration _animationDuration = const Duration(milliseconds: 200);

  _initVideoPlayer() async {
    await _videoController.initialize();

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

  @override
  void initState() {
    super.initState();
    _initVideoPlayer();

    _animationController = AnimationController(
      vsync: this,
      lowerBound: 1.0,
      upperBound: 1.5,
      value: 1.5,
      duration: _animationDuration,
    );
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    //print("Screen ${widget.index} ==> ${info.visibleFraction}");
    if (info.visibleFraction == 1 && !_videoController.value.isPlaying) {
      _videoController.play();
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
          Transform.scale(
            scale: _animationController.value,
            child: AnimatedOpacity(
              opacity: isPaused ? 1 : 0,
              duration: _animationDuration,
              child: const Center(
                  child: IgnorePointer(
                child: Icon(FontAwesomeIcons.play,
                    size: Sizes.size52, color: Colors.white),
              )),
            ),
          )
        ],
      ),
    );
  }
}
