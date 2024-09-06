import 'package:flutter/material.dart';
import 'package:vocabulary/components/custom_button.dart';
import 'package:vocabulary/components/custom_textfield.dart';
import 'package:vocabulary/components/unfocus.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
// Controllers to manage input fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    // Dispose controllers when the widget is removed from the widget tree
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void navigateToLogin() {
    // Add navigation to sign-up logic here
    Navigator.pop(context);
  }

  void signup() {
    // String email = emailController.text;
    // String password = passwordController.text;

    // Add your login logic here
    // print("Email: $email, Password: $password");
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: UnfocusOnTap(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: screenHeight * 0.05),
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    CustomTextField(
                      controller: usernameController,
                      hintText: 'Username',
                      obscureText: false,
                      labelText: 'Username',
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    CustomTextField(
                      controller: emailController,
                      hintText: 'Email',
                      obscureText: false,
                      labelText: 'Email',
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    CustomTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: true,
                      labelText: 'Password',
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    CustomTextField(
                      controller: confirmPasswordController,
                      hintText: 'Confirm Password',
                      obscureText: true,
                      labelText: 'Confirm Password',
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    CustomButton(
                      label: 'Sign Up',
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      textColor: Colors.white,
                      onPressed: () {
                        // Sign up logic
                      },
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.075),
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              label: 'Google',
                              icon: Icons.g_translate,
                              backgroundColor: Colors.blueAccent,
                              textColor: Colors.white,
                              onPressed: () {
                                // Google sign-up logic
                              },
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.075),
                          Expanded(
                            child: CustomButton(
                              label: 'Apple',
                              icon: Icons.apple,
                              backgroundColor: Colors.black,
                              textColor: Colors.white,
                              onPressed: () {
                                // Apple sign-up logic
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account? "),
                        GestureDetector(
                          onTap: navigateToLogin,
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
