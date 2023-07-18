import 'package:chefapp/features/auth/controleer/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:chefapp/core/constants/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ConsumerWidget -> conseguimos aceder a um provider que esta dentro de um classe 
class SignInButton extends ConsumerWidget { // consumerWidget é tipo stateless a diferença é que adiciona um provider
  const SignInButton({super.key});

    signInWithGoogle(BuildContext context,WidgetRef ref){  // WidgetRef -> esta associado ao providerscope(main.dart), forma de aceder aos dados do provider
    ref.read(authControllerProvider.notifier).signInWithGoogle(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ElevatedButton.icon(
      onPressed: () => signInWithGoogle(context, ref),
      icon: Image.asset(Constants.googlePath, width: 35 ,),
      label: const Text('Continue with google', style: TextStyle(fontSize: 18),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey,
      minimumSize:  const Size(double.infinity, 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),      
      )
      )
      ), 
    );
    
  }
}