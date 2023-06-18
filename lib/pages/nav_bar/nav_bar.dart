import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../account/account_screen.dart';
import '../cart/cart_screen.dart';
import '../explore/bloc/explore_bloc.dart';
import '../explore/bloc/explore_event.dart';
import '../explore/ui/explore_screen.dart';
import '../home/ui/home_screen.dart';


class NavBarPage extends StatefulWidget {

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  final List<Widget> _screens = [
    ProductDetailsWidget(),
    ExplorePage(),
    CartPage(),
    Accountpage(),
  ];

  @override
  void initState() {
    super.initState();
    // Add the event to fetch data when ExplorePage is loaded
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final exploreBloc = BlocProvider.of<ExploreBloc>(context);
      exploreBloc.add(ExplorePageFetchProductEvent());
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: _screens,
      ),
      bottomNavigationBar: CircleNavBar(
        activeIcons: [
          Image.asset('assets/icons/home.gif'),
          Image.asset('assets/icons/explore.gif'),
          Image.asset('assets/icons/cart.gif'),
          Image.asset('assets/icons/acc.gif'),
        ],
        inactiveIcons: [
          Image.asset('assets/icons/home.png'),
          Image.asset('assets/icons/explore.png'),
          Image.asset('assets/icons/cart.png'),
          Image.asset('assets/icons/acc.png'),
        ],
        color: Colors.black,
        circleColor: Colors.black,
        height: 60,
        circleWidth: 60,
        activeIndex: _currentIndex,
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
        padding: EdgeInsets.only(left: 6, right: 6, bottom: 10),
        cornerRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
        shadowColor: Colors.deepPurple,
        circleShadowColor: Colors.deepPurple,
        elevation: 10,
      ),
    );
  }
}

// Wrap the NavBarPage widget with BlocProvider for both ExploreBloc and HomeBloc:
// dart

// Copy code

// MultiBlocProvider(
// providers: [
// BlocProvider<ExploreBloc>(
// create: (context) => ExploreBloc(),
// ),
// BlocProvider<HomeBloc>(
// create: (context) => HomeBloc(),
// ),
// ],
// child: NavBarPage(),
// ),

// Modify the initState method in _NavBarPageState:
// dart

// Copy code

// @override
// void initState() {
// super.initState();
// // Add the event to fetch data when ExplorePage is loaded
// WidgetsBinding.instance?.addPostFrameCallback((_) {
// final exploreBloc = BlocProvider.of<ExploreBloc>(context);
// exploreBloc.add(ExplorePageFetchProductEvent());
//
// final homeBloc = BlocProvider.of<HomeBloc>(context);
// homeBloc.add(HomePageFetchDataEvent());
// });
// }

