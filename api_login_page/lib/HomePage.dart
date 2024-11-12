import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Matrix Login',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            margin: const EdgeInsets.symmetric(horizontal: 24.0),
            constraints: const BoxConstraints(maxWidth: 400),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                  spreadRadius: 5.0,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Top Logo and Header
                Image.asset('assets/image/logo.png', height: 100), // Update path to your logo
                const SizedBox(height: 20),
                const Text(
                  'API MATRIX',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Management Portal',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Welcome to API Matrix, where you can manage API collections',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                ),
                const SizedBox(height: 20),

                // Email Field
                _buildTextField(label: 'Enter your Registered Email ID', hintText: 'Enter your email'),

                const SizedBox(height: 10),

                // Captcha and Refresh
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(hintText: 'Enter captcha'),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      children: [
                        const Text(
                          'TGmWBh',
                          style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: const Icon(Icons.refresh),
                          onPressed: () {}, // Implement refresh captcha functionality
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Reset Password Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: () {}, // Implement reset password functionality
                    child: const Text('Reset password', style: TextStyle(fontSize: 16)),
                  ),
                ),
                const SizedBox(height: 10),

                // Return to Login
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Navigate back to the login screen (if this is a reset screen)
                  },
                  child: const Text('Return to login', style: TextStyle(color: Colors.blue)),
                ),
                const SizedBox(height: 10),

                // Footer
                const Text(
                  'Copyright © 2023 NXT Platform. All Rights Reserved.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const Text(
                  '[Privacy Policy] [Terms of Use/FAQ]',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({String? label, required String hintText}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            Text(
              label,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          TextField(
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
            ),
          ),
        ],
      ),
    );
  }
}
