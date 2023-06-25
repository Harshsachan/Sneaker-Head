import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testproject/form.dart';
import 'package:testproject/pages/account/yourDetails/yourDetails.dart';
import 'package:testproject/pages/explore/bloc/explore_bloc.dart';
import 'package:testproject/pages/explore/repo/explore_repo.dart';
import 'package:testproject/pages/explore/ui/explore_screen.dart';
import 'package:testproject/pages/nav_bar/nav_bar.dart';
import 'package:testproject/pages/no_Internet/bloc/no_internet_state.dart';
import 'package:testproject/pages/product/product_details.dart';
import 'package:testproject/pages/sign_in/repo/signIn_model.dart';
import 'package:testproject/pages/sign_in/repo/signIn_repo.dart';
import 'package:testproject/pages/sign_in/ui/sign_in.dart';
import 'package:testproject/pages/sign_up/repo/signUp_model.dart';
import 'package:testproject/pages/sign_up/repo/signUp_repo.dart';
import 'package:testproject/pages/sign_up/ui/sign_up_widget.dart';


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
      color: Colors.pink,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SignInWidget(SignInrepo()),
      // home: CreateUserPage(SignUpRepo()),
      //home: CardForm(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final LoggedInData userDetails;
  const MyHomePage({super.key,required this.userDetails});


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
          final details =widget.userDetails;
          print(details.number.toString());
          if (state is InternetGainedState) {
            return BlocProvider(
              create: (context) => ExploreBloc(AllProductDetails()),
              child: NavBarPage(userDetails:details),
            );
          }
          // else if(state is InternetLostState){x
          //   return NoInternetScreen();
          // }
          // else {
          // TODO
          return NoInternetScreen();
          //}
        },
      ),
    );
  }
}

// MultiBlocProvider(
// @override
// Widget build(BuildContext context) {x
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

