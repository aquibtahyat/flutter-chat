import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/src/core/constants/constants.dart';
import 'package:flutter_chat/src/core/route/chat_app_routes.dart';
import 'package:flutter_chat/src/feature/auth/log_in/controller/log_in_controller.dart';
import 'package:flutter_chat/src/feature/auth/log_in/controller/log_in_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LogInScreen extends ConsumerStatefulWidget {
  const LogInScreen({super.key});

  @override
  ConsumerState<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends ConsumerState<LogInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formField = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ref.listen(logInProvider, (previous, next) {
      if (next is LogInSuccess) {
        context.go(ChatAppRoutes.chatListScreen);
      }

      if (next is LogInError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.message),
          ),
        );
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
                  const SizedBox(height: 50),
                  const Text(
                    "Log In",
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
                        borderSide: BorderSide(color: appRedColour),
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
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              if (_formField.currentState!.validate()) {
                                ref.read(logInProvider.notifier).logIn(
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                    );
                              }
                            },
                            child: const Text('Log In')),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(text: 'Don\'t have an account? '),
                        TextSpan(
                          text: 'Sign Up',
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = _navigateToSignUp,
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

  void _navigateToSignUp() {
    context.go(ChatAppRoutes.signUpScreen);
  }
}
