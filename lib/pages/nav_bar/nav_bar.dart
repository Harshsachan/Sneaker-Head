import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../account/account_screen.dart';
import '../cart/cart_screen.dart';
import '../explore/explore_screen.dart';
import '../home/home_screen.dart';


// class NavBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Navigation Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: NavBarPage(),
//     );
//   }
// }

class NavBarPage extends StatefulWidget {
  @override
  _NavBarPageState createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomePage(),
    ExplorePage(),
    CartPage(),
    Accountpage(),
  ];

  //int _currentIndex = 0;
  int get tabIndex => _currentIndex;
  set tabIndex(int v) {
    _currentIndex = v;
    setState(() {});
  }

  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: _currentIndex);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: CircleNavBar(
      activeIcons:  [
        Image.asset('assets/icons/home.gif'),
        Image.asset('assets/icons/explore.gif'),
        Image.asset('assets/icons/cart.gif'),
        Image.asset('assets/icons/acc.gif'),
      ],
      inactiveIcons:  [
        Image.asset('assets/icons/home.png'),
        Image.asset('assets/icons/explore.png'),
        Image.asset('assets/icons/cart.png'),
        Image.asset('assets/icons/acc.png'),
      ],
      color: Colors.white,
      circleColor: Colors.white,
      height: 60,
      circleWidth: 60,
      activeIndex: tabIndex,
      onTap: (index) {
        tabIndex = index;
        pageController.jumpToPage(tabIndex);
      },
    // tabCurve: ,
      padding:  EdgeInsets.only(left: 6, right: 6, bottom:10),
      cornerRadius:  BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
      shadowColor: Colors.deepPurple,
      circleShadowColor: Colors.deepPurple,
      elevation: 10,
      //gradient: LinearGradient(
      //     begin: Alignment.topRight,
      //     end: Alignment.bottomLeft,
      //     colors: [ Colors.blue, Colors.red ],
      // ),
      // circleGradient: LinearGradient(
      //   begin: Alignment.topRight,
      //   end: Alignment.bottomLeft,
      //   colors: [ Colors.blue, Colors.red ],
      //   ),
      ),
    );
  }
}
