import 'package:flutter/material.dart';
import 'package:brandwatch/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.deepPurple,
                      child: Icon(
                        Icons.settings,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'App Settings',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  SwitchListTile(
                    title: const Text('Dark Mode'),
                    secondary: const Icon(Icons.dark_mode),
                    value: themeProvider.themeMode == ThemeMode.dark,
                    onChanged: (value) {
                      themeProvider.toggleTheme(value);
                    },
                  ),
                  const Divider(height: 0),
                  ListTile(
                    leading: const Icon(Icons.notifications),
                    title: const Text('Notifications'),
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                  const Divider(height: 0),
                  ListTile(
                    leading: const Icon(Icons.language),
                    title: const Text('Language'),
                    trailing: const Text('English'),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.security),
                    title: const Text('Privacy Policy'),
                    onTap: () {},
                  ),
                  const Divider(height: 0),
                  ListTile(
                    leading: const Icon(Icons.description),
                    title: const Text('Terms of Service'),
                    onTap: () {},
                  ),
                  const Divider(height: 0),
                  ListTile(
                    leading: const Icon(Icons.help),
                    title: const Text('Help & Support'),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                leading: const Icon(Icons.info),
                title: const Text('About App'),
                subtitle: const Text('Version 1.0.0'),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}