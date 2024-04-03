import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/videos/widgets/video_post.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  int _itemCount = 4;
  final PageController _controller = PageController();
  final Duration _duration = const Duration(milliseconds: 250);
  final Curve _curve = Curves.linear;

  void _onPageChanged(int page) {
    _controller.animateToPage(page, duration: _duration, curve: _curve);

    if (page == _itemCount - 1) {
      _itemCount = _itemCount + 4;
      setState(() {});
    }
  }

  void _onVideoFinished() {
    _controller.nextPage(duration: _duration, curve: _curve);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        scrollDirection: Axis.vertical,
        controller: _controller,
        onPageChanged: _onPageChanged,
        itemCount: _itemCount,
        itemBuilder: (context, index) => VideoPost(
              onVideoFinished: _onVideoFinished,
              index: index,
            ));
  }
}
