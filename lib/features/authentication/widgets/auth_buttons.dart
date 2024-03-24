import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/sizes.dart';

class AuthButton extends StatelessWidget {
  final FaIcon icon;
  final String text;
  final VoidCallback onTapFunction;

  const AuthButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTapFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
            padding: const EdgeInsets.all(Sizes.size14),
            decoration: BoxDecoration(
                border: Border.all(
              color: Colors.grey.shade300,
              width: Sizes.size1,
            )),
            child: Stack(alignment: Alignment.center, children: [
              Align(alignment: Alignment.centerLeft, child: icon),
              Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: Sizes.size14, fontWeight: FontWeight.w600),
              ),
            ])),
      ),
    );
  }
}
