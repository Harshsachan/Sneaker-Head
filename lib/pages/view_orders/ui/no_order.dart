import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../custom_theme/flutter_flow_theme.dart';

class NoOrder extends StatelessWidget {
  const NoOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
        Scaffold(appBar: AppBar(
          backgroundColor: CustomTheme.of(context).primaryText,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed:
                () {
              Navigator.pop(context);
            }, // Call navigateBack method when the back button is pressed
          ),
          title: AutoSizeText(
            'Orders',
            style: CustomTheme.of(context).headlineMedium.override(
              fontFamily: 'Poppins',
              color: Colors.white,
              fontSize: 22,
            ),
          ),
          //actions: [],
          centerTitle: true,
          elevation: 2,
        ),body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: CustomTheme.of(context).primaryText,
          ),
          child: Center(child:AutoSizeText(
            'No Orders Found Please Order Something!!',
            style: CustomTheme.of(context).headlineMedium.override(
              fontFamily: 'Poppins',
              color: Colors.white,
              fontSize: 13,
            ),
          ),),
        ),),);
  }
}
