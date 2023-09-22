import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tour_booking/Homescreen/Welcomescreen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? lastName;
  String? nationality;

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'nationality': nationality,
    };
  }
}

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nationalityController = TextEditingController();

  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/loginback.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Form(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 45),
                    const Text(
                      'Welcome to Registration page',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildTextField(
                      controller: firstNameController,
                      labelText: 'First Name',
                      prefixIcon: Icons.account_circle,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'First Name cannot be empty';
                        }
                        if (value!.length < 3) {
                          return 'Enter a valid name (Min. 3 characters)';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    _buildTextField(
                      controller: lastNameController,
                      labelText: 'Last Name',
                      prefixIcon: Icons.person_2_sharp,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Last Name cannot be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    _buildTextField(
                      controller: emailController,
                      labelText: 'Email',
                      prefixIcon: Icons.mail,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please Enter Your Email';
                        }
                        if (!(RegExp(r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+\.[a-z]')
                            .hasMatch(value!))) {
                          return 'Please Enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    _buildTextField(
                      controller: passwordController,
                      labelText: 'Password',
                      prefixIcon: Icons.vpn_key,
                      obscureText: !_passwordVisible,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Password is required for login';
                        }
                        if (value!.length < 6) {
                          return 'Enter a valid Password (Min. 6 characters)';
                        }
                        return null;
                      },
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: const Color.fromRGBO(76, 175, 80, 1),
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildTextField(
                      controller: confirmPasswordController,
                      labelText: 'Confirm Password',
                      prefixIcon: Icons.vpn_key,
                      obscureText: !_passwordVisible,
                      validator: (value) {
                        if (value != passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: const Color.fromRGBO(76, 175, 80, 1),
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildTextField(
                      controller: nationalityController,
                      labelText: 'Nationality',
                      prefixIcon: Icons.flag,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Nationality cannot be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    _buildSignUpButton(),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required IconData prefixIcon,
    TextInputType? keyboardType,
    bool obscureText = false,
    Widget? suffixIcon,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(
          prefixIcon,
          color: const Color.fromRGBO(76, 175, 80, 1),
        ),
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        fillColor: Colors.white.withOpacity(0.8),
        filled: true,
      ),
    );
  }

  Widget _buildSignUpButton() {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: const Color.fromRGBO(76, 175, 80, 1),
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () async {
          await signUp(
            emailController.text,
            passwordController.text,
          );
        },
        child: const Text(
          'Sign Up',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Future<void> signUp(String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        // User registered successfully, save additional details to Firestore
        await postDetailsToFirestore(userCredential.user!);

        // Navigate to the welcome screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const WelcomeScreen(), // Replace with your actual welcome screen
          ),
        );

        Fluttertoast.showToast(msg: 'Account created successfully :)');
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'An undefined error happened.';
      switch (e.code) {
        case 'invalid-email':
          errorMessage = 'Your email address appears to be malformed.';
          break;
        case 'weak-password':
          errorMessage = 'The password is too weak.';
          break;
        case 'email-already-in-use':
          errorMessage =
              'The email address is already in use by another account.';
          break;
      }
      Fluttertoast.showToast(msg: errorMessage);
    } catch (e) {
      print('Error creating account: $e');
      Fluttertoast.showToast(
        msg: 'Error creating account. Please try again.',
      );
    }
  }

  Future<void> postDetailsToFirestore(User user) async {
    UserModel userModel = UserModel();

    // Assign values to the UserModel
    userModel.email = user.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameController.text;
    userModel.lastName = lastNameController.text;
    userModel.nationality = nationalityController.text; // Save nationality

    await _firestore
        .collection('tourist_data')
        .doc(user.uid)
        .set(userModel.toMap());
  }
}
