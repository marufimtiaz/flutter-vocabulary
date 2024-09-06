import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../pages/login_page.dart';
import '../components/selectors.dart';

void logout(BuildContext context) async {
  //await FirebaseAuth.instance.signOut(); // Sign out from Firebase
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => const LoginPage(),
    ),
  );
  await clearStudentLabel(); // Clear the studentLabel
  // Navigate to the login page or any other appropriate page
}

Future<void> saveStudentLabel(String label) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('studentLabel', label);
}

Future<String?> getStudentLabel() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('studentLabel');
}

Future<void> clearStudentLabel() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('studentLabel'); // Remove from SharedPreferences
  studentLabel = null; // Clear from memory
}
