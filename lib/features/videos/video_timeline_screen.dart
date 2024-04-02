import 'package:flutter/material.dart';

import '../../constants/sizes.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  int _itemCount = 4;
  final PageController _controller = PageController();

  List<Color> colors = [
    Colors.amber,
    Colors.blue,
    Colors.deepOrange,
    Colors.lightGreen,
  ];

  void _onPageChanged(int page) {
    _controller.animateToPage(page,
        duration: const Duration(milliseconds: 150), curve: Curves.linear);
    //print('OnPageChanged: $page');
    if (page == _itemCount - 1) {
      _itemCount = _itemCount + 4;
      colors.addAll([
        Colors.amber,
        Colors.blue,
        Colors.deepOrange,
        Colors.lightGreen,
      ]);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      controller: _controller,
      onPageChanged: _onPageChanged,
      itemCount: _itemCount,
      itemBuilder: (context, index) => Container(
        color: colors[index],
        child: Center(
          child: Text(
            "Screen $index",
            style: const TextStyle(fontSize: Sizes.size64),
          ),
        ),
      ),
    );
  }
}
