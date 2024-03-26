import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/authentication/password_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';
import '../../constants/utils.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final TextEditingController _useremailController = TextEditingController();

  String _userEmail = "";

  @override
  void initState() {
    super.initState();

    _useremailController.addListener(() {
      setState(() {
        _userEmail = _useremailController.text;
      });
    });
  }

  @override
  void dispose() {
    _useremailController.dispose();

    super.dispose();
  }

  String? _isEmailValid() {
    if (_userEmail.isEmpty) {
      return null;
    }
    // 정규식을 이용해서 email 양식 확인
    Utils.validateEmailForm(
        input: _userEmail, resultMessage: "Email is not valid");

    return null;
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    if (_userEmail.isEmpty || _isEmailValid() != null) {
      return;
    }
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => const PasswordScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Sign up",
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v40,
              const Text(
                'What is your email?',
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v16,
              TextField(
                controller: _useremailController,
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                onEditingComplete: _onSubmit,
                decoration: InputDecoration(
                  hintText: "Email",
                  errorText: _isEmailValid(),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
                cursorColor: Theme.of(context).primaryColor,
              ),
              Gaps.v16,
              GestureDetector(
                onTap: _onSubmit,
                child: FormButton(
                  isDisabled: _userEmail.isEmpty || _isEmailValid() != null,
                  text: "Next",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
