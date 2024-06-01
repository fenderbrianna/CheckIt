import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/pages/page1.dart';

// Define a custom Form widget.
class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

// Define a corresponding State class.
// This class holds data related to the Form.
class _LoginPageState extends State<LoginPage> {
  // Create a text controller. Later, use it to retrieve the
  // current value of the TextField.
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    title: Text('Back'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Login",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700
              ),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Email",
                hintStyle: TextStyle(
                    color: Colors.deepPurple.withOpacity(0.6),
                    fontFamily: "Georgia"
                ),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)
                ),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple)
                ),
              ),
              style: const TextStyle(
                  color: Colors.deepPurple,
                  fontFamily: "Georgia"
              ),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(
                    color: Colors.deepPurple.withOpacity(0.6),
                    fontFamily: "Georgia"
                ),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)
                ),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple)
                ),
              ),
              style: const TextStyle(
                  color: Colors.deepPurple,
                  fontFamily: "Georgia"
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.deepPurple,
                  shadowColor: Colors.grey,
                ),
                onPressed: () {
                  print(emailController.text);
                  print(passwordController.text);
                  Future<UserCredential> result = FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
                  result.then((value){
                    print("Login Success");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Page1(title: "MyApp")),
                    );
                  });
                  result.catchError((error){
                    print("Failed to login");
                    print(error.toString());
                  });
                },
                child: Text("Login")
            )
          ],
        )
    );
  }
}