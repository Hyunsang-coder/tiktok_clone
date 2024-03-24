import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/features/authentication/log_in_screen.dart';
import 'package:tiktok_clone/features/authentication/user_name_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/auth_buttons.dart';

import '../../constants/sizes.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void onLogInTap(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => const LogInScreen()));
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
                "Sing up for TickTok",
                style: TextStyle(
                    fontSize: Sizes.size24, fontWeight: FontWeight.w700),
              ),
              Gaps.v20,
              const Text(
                'Create a profile, follow other accounts, make your own videos, and more.',
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
            const Text('Already have an account?'),
            Gaps.h5,
            GestureDetector(
              onTap: () => onLogInTap(context),
              child: Text(
                'Log in',
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
