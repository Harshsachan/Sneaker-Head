import 'package:flutter/material.dart';

import '../../../custom_theme/flutter_flow_theme.dart';
import '../../../custom_theme/flutter_flow_widgets.dart';
class NoInternetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/noInternetScreen.jpg"),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Connection is lost ',
              style:
              CustomTheme.of(context).headlineMedium.override(
                fontFamily: 'Poppins',
                color: Colors.black,
              ),
            ),
            Text(
              'Please check your internet connection ',
              style:
              CustomTheme.of(context).titleMedium.override(
                fontFamily: 'Poppins',
                color: CustomTheme.of(context).accent2,
              ),
            ),
            Text(
              'and try again',
              style:
              CustomTheme.of(context).titleMedium.override(
                fontFamily: 'Poppins',
                color: CustomTheme.of(context).accent2,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(100, 10, 100, 0),
              child: Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 20,
                child: FFButtonWidget(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  text: 'Try Again',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.width * 0.1,
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    color: Colors.black,
                    textStyle:
                    CustomTheme.of(context).titleSmall.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(1000),
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