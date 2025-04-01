import 'package:donutappfuncional/widgets/app_drawer.dart';
import 'package:donutappfuncional/widgets/avatar.dart';
import 'package:flutter/material.dart';


class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final _usernameController = TextEditingController();
  final _websiteController = TextEditingController();
  String? _avatarUrl;
  var _loading = false;

  @override
  void initState() {
    super.initState();
    // Placeholder data - will be replaced with actual user data
    _usernameController.text = 'JohnDoe';
    _websiteController.text = 'www.example.com';
    // Placeholder for avatar URL
    _avatarUrl = '';
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _websiteController.dispose();
    super.dispose();
  }

  // Placeholder for profile update functionality
  void _updateProfile() {
    setState(() {
      _loading = true;
    });
    
    // Simulate API call
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _loading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile updated successfully!')),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      drawer: const AppDrawer(),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Avatar(
                  imageUrl: _avatarUrl,
                  onUpload: (url) {
                    setState(() {
                      _avatarUrl = url;
                    });
                  },
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _websiteController,
                  decoration: const InputDecoration(
                    labelText: 'Website',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _loading ? null : _updateProfile,
                  child: Text(_loading ? 'Saving...' : 'Update Profile'),
                ),
                const SizedBox(height: 16),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/update-password');
                  },
                  child: const Text('Change Password'),
                ),
              ],
            ),
    );
  }
}

