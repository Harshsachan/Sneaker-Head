import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testproject/pages/explore/bloc/explore_bloc.dart';
import 'package:testproject/pages/explore/repo/explore_repo.dart';
import 'package:testproject/pages/explore/ui/explore_screen.dart';
import 'package:testproject/pages/nav_bar/nav_bar.dart';
import 'package:testproject/pages/no_Internet/bloc/no_internet_state.dart';
import 'package:testproject/pages/product/product_details.dart';


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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // home: NavBarPage(),
      home: MyHomePage(),
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
              child: NavBarPage(),
            );
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

// MultiBlocProvider(
// @override
// Widget build(BuildContext context) {
//   return MultiBlocProvider(
//     providers: [
//       BlocProvider<ExploreBloc>(
//         create: (context) => ExploreBloc(exploreRepository),
//       ),
//       BlocProvider<OtherBloc>(
//         create: (context) => OtherBloc(otherRepository),
//       ),
//       // Add more BlocProviders for other pages if needed
//     ],
//     child: MaterialApp(
//       title: 'My App',
//       home: NavBarPage(),
//     ),
//   );
// }

