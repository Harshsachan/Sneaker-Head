import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testproject/pages/nav_bar/nav_bar.dart';
import 'package:testproject/pages/no_Internet/bloc/no_internet_state.dart';


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
    return const MaterialApp(
      title: 'Flutter Demo',
      //home: NoInternetScreen(),
      home:   MyHomePage(),
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
          if(state is InternetGainedState) {
            return NavBarPage();
          }
          // else if(state is InternetLostState){
          //   return NoInternetScreen();
          // }
          // else {
            return NoInternetScreen();
          //}
        },
      ),
    );
  }
}

