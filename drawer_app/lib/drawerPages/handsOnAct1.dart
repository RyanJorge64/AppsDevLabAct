import 'package:flutter/material.dart';

class UserInputTest extends StatefulWidget {
  const UserInputTest({super.key});

  @override
  State<UserInputTest> createState() => _UserInputTestState();
}

class _UserInputTestState extends State<UserInputTest> {
  final TextEditingController _nameController = TextEditingController();

  String _selectedGender = 'Male';
  bool _agreedToTerms = false;

  final List<Map<String, dynamic>> _DB = [];

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _submitForm() {
    String name = _nameController.text.trim();

    if (name.isEmpty) {
      debugPrint('Name is Empty!!!');
      return;
    }

    if (!_agreedToTerms) {
      debugPrint('Please agree to our TOS!!!');
      return;
    }

    //Save
    _DB.add({
      'name': name,
      'gender': _selectedGender,
      'agreed': _agreedToTerms,
    });

    debugPrint('User added: $_DB');

    // Clear input
    _nameController.clear();
    setState(() {
      _selectedGender = 'Male';
      _agreedToTerms = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pseudo Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Name input
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your name',
              ),
            ),

            const SizedBox(height: 20),

            // Radio Buttons
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Select Gender:'),
            ),

            RadioListTile(
              title: const Text('Male'),
              value: 'Male',
              groupValue: _selectedGender,
              onChanged: (value) {
                setState(() {
                  _selectedGender = value!;
                });
              },
            ),

            RadioListTile(
              title: const Text('Female'),
              value: 'Female',
              groupValue: _selectedGender,
              onChanged: (value) {
                setState(() {
                  _selectedGender = value!;
                });
              },
            ),

            const SizedBox(height: 10),

            // Checkbox
            CheckboxListTile(
              title: const Text('I agree to the Terms and Conditions'),
              value: _agreedToTerms,
              onChanged: (value) {
                setState(() {
                  _agreedToTerms = value!;
                });
              },
            ),

            const SizedBox(height: 20),

            // Submit button
            ElevatedButton(
              onPressed: _submitForm,
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}