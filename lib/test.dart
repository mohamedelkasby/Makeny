import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UpdateEmailService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> updateEmail(String newEmail, String password) async {
    try {
      // Get current user
      final user = _auth.currentUser;
      if (user == null) return 'No user logged in';

      // Re-authenticate user before updating email (required by Firebase)
      AuthCredential credential = EmailAuthProvider.credential(
        email: user.email!,
        password: password,
      );

      await user.reauthenticateWithCredential(credential);

      // Update email
      await user.verifyBeforeUpdateEmail(newEmail);

      return null; // Success
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'requires-recent-login':
          return 'Please log in again to change your email';
        case 'invalid-email':
          return 'Invalid email format';
        case 'email-already-in-use':
          return 'This email is already registered';
        case 'wrong-password':
          return 'Incorrect password';
        default:
          return 'An error occurred: ${e.message}';
      }
    } catch (e) {
      return 'An unexpected error occurred';
    }
  }
}

// Example UI implementation
class UpdateEmailScreen extends StatefulWidget {
  @override
  State<UpdateEmailScreen> createState() => _UpdateEmailScreenState();
}

class _UpdateEmailScreenState extends State<UpdateEmailScreen> {
  final _formKey = GlobalKey<FormState>();
  final _newEmailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _updateEmailService = UpdateEmailService();
  bool _isLoading = false;

  @override
  void dispose() {
    _newEmailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _updateEmail() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    final error = await _updateEmailService.updateEmail(
      _newEmailController.text.trim(),
      _passwordController.text,
    );

    setState(() => _isLoading = false);

    if (error == null) {
      // Success
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Email updated successfully'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pop(context);
    } else {
      // Show error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Email'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _newEmailController,
                decoration: InputDecoration(
                  labelText: 'New Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Current Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _isLoading ? null : _updateEmail,
                child: _isLoading
                    ? CircularProgressIndicator()
                    : Text('Update Email'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Usage in your app
void showUpdateEmailDialog(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => UpdateEmailScreen()),
  );
}
