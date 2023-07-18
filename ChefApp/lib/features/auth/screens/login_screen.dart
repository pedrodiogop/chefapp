import 'package:chefapp/core/common/loader.dart';
import 'package:chefapp/features/auth/controleer/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:chefapp/core/constants/constants.dart';
import 'package:chefapp/features/auth/screens/sign_in_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // isLoading vai ter valor de false porque no
    // auth_controller o super esta como falso.
    final isLoading = ref.watch(authControllerProvider);
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
              child: const Text(
                'Ship',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
        body: isLoading
            ? const Loader() // widget que mostra o loading
            : Column(
                children: [
                  const SizedBox(height: 30),
                  const Text(
                    'Welcome Cooker',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
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
              ));
  }
}
