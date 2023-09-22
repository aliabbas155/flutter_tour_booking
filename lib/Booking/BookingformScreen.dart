import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tour_booking/Homescreen/Welcomescreen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Bookingform extends StatefulWidget {
  const Bookingform({Key? key}) : super(key: key);

  @override
  _BookingformState createState() => _BookingformState();
}

class _BookingformState extends State<Bookingform>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final bool _passwordVisible = false;
  String selectedDoctor = 'Dr.Mehwish';
  List<String> doctorsList = [
    'Dr.Mehwish',
    'Dr.Zack',
    'Dr.John',
    'Dr.Noor',
    'Dr.Hifza',
    'Dr.Anum'
  ];

  String selectedTime = '9 AM';
  List<String> timesList = [
    '9 AM',
    '10 AM',
    '11 AM',
    '12 PM',
    '1 PM',
    '2 PM',
    '3 PM'
  ];

  String selectedDay = 'Monday';
  List<String> daysList = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday'
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 6000),
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    // Start the animation when the widget is built
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) =>
                    const WelcomeScreen(), // Replace HomeScreen with your actual home screen widget
              ),
            );
          },
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/plan.jpg', // Replace with your image asset path
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Column(
                    children: [
                      const Text(
                        'Fill This Trip Form To Get Booked',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            SlideTransition(
                              position: _offsetAnimation,
                              child: TextFormField(
                                autofocus: false,
                                controller: nameController,
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Your Name";
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  nameController.text = value!;
                                },
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.person,
                                    color: Color.fromRGBO(76, 175, 80, 1),
                                  ),
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(20, 15, 20, 15),
                                  hintText: "Name",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            SlideTransition(
                              position: _offsetAnimation,
                              child: TextFormField(
                                autofocus: false,
                                controller: phoneNumberController,
                                keyboardType: TextInputType.phone,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Your Phone Number";
                                  }
                                  // You can add more phone number validation here if needed
                                  return null;
                                },
                                onSaved: (value) {
                                  phoneNumberController.text = value!;
                                },
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.phone,
                                    color: Color.fromRGBO(76, 175, 80, 1),
                                  ),
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(20, 15, 20, 15),
                                  hintText: "Phone Number",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            SlideTransition(
                              position: _offsetAnimation,
                              child: TextFormField(
                                autofocus: false,
                                controller: addressController,
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Your Address";
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  addressController.text = value!;
                                },
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.location_on,
                                    color: Color.fromRGBO(76, 175, 80, 1),
                                  ),
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(20, 15, 20, 15),
                                  hintText: "Address",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            SlideTransition(
                              position: _offsetAnimation,
                              child: TextFormField(
                                autofocus: false,
                                controller: ageController,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Your Age";
                                  }
                                  // You can add more age validation here if needed
                                  return null;
                                },
                                onSaved: (value) {
                                  ageController.text = value!;
                                },
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.calendar_today,
                                    color: Color.fromRGBO(76, 175, 80, 1),
                                  ),
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(20, 15, 20, 15),
                                  hintText: "Age",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            SlideTransition(
                              position: _offsetAnimation,
                              child: DropdownButtonFormField<String>(
                                value: selectedDoctor,
                                items: doctorsList.map((String doctor) {
                                  return DropdownMenuItem<String>(
                                    value: doctor,
                                    child: Text(doctor),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedDoctor = newValue!;
                                  });
                                },
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.person,
                                    color: Color.fromRGBO(76, 175, 80, 1),
                                  ),
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(20, 15, 20, 15),
                                  hintText: "Select Doctor",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            SlideTransition(
                              position: _offsetAnimation,
                              child: DropdownButtonFormField<String>(
                                value: selectedTime,
                                items: timesList.map((String time) {
                                  return DropdownMenuItem<String>(
                                    value: time,
                                    child: Text(time),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedTime = newValue!;
                                  });
                                },
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.access_time,
                                    color: Color.fromRGBO(76, 175, 80, 1),
                                  ),
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(20, 15, 20, 15),
                                  hintText: "Select Time",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            SlideTransition(
                              position: _offsetAnimation,
                              child: DropdownButtonFormField<String>(
                                value: selectedDay,
                                items: daysList.map((String day) {
                                  return DropdownMenuItem<String>(
                                    value: day,
                                    child: Text(day),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedDay = newValue!;
                                  });
                                },
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.calendar_today,
                                    color: Color.fromRGBO(76, 175, 80, 1),
                                  ),
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(20, 15, 20, 15),
                                  hintText: "Select Day",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            SlideTransition(
                              position: _offsetAnimation,
                              child: TextFormField(
                                controller: descriptionController,
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Description cannot be empty";
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  descriptionController.text = value!;
                                },
                                textInputAction: TextInputAction.newline,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.description,
                                    color: Color.fromRGBO(76, 175, 80, 1),
                                  ),
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(20, 15, 20, 15),
                                  hintText: "Tell Your Problem",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(30),
                        color: const Color.fromRGBO(76, 175, 80, 1),
                        child: MaterialButton(
                          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          minWidth: MediaQuery.of(context).size.width,
                          onPressed: () {
                            submitAppointment();
                          },
                          child: const Text(
                            "Submit",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 21,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void submitAppointment() {
    // Access Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Create a map to represent the appointment data
    Map<String, dynamic> appointmentData = {
      'selectedDoctor': selectedDoctor,
      'description': descriptionController.text,
      'selectedTime': selectedTime,
      'selectedDay': selectedDay,
      'name': nameController.text,
      'phoneNumber': phoneNumberController.text,
      'address': addressController.text,
      'age': ageController.text,
    };

    // Add the appointment data to the Firestore collection
    firestore
        .collection('bookings_data')
        .add(appointmentData)
        .then((DocumentReference documentReference) {
      // Data added successfully
      print(
          'Appointment data added to Firestore with ID: ${documentReference.id}');
      Fluttertoast.showToast(
        msg: 'Congrats, Your Trip has been registered!',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        backgroundColor: const Color.fromRGBO(
            76, 175, 80, 1), // Customize the background color
        textColor: Colors.white, // Customize the text color
      );
      // Navigate to the HomeScreen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) =>
              const WelcomeScreen(), // Replace HomeScreen with your actual home screen widget
        ),
      );
    }).catchError((error) {
      // Handle errors if data couldn't be added
      print('Error adding appointment data to Firestore: $error');
      // You can also show an error message to the user.
    });
  }
}
