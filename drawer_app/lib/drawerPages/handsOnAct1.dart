import 'package:flutter/material.dart';
import 'dart:ui';

class UserInput extends StatefulWidget {
  const UserInput({super.key});

  @override
  State<UserInput> createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _obscureText = true;
  bool agreedToTerms = false;

  final Map<String, String> fakeDB = {
    "johnthedoe@protonmail.com": "password2",
    "ryan@protonmail.com": "password",
    "wilson@protonmail.com": 'password123',
  };

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (!_formKey.currentState!.validate()) return;

    if (!agreedToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please agree to the terms')),
      );
      return;
    }

    String username = _nameController.text.toLowerCase();
    String password = _passwordController.text;

    if (fakeDB.containsKey(username) && fakeDB[username] == password) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login successful!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid username or password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 31, 26, 26),
      body: Stack(
        children: [
          // 🔥 Background Image
          SizedBox.expand(
            child: Image.asset(
              'assets/cafe.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // 🔥 Dark overlay
          Container(
            color: const Color.fromARGB(255, 65, 62, 62).withOpacity(0.05),
          ),

          // 🔹 Centered glass card
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 32),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Colors.white.withOpacity(0.1),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // 👋 Header
                            Text(
                              'Welcome Back',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                            ),

                            const SizedBox(height: 8),

                            Text(
                              'Login to continue',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),

                            const SizedBox(height: 32),

                            // 🔹 Email
                            TextFormField(
                              controller: _nameController,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelText: 'Email',
                                labelStyle:
                                    const TextStyle(color: Colors.white70),
                                prefixIcon: const Icon(
                                  Icons.person,
                                  color: Colors.white70,
                                ),
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.05),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              validator: (value) {
                                if (value?.isEmpty ?? true) {
                                  return 'Enter username';
                                }
                                return null;
                              },
                            ),

                            const SizedBox(height: 16),

                            // 🔹 Password
                            TextFormField(
                              controller: _passwordController,
                              obscureText: _obscureText,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle:
                                    const TextStyle(color: Colors.white70),
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: Colors.white70,
                                ),
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.05),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide.none,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureText
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.white70,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                ),
                              ),
                              validator: (value) {
                                if (value?.isEmpty ?? true) {
                                  return 'Enter password';
                                }
                                return null;
                              },
                            ),

                            const SizedBox(height: 16),

                            // 🔹 Checkbox
                            Row(
                              children: [
                                Checkbox(
                                  value: agreedToTerms,
                                  checkColor: Colors.black,
                                  fillColor: MaterialStateProperty.all(
                                      Colors.white70),
                                  onChanged: (value) {
                                    setState(() {
                                      agreedToTerms = value ?? false;
                                    });
                                  },
                                ),
                                Expanded(
                                  child: Text(
                                    'I agree to the terms and conditions',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.9)),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 20),

                            // 🔹 Login Button
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: _submitForm,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Colors.white.withOpacity(0.2),
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: const Text(
                                  'Login',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),

                            const SizedBox(height: 24),

                            // 🔹 Divider with OR
                            Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                      color: Colors.white.withOpacity(0.4)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  child: Text("OR",
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.7))),
                                ),
                                Expanded(
                                  child: Divider(
                                      color: Colors.white.withOpacity(0.4)),
                                ),
                              ],
                            ),

                            const SizedBox(height: 20),

                            // 🔹 Create Account Button
                            SizedBox(
                              width: double.infinity,
                              child: OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                      color: Colors.white.withOpacity(0.5)),
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: const Text("Create Account"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
        ),
    );
}
}