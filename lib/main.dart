import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:SneakerHead/custom_theme/flutter_flow_theme.dart';
import 'package:SneakerHead/pages/explore/bloc/explore_bloc.dart';
import 'package:SneakerHead/pages/explore/repo/explore_repo.dart';
import 'package:SneakerHead/pages/nav_bar/nav_bar.dart';
import 'package:SneakerHead/pages/no_Internet/bloc/no_internet_state.dart';
import 'package:SneakerHead/pages/splashScreen.dart';


import 'pages/no_Internet/bloc/no_internet_bloc.dart';
import 'pages/no_Internet/ui/no_internet_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      color: CustomTheme.of(context).primaryText,
      debugShowCheckedModeBanner: false,
      title: 'Sneaker Head',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color:CustomTheme.of(context).primaryText, // Change app bar color to black
        ),
        scaffoldBackgroundColor: CustomTheme.of(context).pBackground, // Change body color to pink
      ),
      home: const SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => InternetBloc(),
      child: BlocBuilder<InternetBloc, InternetState>(
        builder: (context, state) {
          if (state is InternetGainedState) {
            return BlocProvider(
              create: (context) => ExploreBloc(AllProductDetails()),
              child: const NavBarPage(),
            );
          }
          else if(state is InternetLostState){
            return const NoInternetScreen();
          }
          else {
          return const NoInternetScreen();
          }
        },
      ),
    );
  }
}