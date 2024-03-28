import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';

import '../../constants/sizes.dart';

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

class InterestScreen extends StatelessWidget {
  const InterestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose your interests"),
      ),
      body: SingleChildScrollView(
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
                "Get better video recommendations",
                style: TextStyle(fontSize: Sizes.size20),
              ),
              Gaps.v48,
              Wrap(
                runSpacing: 15,
                spacing: 15,
                children: [
                  ...interests.map((e) => Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: Sizes.size16, horizontal: Sizes.size24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(Sizes.size32),
                          border:
                              Border.all(color: Colors.black.withOpacity(0.1)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 5,
                                spreadRadius: 5)
                          ],
                        ),
                        child: Text(
                          e.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 2,
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
    );
  }
}
