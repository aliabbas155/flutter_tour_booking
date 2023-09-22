import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const UserDataApp());
}

class UserDataApp extends StatelessWidget {
  const UserDataApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: UserDataForm(),
      ),
    );
  }
}

class UserDataForm extends StatefulWidget {
  const UserDataForm({Key? key}) : super(key: key);

  @override
  _UserDataFormState createState() => _UserDataFormState();
}

class _UserDataFormState extends State<UserDataForm> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController userEmailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nationalityController = TextEditingController();
  final bool _passwordVisible = false;
  File? _image;
  final _formKey = GlobalKey<FormState>();
  final CollectionReference users =
      FirebaseFirestore.instance.collection('User data');

  Future<void> _registerUser() async {
    final firstName = firstNameController.text;
    final lastName = lastNameController.text;
    final userEmail = userEmailController.text;
    final password = passwordController.text;
    final nationality = nationalityController.text;

    try {
      if (_formKey.currentState!.validate()) {
        if (_image != null) {
          final Reference storageRef = FirebaseStorage.instance
              .ref()
              .child('user_images')
              .child('${DateTime.now()}.jpg');
          final UploadTask uploadTask = storageRef.putFile(_image!);

          final TaskSnapshot taskSnapshot = await uploadTask;
          final String downloadUrl = await taskSnapshot.ref.getDownloadURL();

          await users.add({
            'firstName': firstName,
            'lastName': lastName,
            'userEmail': userEmail,
            'password': password,
            'nationality': nationality,
            'profileImage': downloadUrl,
          });

          print('User data added to Firestore');
        } else {
          print('Please select an image.');
        }
      }
    } catch (e) {
      print('Error adding user data: $e');
    }
  }

  Future<void> _getImage() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required IconData prefixIcon,
    TextInputType? keyboardType,
    bool obscureText = false,
    String? Function(String?)? validator,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Icon(prefixIcon),
        ),
        keyboardType: keyboardType,
        obscureText: obscureText,
        validator: validator,
      ),
    );
  }

  Widget _buildSignUpButton() {
    return ElevatedButton(
      onPressed: _registerUser,
      child: const Text('Submit'),
    );
  }

  Widget _buildImagePicker() {
    return Column(
      children: <Widget>[
        if (_image != null) ...[
          Image.file(_image!),
          const SizedBox(height: 10),
        ],
        ElevatedButton(
          onPressed: _getImage,
          child: const Text('Select Image'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/paris.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 100,
          left: 20,
          right: 20,
          bottom: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
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
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildImagePicker(),
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
                      _buildTextField(
                        controller: lastNameController,
                        labelText: 'Last Name',
                        prefixIcon: Icons.person,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Last Name cannot be empty';
                          }
                          return null;
                        },
                      ),
                      _buildTextField(
                        controller: userEmailController,
                        labelText: 'Email',
                        prefixIcon: Icons.mail,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please Enter Your Email';
                          }
                          if (!RegExp(
                                  r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+\.[a-z]')
                              .hasMatch(value!)) {
                            return 'Please Enter a valid email';
                          }
                          return null;
                        },
                      ),
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
                      ),
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
                      ),
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
      ],
    );
  }
}
