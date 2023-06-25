import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:testproject/flutter_flow/flutter_flow_theme.dart';
import 'package:testproject/form.dart';
import 'package:testproject/pages/account/yourDetails/yourDetails.dart';
import 'package:testproject/pages/sign_in/repo/signIn_model.dart';

import '../../flutter_flow/flutter_flow_widgets.dart';

class Accountpage extends StatelessWidget {
  final LoggedInData userDetails;
  const Accountpage({Key? key,required this.userDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomTheme.of(context).primaryText,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Full info
            Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15, 5, 15, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.15,
                  decoration: BoxDecoration(
                    color: CustomTheme.of(context).primaryText,
                  ),
                  child: Row(
                    children: [
                      // Avatar
                      Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.width * 0.2,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                              "https://winaero.com/blog/wp-content/uploads/2017/12/User-icon-256-blue.png")),
                      // Details
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10, 25, 0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              '${userDetails.fName}${userDetails.lName}',
                              style:
                                  CustomTheme.of(context).bodyMedium.override(
                                        fontFamily: 'Poppins',
                                        color: CustomTheme.of(context)
                                            .primaryBackground,
                                        fontSize: 22,
                                      ),
                            ),
                            AutoSizeText(
                              '${userDetails.email}',
                              style:
                                  CustomTheme.of(context).bodyMedium.override(
                                        fontFamily: 'Poppins',
                                        color: CustomTheme.of(context)
                                            .primaryBackground,
                                        fontSize: 14,
                                      ),
                            ),
                            AutoSizeText(
                              '+91 ${userDetails.number}',
                              style:
                                  CustomTheme.of(context).bodyMedium.override(
                                        fontFamily: 'Poppins',
                                        color: CustomTheme.of(context)
                                            .primaryBackground,
                                        fontSize: 14,
                                      ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
            Divider(
              height: 2,
              indent: 15,
              endIndent: 15,
              color: CustomTheme.of(context).secondaryBackground,
            ),
            // AccountSettings Static Title
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
              child: AutoSizeText(
                "Account Settings",
                style: CustomTheme.of(context).titleMedium.override(
                      fontFamily: 'Poppins',
                      color: CustomTheme.of(context).primaryBackground,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            // Settings Options
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => YourDetails(userDetails: userDetails,)),
                  );
                },
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.09,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: CustomTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AutoSizeText(
                            "User Details",
                            style: CustomTheme.of(context).titleMedium.override(
                                  fontFamily: 'Poppins',
                                  color: CustomTheme.of(context).primaryText,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: CustomTheme.of(context).primaryText,
                            size: 24,
                          )
                        ],
                      ),
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>CardForm()),
                  );
                },
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.09,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: CustomTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AutoSizeText(
                            "Account Settings",
                            style: CustomTheme.of(context).titleMedium.override(
                                  fontFamily: 'Poppins',
                                  color: CustomTheme.of(context).primaryText,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: CustomTheme.of(context).primaryText,
                            size: 24,
                          )
                        ],
                      ),
                    )),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
                child: FFButtonWidget(
                  onPressed: () async {},
                  text: "Log Out",
                  options: FFButtonOptions(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.width * 0.115,
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    color: CustomTheme.of(context).error,
                    textStyle: CustomTheme.of(context).titleMedium.override(
                          fontFamily: CustomTheme.of(context).titleMediumFamily,
                          color: CustomTheme.of(context).primaryBackground,
                        ),
                    elevation: 1,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
