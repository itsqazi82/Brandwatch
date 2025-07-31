import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
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
                    const Icon(
                      Icons.contact_mail,
                      size: 60,
                      color: Colors.deepPurple,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'We\'d love to hear from you!',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Have questions or feedback? Reach out to us using the information below.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
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
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    _buildContactInfo(
                      context,
                      icon: Icons.email,
                      title: 'Email',
                      subtitle: 'support@luxurywear.com',
                    ),
                    const Divider(),
                    _buildContactInfo(
                      context,
                      icon: Icons.phone,
                      title: 'Phone',
                      subtitle: '+1 (555) 123-4567',
                    ),
                    const Divider(),
                    _buildContactInfo(
                      context,
                      icon: Icons.location_on,
                      title: 'Address',
                      subtitle: '123 Luxury Ave, Tech City, TC 90210',
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
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Send us a message',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Your Name',
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Your Email',
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Message',
                        prefixIcon: Icon(Icons.message),
                      ),
                      maxLines: 4,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Send message action
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Your message has been sent!'),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text('Send Message'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfo(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      subtitle: Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}