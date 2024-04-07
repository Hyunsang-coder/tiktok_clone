import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/gaps.dart';
import '../../../constants/sizes.dart';

class VideoComments extends StatefulWidget {
  const VideoComments({super.key});

  @override
  State<VideoComments> createState() => _VideoCommentsState();
}

class _VideoCommentsState extends State<VideoComments> {
  bool _isWriting = false;
  final ScrollController _scrollController = ScrollController();

  _onTapCloseIcon() {
    Navigator.of(context).pop();
  }

  void _onEndWriting() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isWriting = false;
    });
  }

  void _onStartWriting() {
    setState(() {
      _isWriting = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.75,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size10),
      ),
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade50,
          automaticallyImplyLeading: false,
          title: const Text("comments"),
          actions: [
            IconButton(
                onPressed: _onTapCloseIcon,
                icon: const Icon(FontAwesomeIcons.xmark)),
          ],
        ),
        body: GestureDetector(
          onTap: _onEndWriting,
          child: Stack(children: [
            Scrollbar(
              controller: _scrollController,
              child: ListView.separated(
                controller: _scrollController,
                padding: const EdgeInsets.only(
                    top: 10, bottom: 100, left: 16, right: 16),
                itemCount: 10,
                separatorBuilder: (_, index) => Gaps.v20,
                itemBuilder: (_, index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 18,
                        child: Text('현상'),
                      ),
                      Gaps.h10,
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "현상",
                              style: TextStyle(
                                  fontSize: Sizes.size14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            Gaps.v3,
                            Text("I am on the flight to Spain. So excited!!!"),
                          ],
                        ),
                      ),
                      Gaps.h10,
                      Column(
                        children: [
                          const Icon(
                            FontAwesomeIcons.heart,
                            size: Sizes.size20,
                          ),
                          Gaps.v4,
                          Text(
                            "55.5k",
                            style: TextStyle(color: Colors.grey.shade500),
                          ),
                        ],
                      )
                    ],
                  );
                },
              ),
            ),
            Positioned(
              bottom: 0,
              width: size.width,
              child: BottomAppBar(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size16, vertical: Sizes.size10),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.grey.shade500,
                        foregroundColor: Colors.white,
                        child: const Text('현상'),
                      ),
                      Gaps.h10,
                      Expanded(
                        child: SizedBox(
                          height: Sizes.size40,
                          child: TextField(
                            onTap: _onStartWriting,
                            expands: true,
                            textInputAction: TextInputAction.newline,
                            minLines: null,
                            maxLines: null,
                            cursorColor: Theme.of(context).primaryColor,
                            decoration: InputDecoration(
                              hintText: "Write a comment.",
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(Sizes.size12),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.grey.shade200,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: Sizes.size10,
                              ),
                              suffixIcon: Padding(
                                padding:
                                    const EdgeInsets.only(right: Sizes.size12),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.at,
                                      color: Colors.grey.shade900,
                                      size: Sizes.size18,
                                    ),
                                    Gaps.h10,
                                    Icon(
                                      FontAwesomeIcons.gift,
                                      color: Colors.grey.shade900,
                                      size: Sizes.size18,
                                    ),
                                    Gaps.h10,
                                    Icon(
                                      FontAwesomeIcons.faceSmile,
                                      color: Colors.grey.shade900,
                                      size: Sizes.size18,
                                    ),
                                    Gaps.h10,
                                    if (_isWriting)
                                      GestureDetector(
                                        onTap: _onEndWriting,
                                        child: Icon(
                                          FontAwesomeIcons.circleArrowUp,
                                          color: Theme.of(context).primaryColor,
                                          size: Sizes.size18,
                                        ),
                                      )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
