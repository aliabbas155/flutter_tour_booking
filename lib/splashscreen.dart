import 'package:flutter/material.dart';
import 'package:flutter_tour_booking/Resgistration_Screens/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background Image
          Image.asset(
            'assets/images/paris.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // Text with padding in the top-left corner
          const Positioned(
            top: 100.0, // Adjust the position as needed
            left: 16.0, // Adjust the position as needed
            child: Text(
              'Explore the World, One Journey\nAt a Time🌍✈️.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 27.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Additional Text
          const Positioned(
            top: 160.0, // Adjust the position as needed
            left: 16.0, // Adjust the position as needed
            child: Text(
              'Travel to breathtaking destinations, from\nthe bustling streets to the serene beaches',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'SignikaNegative-VariableFont',
                fontSize: 20.0,
              ),
            ),
          ),
          // Elevated Button
          Positioned(
            top: 210.0, // Adjust the position as needed
            left: 16.0, // Adjust the position as needed
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const LoginScreen(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = Offset(1.0, 0.0); // Slide from the right
                      const end = Offset.zero;
                      const curve = Curves.elasticInOut;
                      const duration = Duration(seconds: 1);
                      var tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));
                      var offsetAnimation = animation.drive(tween);
                      return SlideTransition(
                        position: offsetAnimation,
                        child: child,
                      );
                    },
                    transitionDuration: const Duration(
                        seconds: 1), // You can adjust the duration as needed
                  ),
                );
              },
              label: const Text(
                'Lets Go',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
              ),
              icon: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
