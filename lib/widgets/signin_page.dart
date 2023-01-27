import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const SigninPage({
    Key? key,
    required this.showRegisterPage,
  }) : super(key: key);

  @override
  State<SigninPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<SigninPage> {
  //Text Controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: ClipOval(
                    child: Opacity(
                      opacity: 0.8,
                      child: Container(
                        alignment: Alignment.center,
                        height: 100,
                        width: 100,
                        child: Image.asset('assets/chef.jpg'),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10.0),
                const Text(
                  'Hello, \nDine with us once more!',
                  style: TextStyle(
                    fontFamily: 'Electrolize',
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(height: 20.0),
                const Text(
                  'Sign in, \nWe kept everything warm for you!',
                  style: TextStyle(
                    fontFamily: 'Electrolize',
                    fontSize: 18.0,
                  ),
                ),

                // email address

                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 20, 40, 10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(25)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Email",
                        ),
                      ),
                    ),
                  ),
                ),

                //password

                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 40, 10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(25)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password",
                        ),
                      ),
                    ),
                  ),
                ),

                // Log In Button

                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 10, 50, 30),
                  child: GestureDetector(
                    onTap: signIn,
                    child: Container(
                      padding: const EdgeInsets.all(13),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                        child: Text(
                          'Log In',
                          style: TextStyle(
                              color: Colors.grey[100],
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: widget.showRegisterPage,
                      child: Text(
                        ' Register now',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],

              //not a user register again
            ),
          ),
        ),
      ),
    );
  }
}
