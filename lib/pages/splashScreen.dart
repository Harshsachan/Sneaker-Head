import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:SneakerHead/custom_theme/flutter_flow_theme.dart';
import 'package:SneakerHead/main.dart';
import 'package:SneakerHead/pages/memory/user_details.dart';
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
    super.initState();
    Timer(const Duration(seconds: 3), () {
      setState(() {
        isImageVisible = false;
      });
    });

    Timer(const Duration(seconds: 3), () async{
      bool hasUserData =await userDetailsService.isUserDataAvailableInSharedPreferences();
      if(hasUserData){
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));}
      else{
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SignInWidget(SignInRepo())));}
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
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                child: AnimatedOpacity(
                  opacity: isImageVisible ? 1.0 : 0.0,
                  duration: const Duration(seconds: 3),
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
