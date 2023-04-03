import 'package:chefapp/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:chefapp/core/constants/constants.dart';


class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ElevatedButton.icon(
      onPressed: () {},
      icon: Image.asset(Constants.googlePath, width: 35 ,),
      label: const Text('Continue with google', style: TextStyle(fontSize: 18),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Pallete.greyColor,
      minimumSize:  const Size(double.infinity, 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      )
      )
      ),
    );
  }
}