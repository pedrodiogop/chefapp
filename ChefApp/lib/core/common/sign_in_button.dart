import 'package:chefapp/features/auth/controleer/auth_controller.dart';
import 'package:chefapp/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:chefapp/core/constants/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class SignInButton extends ConsumerWidget {
  const SignInButton({super.key});

  void signInWithGoogle(WidgetRef ref){
    ref.read(authControllerProvider).signInWithGoogle();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ElevatedButton.icon(
      onPressed: () => signInWithGoogle(ref),
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