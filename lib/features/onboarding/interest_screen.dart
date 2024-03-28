import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/features/onboarding/widget/interest_button.dart';

import '../../constants/sizes.dart';
import 'tutorial_screen.dart';

const interests = [
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
];

class InterestScreen extends StatefulWidget {
  const InterestScreen({super.key});

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  final ScrollController _scrollController = ScrollController();

  bool _showTitle = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      //print(_scrollController.offset);
      setState(() {
        if (_scrollController.offset > 100) {
          if (_showTitle) return;
          _showTitle = true;
        } else {
          if (!_showTitle) return;
          _showTitle = false;
        }
      });
    });
  }

  _onTap() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => const TutorialScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedOpacity(
            opacity: _showTitle ? 1 : 0,
            duration: const Duration(milliseconds: 300),
            child: const Text("Choose your interests")),
      ),
      body: Scrollbar(
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.only(
                left: Sizes.size24, right: Sizes.size24, bottom: Sizes.size16),
            child: Column(
              children: [
                Gaps.v32,
                const Text(
                  "Choose your intersets",
                  style: TextStyle(
                      fontSize: Sizes.size40, fontWeight: FontWeight.bold),
                ),
                Gaps.v20,
                const Text(
                  "Get better video recommendations.",
                  style: TextStyle(fontSize: Sizes.size20),
                ),
                Gaps.v48,
                Wrap(
                  runSpacing: 15,
                  spacing: 15,
                  children: [
                    ...interests.map((e) => InterestButton(text: e.toString())),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 2,
        child: GestureDetector(
          onTap: _onTap,
          child: Padding(
            padding: const EdgeInsets.only(
                bottom: Sizes.size40,
                top: Sizes.size16,
                left: Sizes.size24,
                right: Sizes.size24),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: Sizes.size18),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: const Text(
                "Next",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: Sizes.size16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
