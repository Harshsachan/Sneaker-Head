import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testproject/flutter_flow/flutter_flow_icon_button.dart';
import 'package:testproject/flutter_flow/flutter_flow_theme.dart';
import 'package:testproject/flutter_flow/internationalization.dart';
import 'package:testproject/pages/sign_in/repo/signIn_model.dart';

class YourDetails extends StatelessWidget {
  final LoggedInData userDetails;
  const YourDetails({Key? key,required this.userDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: CustomTheme.of(context).primaryText,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 60,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: CustomTheme.of(context).primaryBackground,
                  size: 30,
                ),
                onPressed: () async {

                },
              ),
              title:AutoSizeText(
                'Details',
                style: CustomTheme.of(context).bodySmall.override(
                  color: CustomTheme.of(context).primaryBackground,
                  fontFamily: CustomTheme.of(context).bodySmallFamily,
                  fontSize: 22,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      CustomTheme.of(context).bodySmallFamily),
                ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 2,
            ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              color: CustomTheme.of(context).primaryText,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.09,
                      decoration: BoxDecoration(
                        color: CustomTheme.of(context).primaryText,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            'Name',
                            style: CustomTheme.of(context).bodySmall.override(
                              color: CustomTheme.of(context).secondaryText,
                              fontFamily: CustomTheme.of(context).bodySmallFamily,
                              fontSize: 16,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  CustomTheme.of(context).bodySmallFamily),
                            ),
                          ),
                      AutoSizeText(
                              '${userDetails.fName}${userDetails.lName}',
                            style: CustomTheme.of(context).headlineSmall.override(
                              color: CustomTheme.of(context).primaryBackground,
                              fontFamily:
                              CustomTheme.of(context).headlineSmallFamily,
                              fontSize: 18,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  CustomTheme.of(context).headlineSmallFamily),
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            color: CustomTheme.of(context).secondaryText,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.09,
                      decoration: BoxDecoration(
                        color: CustomTheme.of(context).primaryText,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                              'Email' ,
                            style: CustomTheme.of(context).bodySmall.override(
                              color: CustomTheme.of(context).secondaryText,
                              fontFamily: CustomTheme.of(context).bodySmallFamily,
                              fontSize: 16,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  CustomTheme.of(context).bodySmallFamily),
                            ),
                          ),
                          AutoSizeText(
                              '${userDetails.email}',
                            style: CustomTheme.of(context).headlineSmall.override(
                              color: CustomTheme.of(context).primaryBackground,
                              fontFamily:
                              CustomTheme.of(context).headlineSmallFamily,
                              fontSize: 18,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  CustomTheme.of(context).headlineSmallFamily),
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            color: CustomTheme.of(context).secondaryText,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.09,
                      decoration: BoxDecoration(
                        color: CustomTheme.of(context).primaryText,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                              'Mobile Number',
                            style: CustomTheme.of(context).bodySmall.override(
                              color: CustomTheme.of(context).secondaryText,
                              fontFamily: CustomTheme.of(context).bodySmallFamily,
                              fontSize: 16,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  CustomTheme.of(context).bodySmallFamily),
                            ),
                          ),
                          AutoSizeText(
                              '${userDetails.number}',
                            style: CustomTheme.of(context).headlineSmall.override(
                              color: CustomTheme.of(context).primaryBackground,
                              fontFamily:
                              CustomTheme.of(context).headlineSmallFamily,
                              fontSize: 18,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  CustomTheme.of(context).headlineSmallFamily),
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            color: CustomTheme.of(context).secondaryText,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.09,
                      decoration: BoxDecoration(
                        color: CustomTheme.of(context).primaryText,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                              'House Number',
                            style: CustomTheme.of(context).bodySmall.override(
                              color: CustomTheme.of(context).secondaryText,
                              fontFamily: CustomTheme.of(context).bodySmallFamily,
                              fontSize: 16,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  CustomTheme.of(context).bodySmallFamily),
                            ),
                          ),
                          AutoSizeText(
                              '${userDetails.houseNo}' ,
                            style: CustomTheme.of(context).headlineSmall.override(
                              color: CustomTheme.of(context).primaryBackground,
                              fontFamily:
                              CustomTheme.of(context).headlineSmallFamily,
                              fontSize: 18,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  CustomTheme.of(context).headlineSmallFamily),
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            color: CustomTheme.of(context).secondaryText,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.09,
                      decoration: BoxDecoration(
                        color: CustomTheme.of(context).primaryText,

                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                              'Street',
                            style: CustomTheme.of(context).bodySmall.override(
                              color: CustomTheme.of(context).secondaryText,
                              fontFamily: CustomTheme.of(context).bodySmallFamily,
                              fontSize: 16,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  CustomTheme.of(context).bodySmallFamily),
                            ),
                          ),
                          AutoSizeText(
                              '${userDetails.street}' ,
                            style: CustomTheme.of(context).headlineSmall.override(
                              color: CustomTheme.of(context).primaryBackground,
                              fontFamily:
                              CustomTheme.of(context).headlineSmallFamily,
                              fontSize: 18,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  CustomTheme.of(context).headlineSmallFamily),
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            color: CustomTheme.of(context).secondaryText,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.09,
                      decoration: BoxDecoration(
                        color: CustomTheme.of(context).primaryText,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                              'Area' ,
                            style: CustomTheme.of(context).bodySmall.override(
                              color: CustomTheme.of(context).secondaryText,
                              fontFamily: CustomTheme.of(context).bodySmallFamily,
                              fontSize: 16,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  CustomTheme.of(context).bodySmallFamily),
                            ),
                          ),
                          AutoSizeText(
                              '${userDetails.area}' ,
                            style: CustomTheme.of(context).headlineSmall.override(
                              color: CustomTheme.of(context).primaryBackground,
                              fontFamily:
                              CustomTheme.of(context).headlineSmallFamily,
                              fontSize: 18,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  CustomTheme.of(context).headlineSmallFamily),
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            color: CustomTheme.of(context).secondaryText,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.09,
                      decoration: BoxDecoration(
                        color: CustomTheme.of(context).primaryText,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                              'City',
                            style: CustomTheme.of(context).bodySmall.override(
                              color: CustomTheme.of(context).secondaryText,
                              fontFamily: CustomTheme.of(context).bodySmallFamily,
                              fontSize: 16,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  CustomTheme.of(context).bodySmallFamily),
                            ),
                          ),
                          AutoSizeText(
                              '${userDetails.city}',
                            style: CustomTheme.of(context).headlineSmall.override(
                              color: CustomTheme.of(context).primaryBackground,
                              fontFamily:
                              CustomTheme.of(context).headlineSmallFamily,
                              fontSize: 18,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  CustomTheme.of(context).headlineSmallFamily),
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            color: CustomTheme.of(context).secondaryText,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.09,
                      decoration: BoxDecoration(
                        color: CustomTheme.of(context).primaryText,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                              'State & Pincode',
                            style: CustomTheme.of(context).bodySmall.override(
                              color: CustomTheme.of(context).secondaryText,
                              fontFamily: CustomTheme.of(context).bodySmallFamily,
                              fontSize: 16,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  CustomTheme.of(context).bodySmallFamily),
                            ),
                          ),
                          AutoSizeText(
                              '${userDetails.state} , ${userDetails.pincode}',
                            style: CustomTheme.of(context).headlineSmall.override(
                              color: CustomTheme.of(context).primaryBackground,
                              fontFamily:
                              CustomTheme.of(context).headlineSmallFamily,
                              fontSize: 18,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  CustomTheme.of(context).headlineSmallFamily),
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            color: CustomTheme.of(context).secondaryText,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.09,
                      decoration: BoxDecoration(
                        color: CustomTheme.of(context).primaryText,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                              'UHID',
                            style: CustomTheme.of(context).bodySmall.override(
                              color: CustomTheme.of(context).secondaryText,
                              fontFamily: CustomTheme.of(context).bodySmallFamily,
                              fontSize: 16,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  CustomTheme.of(context).bodySmallFamily),
                            ),
                          ),
                          AutoSizeText(
                              '${userDetails.uhid}',
                            style: CustomTheme.of(context).headlineSmall.override(
                              color: CustomTheme.of(context).primaryBackground,
                              fontFamily:
                              CustomTheme.of(context).headlineSmallFamily,
                              fontSize: 14,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  CustomTheme.of(context).headlineSmallFamily),
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            color: CustomTheme.of(context).secondaryText,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
          ,
        )
    );
  }
}
