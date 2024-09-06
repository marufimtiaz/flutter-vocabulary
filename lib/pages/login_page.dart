import 'package:flutter/material.dart';
import 'package:vocabulary/components/custom_button.dart';
import 'package:vocabulary/components/custom_textfield.dart';
import 'package:vocabulary/components/unfocus.dart';
import 'package:vocabulary/pages/new_words.dart';
import 'package:vocabulary/pages/vocabs.dart';
import '../components/selectors.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void navigateToSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUpPage()),
    );
  }

  void login() {
    // String email = emailController.text;
    // String password = passwordController.text;
    // print("Email: $email, Password: $password, Role: $studentLabel");

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => studentLabel == 'teacher'
            ? const CreateVocabulary()
            : const VocabularyPage(),
      ),
    );
  }

  void selectRole(String role) {
    setState(() {
      studentLabel = role;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: UnfocusOnTap(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.1),
                  Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  const Text(
                    "Select your occupation",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ChoiceCard(
                          icon: Icons.person,
                          text: 'Student',
                          color: studentLabel == 'student'
                              ? Theme.of(context).colorScheme.primary
                              : Colors.grey,
                          borderColor: studentLabel == 'student'
                              ? Theme.of(context).colorScheme.primary
                              : Colors.grey,
                          onTap: () => selectRole('student'),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.05),
                      Expanded(
                        child: ChoiceCard(
                          icon: Icons.school,
                          text: 'Teacher',
                          color: studentLabel == 'teacher'
                              ? Theme.of(context).colorScheme.primary
                              : Colors.grey,
                          borderColor: studentLabel == 'teacher'
                              ? Theme.of(context).colorScheme.primary
                              : Colors.grey,
                          onTap: () => selectRole('teacher'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  CustomTextField(
                    controller: emailController,
                    labelText: 'Email Address',
                    hintText: 'Enter your email',
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  CustomTextField(
                    controller: passwordController,
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    obscureText: true,
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        // Handle forgot password
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  CustomButton(
                    label: 'Login',
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    textColor: Colors.white,
                    onPressed: login,
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
                      const Text("Don't have an account? "),
                      GestureDetector(
                        onTap: navigateToSignUp,
                        child: Text(
                          "Sign Up",
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
    );
  }
}
