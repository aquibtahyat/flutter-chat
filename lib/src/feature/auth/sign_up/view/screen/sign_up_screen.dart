import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/src/core/constants/constants.dart';
import 'package:flutter_chat/src/core/route/chat_app_routes.dart';
import 'package:flutter_chat/src/feature/auth/sign_up/controller/sign_up_controller.dart';
import 'package:flutter_chat/src/feature/auth/sign_up/controller/sign_up_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _formField = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ref.listen(signUpProvider, (previous, next) {
      if (next is SignUpSuccess) {
        ScaffoldMessenger.of(context)
            .showSnackBar(
              SnackBar(
                content: Text(
                    "Verification mail has been sent to ${_emailController.text}"),
              ),
            )
            .closed
            .then((_) {
          context.go(ChatAppRoutes.logInScreen);
        });
      }
    });

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Form(
            key: _formField,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 150),
                  const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 50),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: appGreyColour),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: appWhiteColour.withOpacity(0.5)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: appWhiteColour),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      labelText: 'Email',
                    ),
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email';
                      } else if (!emailRegex.hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                    },
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: appGreyColour),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: appWhiteColour.withOpacity(0.5)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: appWhiteColour),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      labelText: 'Password',
                    ),
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                    },
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: appGreyColour),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: appWhiteColour.withOpacity(0.5)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: appWhiteColour),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      labelText: 'Confirm Password',
                    ),
                    controller: _confirmPasswordController,
                    validator: (value) {
                      if (value == null || value != _passwordController.text) {
                        return 'Password doesn\'t match';
                      }
                    },
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () async {
                              if (_formField.currentState!.validate()) {
                                await ref.read(signUpProvider.notifier).signup(
                                    email: _emailController.text,
                                    password: _passwordController.text);
                              }
                            },
                            child: const Text('Sign Up')),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(text: 'Already have an account? '),
                        TextSpan(
                          text: 'Log in',
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = _navigateToLogIn,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToLogIn() {
    context.go(ChatAppRoutes.logInScreen);
  }
}
