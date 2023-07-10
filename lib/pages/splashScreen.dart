import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:SneakerHead/flutter_flow/flutter_flow_theme.dart';
import 'package:SneakerHead/main.dart';
import 'package:SneakerHead/pages/home/ui/home_screen.dart';
import 'package:SneakerHead/pages/memory/user_details.dart';
import 'package:SneakerHead/pages/sign_in/repo/signIn_model.dart';
import 'package:SneakerHead/pages/sign_in/repo/signIn_repo.dart';
import 'package:SneakerHead/pages/sign_in/ui/sign_in.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  UserDetailsService userDetailsService = UserDetailsService();
  bool isImageVisible = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      setState(() {
        isImageVisible = false;
      });
    });
    // Timer(Duration(seconds: 4), () {
    //   userDetailsService.getUserDataFromSharedPreferences().then((value) {
    //     if (value != null && value.uhid != null && value.uhid!.isNotEmpty) {
    //       print("spplpae");
    //       Navigator.pushReplacement(
    //           context,
    //           MaterialPageRoute(
    //               builder: (context) => MyHomePage()));
    //     } else {
    //       print("false sspplas");
    //       Navigator.pushReplacement(context,
    //           MaterialPageRoute(builder: (context) =>SignInWidget(SignInrepo())));
    //     }
    //   });
    // });
    Timer(Duration(seconds: 3), () async{
      bool hasUserData =await userDetailsService.isUserDataAvailableInSharedPreferences();
      if(hasUserData){
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));}
      else{
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SignInWidget(SignInrepo())));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Container(
          width: MediaQuery.of(context).size.width * 1.0,
          height: MediaQuery.of(context).size.height * 1.0,
          color: CustomTheme.of(context).primaryText,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                child: AnimatedOpacity(
                  opacity: isImageVisible ? 1.0 : 0.0,
                  duration: Duration(seconds: 3),
                  curve: Curves.easeInOut,
                  child: Lottie.network(
                    'https://assets6.lottiefiles.com/packages/lf20_xlawpi2p.json',
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                    frameRate: FrameRate(60),
                    repeat: true,
                    animate: true,
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
