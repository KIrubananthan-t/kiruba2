import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'main.dart'; // Import MainScreen instead of WorkspacesTab

// AuthService that handles the authentication logic.
class AuthService {
  Future<void> authenticate(String username, String password) async {
    print('Authenticating $username');
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController captchaController = TextEditingController();
  final AuthService _authService = AuthService();

  bool _isRememberMeChecked = false;
  final String _captchaText = 'InZ4L4'; // Static CAPTCHA text for demonstration

  void _login() async {
    final username = emailController.text;
    final password = passwordController.text;

    await _authService.authenticate(username, password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/image/logo.png', width: 100, height: 100),
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
                _buildTextField(
                  label: 'Email',
                  hintText: 'Enter your email',
                  controller: emailController,
                ),
                _buildTextField(
                  label: 'Password',
                  hintText: 'Enter your password',
                  obscureText: true,
                  controller: passwordController,
                ),
                _buildCaptcha(),
                _buildRememberMeCheckbox(),
                _buildSignInButton(context),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  child: const Text('Forgot password?', style: TextStyle(color: Colors.blue)),
                ),
                const Divider(height: 30),
                const Text(
                  'Copyright © 2023 NXT Platform. All Rights Reserved.',
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

  Widget _buildTextField({
    required String label,
    required String hintText,
    bool obscureText = false,
    required TextEditingController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 14, color: Colors.black87)),
          TextField(
            controller: controller,
            obscureText: obscureText,
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

  Widget _buildCaptcha() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: captchaController,
            decoration: InputDecoration(
              label: Text('Please Enter CAPTCHA'),
              hintText: 'Enter CAPTCHA',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Column(
          children: [
            Text(_captchaText, style: const TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold)),
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {}, // Implement refresh CAPTCHA functionality if needed
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRememberMeCheckbox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          value: _isRememberMeChecked,
          onChanged: (bool? value) {
            setState(() {
              _isRememberMeChecked = value ?? false;
              if (_isRememberMeChecked) {
                emailController.text = 'ramchandar@redcaso.com';
                passwordController.text = '12345';
              } else {
                emailController.clear();
                passwordController.clear();
              }
            });
          },
        ),
        const Text('Remember me'),
      ],
    );
  }

  Widget _buildSignInButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          backgroundColor: Colors.blue,
        ),
        onPressed: () {
          _validateCredentials(context);
        },
        child: const Text('Sign In', style: TextStyle(fontSize: 16)),
      ),
    );
  }

  void _validateCredentials(BuildContext context) {
    const credentials = {
      'ramchandar@redcaso.com': '12345',
      'kirubananthan.thangadurai@redcaso.com': '123456',
      'rishikumar.baskar@redcaso.com': '1234567',
    };

    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      _showMessage(context, 'Fields are empty. Please fill in all fields.');
    } else if (captchaController.text != _captchaText) {
      _showMessage(context, 'Incorrect CAPTCHA. Please re-enter the CAPTCHA.');
    } else if (credentials[emailController.text] == passwordController.text) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()), // Navigate to MainScreen
      );
    } else {
      _showMessage(context, 'Incorrect email or password.');
    }
  }

  void _showMessage(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
