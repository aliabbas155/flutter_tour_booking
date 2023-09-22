import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tour_booking/Destinantions/australia.dart';
import 'package:flutter_tour_booking/Destinantions/dubai.dart';
import 'package:flutter_tour_booking/Destinantions/greece.dart';
import 'package:flutter_tour_booking/Destinantions/italy.dart';
import 'package:flutter_tour_booking/Destinantions/japan.dart';
import 'package:flutter_tour_booking/Destinantions/spain.dart';
import 'package:flutter_tour_booking/Destinantions/thailand.dart';
import 'package:flutter_tour_booking/Offers/offerone.dart';
import 'package:flutter_tour_booking/splashscreen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int _currentIndex = 0; // Add this line to declare _currentIndex
  bool isDarkMode = false;

  final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.green,
  );

  final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.indigo,
    brightness: Brightness.dark,
  );

  final Color textColor = Colors.white;
  final Color appBarColor = Colors.orange;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: 'Favorites',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final theme = isDarkMode ? darkTheme : lightTheme;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const SplashScreen(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(0.0, 1.0);
                    const end = Offset.zero;
                    const curve = Curves.easeInOut;
                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);

                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                ),
              );
            },
          ),
          actions: [
            Switch(
              value: isDarkMode,
              onChanged: (value) {
                setState(() {
                  isDarkMode = value;
                });
              },
            ),
          ],
          backgroundColor: isDarkMode ? appBarColor : null,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    Text(
                      "Hello, Ali",
                      style: TextStyle(
                        fontSize: 17,
                        color: isDarkMode ? textColor : Colors.grey,
                      ),
                    ),
                    const Icon(
                      Icons.hail,
                      color: Colors.yellow,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Discover Your Dream Destinations🌍✈️",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SignikaNegative-VariableFont',
                    color: isDarkMode ? textColor : Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width - 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      const Australia_placeone(),
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
                        child: _buildCircularAvatarWithBorder(
                            'assets/images/australialogo.jpg', 'Australia'),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      const Greece_placeone(),
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
                        child: _buildCircularAvatarWithBorder(
                            'assets/images/gereecelogo.jpg', 'Greece'),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      const Thailand_placeone(),
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
                        child: _buildCircularAvatarWithBorder(
                            'assets/images/thialandlogo.jpg', 'Thailand'),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      const Japan_placeone(),
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
                        child: _buildCircularAvatarWithBorder(
                            'assets/images/japanlogo.jpg', 'Japan'),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      const Dubai_placeone(),
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
                        child: _buildCircularAvatarWithBorder(
                            'assets/images/splash.jpg', 'Dubai'),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      const Spain_placeone(),
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
                        child: _buildCircularAvatarWithBorder(
                            'assets/images/spainlogo.jpg', 'Spain'),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      const Italy_placeone(),
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
                        child: _buildCircularAvatarWithBorder(
                            'assets/images/italylogo.jpg', 'Italy'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "Our Gallery for you:",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? textColor : Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 250.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    pauseAutoPlayOnTouch: true,
                  ),
                  items: [
                    'assets/images/imageslider1.jpg',
                    'assets/images/imageslider2.jpg',
                    'assets/images/imageslider3.jpg',
                    'assets/images/imageslider4.jpg',
                    'assets/images/imageslider5.jpg',
                  ].map((item) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Image.asset(
                            item,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "Hot Offers:",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? textColor : Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: () {
                  // Replace const Doctors() with the screen you want to navigate to
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const Offerone(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        const begin = Offset(0.0, -1.0); // Slide from the top
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
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(
                        200, 230, 201, 1), // Light green background color
                  ),
                  child: ListTile(
                    leading: Image.asset('assets/images/list1.jpg',
                        width: 100, height: 100),
                    title: const Text('German'),
                    subtitle: const Text('Get this Offer now!!!'),
                    trailing: Image.asset('assets/images/offer.png',
                        width: 50, height: 50), // Replace with your image asset
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const SplashScreen(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        const begin = Offset(0.0, -1.0); // Slide from the top
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
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.amber, // Light green background color
                  ),
                  child: ListTile(
                    leading: Image.asset('assets/images/list2.jpg',
                        width: 100, height: 100),
                    title: const Text('South Africa'),
                    subtitle: const Text('Get this offer now!!!'),
                    trailing: Image.asset('assets/images/offer.png',
                        width: 50, height: 50), // Replace with your image asset
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const SplashScreen(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        const begin = Offset(0.0, -1.0); // Slide from the top
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
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(
                        255, 240, 167, 178), // Light green background color
                  ),
                  child: ListTile(
                    leading: Image.asset('assets/images/list3.jpg',
                        width: 100, height: 100),
                    title: const Text('London'),
                    subtitle: const Text('Get this offer now!!!'),
                    trailing: Image.asset('assets/images/offer.png',
                        width: 50, height: 50), // Replace with your image asset
                  ),
                ),
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: _bottomNavBarItems,
          selectedItemColor: Colors.green, // Color for selected item
          onTap: (index) {
            // Handle tab selection
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}

Widget _buildCircularAvatarWithBorder(String imagePath, String text) {
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.black,
            width: 2.0,
          ),
        ),
        child: CircleAvatar(
          radius: 35,
          backgroundImage: AssetImage(imagePath),
        ),
      ),
      const SizedBox(height: 10),
      Text(text),
    ],
  );
}
