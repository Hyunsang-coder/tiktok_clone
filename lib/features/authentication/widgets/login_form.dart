import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';

import '../../../constants/sizes.dart';
import '../../../constants/utils.dart';
import 'form_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  Map<String, String> formData = {};

  _onSubmit() {
    if (_formKey.currentState == null) {
      //print("current state is null");
      return;
    }

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // ignore: avoid_print
      print("Email: ${formData['email']}");
      // ignore: avoid_print
      print("Password: ${formData['password']}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log in"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Gaps.v28,
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Email",
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ))),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Enter your email.";
                  }
                  return Utils.validateEmailForm(
                      input: value, resultMessage: "Email is not valid");
                },
                onSaved: (String? newValue) {
                  if (newValue != null) {
                    formData["email"] = newValue;
                  }
                },
              ),
              Gaps.v16,
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Password",
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ))),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Enter your password.";
                  }
                  return null;
                },
                onSaved: (String? newValue) {
                  if (newValue != null) {
                    formData["password"] = newValue;
                  }
                },
              ),
              Gaps.v28,
              GestureDetector(
                  onTap: _onSubmit,
                  child: const FormButton(isDisabled: false, text: "Next")),
            ],
          ),
        ),
      ),
    );
  }
}
