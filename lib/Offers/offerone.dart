import 'package:flutter/material.dart';
import 'package:flutter_tour_booking/Galleryone/galleryone.dart';
import 'package:flutter_tour_booking/Homescreen/Welcomescreen.dart';

class Offerone extends StatelessWidget {
  const Offerone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Hot Offers'), backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'WELCOME',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'You will find this offer as best offer',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/islamabad2.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  PlaceCard(
                    foodName: 'Food',
                    avatarImage: 'assets/images/food.jpg',
                    placeSubtitle: '10+ variety ',
                  ),
                  PlaceCard(
                    foodName: 'Hotel',
                    avatarImage: 'assets/images/food.jpg',
                    placeSubtitle: 'Levish Bed',
                  ),
                  PlaceCard(
                    foodName: 'Stay',
                    avatarImage: 'assets/images/hotel.jpg',
                    placeSubtitle: '7 Day',
                  ),
                  PlaceCard(
                    foodName: 'Concert',
                    avatarImage: 'assets/images/Concerts.jpg',
                    placeSubtitle: '10-4am+',
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Dr. Mohamed Jeilan, the Section Head of Cardiology and the Director of Cardiac Services, completed his medical school training at Southampton General Hospital in 1997 and his cardiology fellowship at Northampton General Hospital in 2003.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Our Gallery',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const CardList(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          const begin =
                              Offset(1.0, 0.0); // Slide from the right
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
                            seconds:
                                1), // You can adjust the duration as needed
                      ),
                    );
                  },
                  child: const Text(
                    'Click here to view all',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity, // Adjust the width as needed
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Colors.green,
                        Colors.green,
                      ], // Replace with your desired colors
                    ),
                    borderRadius: BorderRadius.circular(
                        30), // Adjust the border radius as needed
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const WelcomeScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors
                          .transparent, // Set the button's background color to transparent
                      elevation: 0, // Remove the button's elevation
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlaceCard extends StatelessWidget {
  final String foodName;
  final String avatarImage;
  final String placeSubtitle;

  const PlaceCard({
    Key? key,
    required this.foodName,
    required this.avatarImage,
    required this.placeSubtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30,
              backgroundImage: AssetImage(avatarImage),
            ),
            const SizedBox(height: 8),
            Text(
              foodName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              placeSubtitle,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
