import 'package:flutter/material.dart';

class CommonLogo extends StatelessWidget {
  const CommonLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          'assets/img/welcome.png',
          fit: BoxFit.contain,
        ),
      ],
    );
  }
}
