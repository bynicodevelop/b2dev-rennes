import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/add_screen.dart';
import 'package:flutter_application_2/screens/page_views/feed_screen.dart';
import 'package:flutter_application_2/screens/page_views/profiles_screen.dart';
import 'package:flutter_application_2/screens/profile_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(
    initialPage: 0,
  );
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon App'),
        actions: [
          IconButton(
            icon: const Icon(
              FontAwesomeIcons.person,
            ),
            onPressed: () {
              print("Coucou les devs");

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (value) {
          print("Page changed: $value");

          setState(() {
            _currentIndex = value;
          });
        },
        scrollDirection: Axis.horizontal,
        children: const [
          FeedScreen(),
          ProfilesScreen(),
        ],
      ),

      // body: Container(
      //   // width: screenSize.width * .6, // width: 100%
      //   width: screenSize.width,
      //   color: Colors.amber,
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //         children: const [
      //           Icon(
      //             FontAwesomeIcons.facebook,
      //             color: Colors.blue,
      //           ),
      //           Icon(
      //             FontAwesomeIcons.twitter,
      //             color: Colors.blue,
      //           ),
      //           Icon(
      //             FontAwesomeIcons.instagram,
      //             color: Colors.blue,
      //           ),
      //         ],
      //       ),
      //       const Text("Coucou les devs"),
      //       ElevatedButton(
      //         onPressed: () {
      //           Navigator.pushAndRemoveUntil(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) => const NoReturnScreen(),
      //             ),
      //             (route) => false,
      //           );
      //         },
      //         child: const Text("Coucou les devs 2"),
      //       ),
      //     ],
      //   ),
      // ),
      // body: const Center(
      //   child: Text(
      //     'Hello World',
      //     style: TextStyle(
      //       fontSize: 24.0,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Action add Screen");

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddScreen(),
              fullscreenDialog: true,
            ),
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
        onTap: (value) {
          print("On Tap: $value");

          setState(() {
            _currentIndex = value;
          });

          _pageController.animateToPage(
            value,
            duration: const Duration(
              milliseconds: 300,
            ),
            curve: Curves.easeInOut,
          );
        },
      ),
    );
  }
}
