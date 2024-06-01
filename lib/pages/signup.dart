import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SignupPage(title:"Signup"),
    );
  }
}
// Define a custom Form widget.
class SignupPage extends StatefulWidget {
  const SignupPage({super.key, required this.title});

  final String title;
  @override
  State<SignupPage> createState() => _SignupPageState();
}

// Define a corresponding State class.
// This class holds data related to the Form.
class _SignupPageState extends State<SignupPage> {
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
              "Signup",
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
                onPressed: () {
                  print(emailController.text);
                  print(passwordController.text);
                  Future<UserCredential> result = FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
                  result.then((value){
                    print("Success");
                    Navigator.pop(context);
                  });
                  result.catchError((error){
                    print("Failed to sign up");
                    print(error.toString());
                  });
                  },
                child: Text("Signup")
            )
          ],
        )
    );
  }
}