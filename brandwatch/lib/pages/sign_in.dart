import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/animation.dart';
import 'package:brandwatch/widgets/rounded_button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _translateAnimation;

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _isSignIn = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 0.5, curve: Curves.easeIn),
      ),
    );

    _translateAnimation = Tween<double>(begin: 50, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 1, curve: Curves.easeOut),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _toggleAuthMode() {
    setState(() {
      _isSignIn = !_isSignIn;
    });
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // In a real app, you'd authenticate here
      // For frontend only, we'll just navigate to home
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  // ignore: deprecated_member_use
                  Theme.of(context).colorScheme.primary.withOpacity(0.7),
                  // ignore: deprecated_member_use
                  Theme.of(context).colorScheme.secondary.withOpacity(0.7),
                ],
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Opacity(
                    opacity: _opacityAnimation.value,
                    child: Transform.translate(
                      offset: Offset(0, _translateAnimation.value),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(height: 20),
                                Hero(
                                  tag: 'logo',
                                  child: Icon(
                                    Icons.headphones,
                                    size: 80,
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                                const SizedBox(height: 30),
                                Text(
                                  _isSignIn ? 'Sign In' : 'Sign Up',
                                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                                const SizedBox(height: 30),
                                TextFormField(
                                  controller: _emailController,
                                  decoration: const InputDecoration(
                                    labelText: 'Email',
                                    prefixIcon: Icon(Icons.email),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value == null || value.isEmpty || !value.contains('@')) {
                                      return 'Please enter a valid email';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 20),
                                TextFormField(
                                  controller: _passwordController,
                                  decoration: const InputDecoration(
                                    labelText: 'Password',
                                    prefixIcon: Icon(Icons.lock),
                                  ),
                                  obscureText: true,
                                  validator: (value) {
                                    if (value == null || value.isEmpty || value.length < 6) {
                                      return 'Password must be at least 6 characters';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 20),
                                if (!_isSignIn)
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Confirm Password',
                                      prefixIcon: Icon(Icons.lock),
                                    ),
                                    obscureText: true,
                                    validator: !_isSignIn ? (value) {
                                      if (value != _passwordController.text) {
                                        return 'Passwords do not match';
                                      }
                                      return null;
                                    } : null,
                                  ),
                                if (_isSignIn) ...[
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: _rememberMe,
                                        onChanged: (value) {
                                          setState(() {
                                            _rememberMe = value!;
                                          });
                                        },
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                      ),
                                      const Text('Remember me'),
                                      const Spacer(),
                                      TextButton(
                                        onPressed: () {
                                          // Forgot password action
                                        },
                                        child: const Text('Forgot Password?'),
                                      ),
                                    ],
                                  ),
                                ],
                                const SizedBox(height: 20),
                                RoundedButton(
                                  text: _isSignIn ? 'Sign In' : 'Sign Up',
                                  onPressed: _submit,
                                ),
                                const SizedBox(height: 20),
                                TextButton(
                                  onPressed: _toggleAuthMode,
                                  child: Text(
                                    _isSignIn 
                                        ? 'Create new account' 
                                        : 'I already have an account',
                                    style: TextStyle(
                                      color: Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}