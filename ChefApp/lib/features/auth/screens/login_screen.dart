import 'package:flutter/material.dart';
import 'package:chefapp/core/constants/constants.dart';
import 'package:chefapp/core/common/sign_in_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        title: Center(
          child: Image.asset(
            Constants.logoPath,
            height: 40,
          ),
        ),
        actions: [
          TextButton(
          onPressed: () {}, 
          child: const Text('Ship',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          ),
          )
        ],
      ),

      body: Column(
        children: [
        const SizedBox(height: 30),
        const Text(
          'Welcome Cooker',
          style:TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 30,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
              Constants.logoPath,
              height: 400,
            ),
        ),
        const SizedBox(height: 30),
        const SignInButton()
      ],
      )
    );
  }
}