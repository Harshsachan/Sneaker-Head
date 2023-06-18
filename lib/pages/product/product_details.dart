import 'package:auto_size_text/auto_size_text.dart';

import '../../flutter_flow/flutter_flow_model.dart';
import '../explore/repo/explore_model.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SingleProductWidget extends StatelessWidget {
  final ProductDetails product;
   SingleProductWidget({Key? key,required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomTheme.of(context).primaryText,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    color: CustomTheme.of(context)
                        .primaryBackground
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      //Image
                      Container(
                        width: double.infinity,
                        height: 400,
                        decoration: BoxDecoration(
                          color: CustomTheme.of(context)
                              .primaryBackground,

                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Hero(
                                tag: 'productShoe',
                                transitionOnUserGestures: true,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0),
                                  child: Image.network(
                                     product.image??'',
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Card(
                                        clipBehavior: Clip.antiAliasWithSaveLayer,
                                        color: CustomTheme.of(context)
                                                .primaryBackground,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30,
                                          buttonSize: 46,
                                          icon: Icon(
                                            Icons.arrow_back_ios_outlined,
                                            color: CustomTheme.of(context)
                                                .primaryText,
                                            size: 35,
                                          ),
                                          onPressed: () async {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ),
                                      Card(
                                        clipBehavior: Clip.antiAliasWithSaveLayer,
                                        color: CustomTheme.of(context)
                                            .primaryBackground,
                                        elevation: 100,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30,
                                          buttonSize: 46,
                                          icon: Icon(
                                            Icons.favorite_sharp,
                                            color: CustomTheme.of(context)
                                                .primaryText,
                                            size: 24,
                                          ),
                                          onPressed: () {
                                            print('IconButton pressed ...');
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      //Details

                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.03,
                        decoration: BoxDecoration(
                          color: CustomTheme.of(context)
                              .primaryText,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: CustomTheme.of(context).primaryText,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AutoSizeText(
                                product.name??'',
                                style: CustomTheme.of(context)
                                    .headlineSmall
                                    .override(
                                  fontFamily: 'Poppins',
                                  color: CustomTheme.of(context)
                                      .primaryBackground,
                                  // fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: CustomTheme.of(context).primaryText,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AutoSizeText(
                                'Retailed by ',
                                style: CustomTheme.of(context).titleLarge.override(
                                  fontFamily: 'Poppins',
                                  color: CustomTheme.of(context).primaryBackground,
                                ),
                              ),
                              AutoSizeText(
                                product.company??'',
                                style: CustomTheme.of(context).titleLarge.override(
                                  fontFamily: 'Poppins',
                                  color: CustomTheme.of(context).primaryBackground,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: CustomTheme.of(context).primaryText,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                          child: Row(
                            children: [
                              AutoSizeText(
                                '\$ - ',
                                style: CustomTheme.of(context).titleLarge.override(
                                  fontFamily: 'Poppins',
                                  color: CustomTheme.of(context).alternate,
                                ),
                              ),
                              AutoSizeText(
                                product.price.toString()??'',
                                  style: CustomTheme.of(context).titleLarge.override(
                                      fontFamily: 'Poppins',
                                      color: CustomTheme.of(context)
                                          .alternate)
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: CustomTheme.of(context).primaryText,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(24,0, 24, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              AutoSizeText(
                                'DESCRIPTION',
                                style:
                                CustomTheme.of(context).titleMedium.override(
                                  fontFamily: 'Poppins',
                                  color: CustomTheme.of(context)
                                      .primaryBackground,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: CustomTheme.of(context).primaryText,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: AutoSizeText(
                                  product.description??'',
                                  style: CustomTheme.of(context).labelMedium.override(
                                    fontFamily: 'Poppins',
                                    color: CustomTheme.of(context)
                                        .primaryBackground,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: CustomTheme.of(context).primaryText,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: AutoSizeText(
                                  product.description??'',
                                  style: CustomTheme.of(context).labelMedium.override(
                                    fontFamily: 'Poppins',
                                    color: CustomTheme.of(context)
                                        .primaryBackground,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //TODO
                      // Size functinaolity to build
                      // Container(
                      //   width: double.infinity,
                      //   decoration: BoxDecoration(
                      //     color: CustomTheme.of(context).primaryBackground,
                      //   ),
                      //   child: Padding(
                      //     padding: EdgeInsetsDirectional.fromSTEB(24, 16, 24, 0),
                      //     child: Row(
                      //       mainAxisSize: MainAxisSize.max,
                      //       children: [
                      //         Text(
                      //           'SIZE',
                      //           style:
                      //           CustomTheme.of(context).bodySmall.override(
                      //             fontFamily: 'Poppins',
                      //             fontWeight: FontWeight.bold,
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      //Chips

                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: CustomTheme.of(context).primaryText,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Colors.white,
                    offset: Offset(0, 1),
                  )
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 52),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: 'Apple Pay',
                      icon: FaIcon(
                        FontAwesomeIcons.apple,
                        color: CustomTheme.of(context).secondaryBackground,
                        size: 20,
                      ),
                      options: FFButtonOptions(
                        width: 160,
                        height: 50,
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: CustomTheme.of(context).primaryText,
                        textStyle:
                        CustomTheme.of(context).titleSmall.override(
                          fontFamily: 'Outfit',
                          color: CustomTheme.of(context)
                              .secondaryBackground,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        elevation: 0,
                        borderSide: BorderSide(
                          color: CustomTheme.of(context).alternate,
                          width: 2,
                        ),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: 'Add to Cart',
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        size: 15,
                      ),
                      options: FFButtonOptions(
                        width: 160,
                        height: 50,
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: CustomTheme.of(context).alternate,
                        textStyle:
                        CustomTheme.of(context).titleSmall.override(
                          fontFamily: 'Outfit',
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        elevation: 3,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
