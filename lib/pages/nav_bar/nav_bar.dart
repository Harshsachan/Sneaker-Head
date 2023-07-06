import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testproject/flutter_flow/flutter_flow_theme.dart';
import 'package:testproject/pages/emptyScreen.dart';
import 'package:testproject/pages/memory/user_details.dart';
import 'package:testproject/pages/sign_in/repo/signIn_model.dart';

import '../account/account_screen.dart';
import '../cart/cart_screen.dart';
import '../explore/bloc/explore_bloc.dart';
import '../explore/bloc/explore_event.dart';
import '../explore/repo/explore_model.dart';
import '../explore/ui/explore_screen.dart';
import '../home/ui/home_screen.dart';


class NavBarPage extends StatefulWidget {

  const NavBarPage({Key? key}) : super(key: key);

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {


  PageController _pageController = PageController(initialPage: 0);

  int _currentIndex = 0;
  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();

    _screens = [
      ProductDetailsWidget(),
      ExplorePage(),
      CartPage(),
      Accountpage(),
    ];
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
    Future<bool> _onWillPop() async {
      return (await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Exit App'),
          content: Text('Are you sure you want to exit the app?'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('No'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('Yes'),
            ),
          ],
        ),
      )) ??
          false;
    }

    return WillPopScope(
      onWillPop:_onWillPop,
      child: Scaffold(
        backgroundColor: CustomTheme.of(context).primaryText,
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

