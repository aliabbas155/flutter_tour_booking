import 'package:flutter/material.dart';
import 'package:flutter_tour_booking/Booking/BookingformScreen.dart';
import 'package:flutter_tour_booking/Homescreen/Welcomescreen.dart';


class Australia_placeone extends StatelessWidget {
  const Australia_placeone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Full-width and full-height asset image
          Image.asset(
            'assets/images/Australiaspot.jpg', // Replace with your image path
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // Icon (star) on top of the image
          Positioned(
            top: 50, // Adjust the position as needed
            left: 30, // Adjust the position as needed
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const WelcomeScreen(),
                  ),
                );
              },
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.yellow,
                size: 30,
              ),
            ),
          ),
          // Red container overlay
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 200,
              width: 350,
              color: const Color.fromARGB(255, 204, 195, 194).withOpacity(0.5),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Welcome to Australia, Sir",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "We hope you will enjoy this place and your time will be spent here better.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const Bookingform(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              const begin =
                                  Offset(0.0, -1.0); // Slide from the top
                              const end = Offset.zero;
                              const curve = Curves.elasticInOut;
                              const duration = Duration(seconds: 5);
                              var tween = Tween(begin: begin, end: end)
                                  .chain(CurveTween(curve: curve));
                              var offsetAnimation = animation.drive(
                                tween,
                              );
                              return SlideTransition(
                                position: offsetAnimation,
                                child: child,
                              );
                            },
                            transitionDuration: const Duration(seconds: 5),
                          ),
                        );
                      },
                      child: const Text("For Booking, Click Here"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
