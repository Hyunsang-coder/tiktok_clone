import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/features/authentication/user_name_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/auth_buttons.dart';

import '../../constants/sizes.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  void onSignUpTap(BuildContext context) {
    Navigator.of(context).pop();
  }

  void onUserTap(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => const UserNameScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
          child: Column(
            children: [
              Gaps.v80,
              const Text(
                "Log in to TickTok",
                style: TextStyle(
                    fontSize: Sizes.size24, fontWeight: FontWeight.w700),
              ),
              Gaps.v20,
              const Text(
                'Manage your account, check notifications, comment on videos, and more.',
                style: TextStyle(
                  fontSize: Sizes.size14,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              Gaps.v40,
              AuthButton(
                  onTapFunction: () => onUserTap(context),
                  icon: const FaIcon(FontAwesomeIcons.user),
                  text: "Use phone / email / username"),
              Gaps.v14,
              AuthButton(
                  onTapFunction: () => onUserTap(context),
                  icon: const FaIcon(FontAwesomeIcons.apple),
                  text: "Continue with Apple"),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 2,
        color: Colors.grey.shade100,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: Sizes.size32),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text("Don't have an account?'"),
            Gaps.h5,
            GestureDetector(
              onTap: () => onSignUpTap(context),
              child: Text(
                'Sign up',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
