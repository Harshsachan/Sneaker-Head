import 'dart:async';
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:neopop/widgets/buttons/neopop_tilted_button/neopop_tilted_button.dart';
import 'package:SneakerHead/custom_theme/flutter_flow_theme.dart';
import 'package:SneakerHead/pages/nav_bar/nav_bar.dart';

import '../../explore/bloc/explore_bloc.dart';
import '../../explore/repo/explore_repo.dart';

class AfterOrder extends StatefulWidget {
  const AfterOrder({Key? key}) : super(key: key);

  @override
  State<AfterOrder> createState() => _AfterOrderState();
}

class _AfterOrderState extends State<AfterOrder> {
  ConfettiController _confettiController = ConfettiController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _confettiController.play();
    Timer(Duration(seconds: 6), () {
      _confettiController.stop();
    });
  }
  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  void _handleroute(){
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => ExploreBloc(AllProductDetails()),
          child: NavBarPage(),
        ),
      ),
          (route) => false, // Removes all previous routes from the stack
    );
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _handleroute();
        // Handle the Android back button here
        // Navigator.popUntil(context, ModalRoute.withName('/')); // Navigates back to the home page
        return false; // Return true if you want to allow back navigation, false otherwise.
      },
      child: ConfettiWidget(
        confettiController: _confettiController,
        blastDirectionality: BlastDirectionality.explosive,
        shouldLoop: true,
        colors: const [
          Colors.green,
          Colors.blue,
          Colors.pink,
          Colors.orange,
          Colors.purple
        ],
        createParticlePath: drawStar,
        child: Scaffold(
          backgroundColor: CustomTheme.of(context).primaryText,
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.network(
                        'https://assets9.lottiefiles.com/packages/lf20_rxuub8j6.json',
                        width: MediaQuery.of(context).size.width*0.5,
                        height: MediaQuery.of(context).size.width*0.5,
                        fit: BoxFit.cover,
                        frameRate: FrameRate(60),
                        repeat: true,
                        animate: true,
                      ),
                    ],
                  ),
                ),
                AutoSizeText(
                  'Congrats!',
                  style: CustomTheme.of(context).headlineMedium.override(
                    fontFamily: 'Poppins',
                    color: CustomTheme.of(context).primaryBtnText,
                    fontSize: 32,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                  child: AutoSizeText(
                    'Your Order is Placed.',
                    style: CustomTheme.of(context).titleSmall.override(
                      fontFamily: 'Poppins',
                      color: CustomTheme.of(context).primaryBtnText,
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                  child: AutoSizeText(
                    'Happiness will be delivered soon!',
                    style: CustomTheme.of(context).titleSmall.override(
                      fontFamily: 'Poppins',
                      color: CustomTheme.of(context).primaryBtnText,
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 44, 0, 0),
                  child:Container(
                    width: MediaQuery.of(context).size.width*0.5,
                    child: NeoPopTiltedButton(
                      isFloating: true,
                      onTapUp: () {
                        _handleroute();
                      },
                      decoration:  NeoPopTiltedButtonDecoration(
                        color: CustomTheme.of(context).neoColor,
                        plunkColor: CustomTheme.of(context).neoPlunkColor,
                        shadowColor: CustomTheme.of(context).primaryText,
                        showShimmer: true,
                        shimmerColor: CustomTheme.of(context).secondaryBackground,
                      ),
                      child:  Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Center(
                          child: AutoSizeText(
                            "Go to Home",
                            style: CustomTheme.of(context).bodySmall.override(
                              fontFamily: 'Poppins',
                              color: CustomTheme.of(context)
                                  .primaryText,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}