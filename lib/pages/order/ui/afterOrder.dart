import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:neopop/widgets/buttons/neopop_tilted_button/neopop_tilted_button.dart';
import 'package:testproject/flutter_flow/flutter_flow_theme.dart';
import 'package:testproject/flutter_flow/flutter_flow_widgets.dart';
import 'package:testproject/pages/home/ui/home_screen.dart';
import 'package:testproject/pages/nav_bar/nav_bar.dart';

class AfterOrder extends StatefulWidget {
  const AfterOrder({Key? key}) : super(key: key);

  @override
  State<AfterOrder> createState() => _AfterOrderState();
}

class _AfterOrderState extends State<AfterOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.of(context).forBtn,
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
                    print("click");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePageWidget(),
                      ),
                    );
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
    );
  }
}