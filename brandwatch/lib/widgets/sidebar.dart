import 'package:flutter/material.dart';
import 'package:brandwatch/pages/about_page.dart';
import 'package:brandwatch/pages/contact_page.dart';
import 'package:brandwatch/pages/settings_page.dart';
import 'package:brandwatch/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(right: Radius.circular(25)),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              // ignore: deprecated_member_use
              Theme.of(context).colorScheme.primary.withOpacity(0.2),
              // ignore: deprecated_member_use
              Theme.of(context).colorScheme.secondary.withOpacity(0.2),
            ],
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(25),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Welcome Back!',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'user@example.com',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            _buildListTile(
              context,
              icon: Icons.home,
              title: 'Home',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            _buildListTile(
              context,
              icon: Icons.info,
              title: 'About',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutPage()),
                );
              },
            ),
            _buildListTile(
              context,
              icon: Icons.settings,
              title: 'Settings',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              },
            ),
            _buildListTile(
              context,
              icon: Icons.contact_mail,
              title: 'Contact Us',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ContactPage()),
                );
              },
            ),
            const Divider(),
            SwitchListTile(
              title: const Text('Dark Mode'),
              secondary: Icon(
                themeProvider.themeMode == ThemeMode.dark 
                    ? Icons.dark_mode 
                    : Icons.light_mode,
              ),
              value: themeProvider.themeMode == ThemeMode.dark,
              onChanged: (value) {
                themeProvider.toggleTheme(value);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            _buildListTile(
              context,
              icon: Icons.exit_to_app,
              title: 'Log Out',
              onTap: () {
                Navigator.pushReplacementNamed(context, '/signin');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 2,
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        onTap: onTap,
      ),
    );
  }
}