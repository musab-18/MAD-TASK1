import 'package:flutter/material.dart';
import 'homescreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  // Form Key
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController emailController =
  TextEditingController();

  final TextEditingController passwordController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Login Screen"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Form(
          key: _formKey,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // Email Field
              TextFormField(
                controller: emailController,

                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),

                validator: (value) {

                  // Empty Check
                  if (value == null || value.isEmpty) {
                    return "Please enter email";
                  }

                  // Email Format Check
                  String pattern =
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';

                  RegExp regex = RegExp(pattern);

                  if (!regex.hasMatch(value)) {
                    return "Enter valid email";
                  }

                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Password Field
              TextFormField(
                controller: passwordController,
                obscureText: true,

                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),

                validator: (value) {

                  if (value == null || value.isEmpty) {
                    return "Please enter password";
                  }

                  return null;
                },
              ),

              const SizedBox(height: 10),

              // Forgot Password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Login Button
              ElevatedButton(

                onPressed: () {

                  // Validate Form
                  if (_formKey.currentState!.validate()) {

                    // Navigate to Home Screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                        const HomeScreen(),
                      ),
                    );
                  }
                },

                child: const Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}