import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../custom_theme/flutter_flow_icon_button.dart';
import '../../../custom_theme/flutter_flow_theme.dart';
import '../../edit_user/repo/editUser_repo.dart';
import '../../edit_user/ui/editUser.dart';
import '../../sign_in/repo/signIn_model.dart';


class YourDetails extends StatefulWidget {
  final LoggedInData? userDetails;
  final Function(LoggedInData?) onUpdateUserData;
  const YourDetails({Key? key, required this.userDetails, required this.onUpdateUserData}) : super(key: key);

  @override
  State<YourDetails> createState() => _YourDetailsState();
}

class _YourDetailsState extends State<YourDetails> {
  LoggedInData? gotshareData;
  @override
  void initState() {
    super.initState();
    gotshareData = widget.userDetails;
  }
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
            Navigator.pop(context);
          },
        ),
        title: AutoSizeText(
          'Details',
          style: CustomTheme.of(context).bodySmall.override(
                color: CustomTheme.of(context).primaryBackground,
                fontFamily: CustomTheme.of(context).bodySmallFamily,
                fontSize: 22,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(CustomTheme.of(context).bodySmallFamily),
              ),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          color: CustomTheme.of(context).primaryText,
        ),
        child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
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
                                  fontFamily:
                                      CustomTheme.of(context).bodySmallFamily,
                                  fontSize: 16,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(CustomTheme.of(context)
                                          .bodySmallFamily),
                                ),
                          ),
                          AutoSizeText(
                            '${gotshareData?.fName} ${gotshareData?.lName}',
                            style: CustomTheme.of(context)
                                .headlineSmall
                                .override(
                                  color:
                                      CustomTheme.of(context).primaryBackground,
                                  fontFamily: CustomTheme.of(context)
                                      .headlineSmallFamily,
                                  fontSize: 18,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(CustomTheme.of(context)
                                          .headlineSmallFamily),
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
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
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
                            'Email',
                            style: CustomTheme.of(context).bodySmall.override(
                                  color: CustomTheme.of(context).secondaryText,
                                  fontFamily:
                                      CustomTheme.of(context).bodySmallFamily,
                                  fontSize: 16,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(CustomTheme.of(context)
                                          .bodySmallFamily),
                                ),
                          ),
                          AutoSizeText(
                            '${widget.userDetails?.email}',
                            style: CustomTheme.of(context)
                                .headlineSmall
                                .override(
                                  color:
                                      CustomTheme.of(context).primaryBackground,
                                  fontFamily: CustomTheme.of(context)
                                      .headlineSmallFamily,
                                  fontSize: 18,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(CustomTheme.of(context)
                                          .headlineSmallFamily),
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
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
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
                                  fontFamily:
                                      CustomTheme.of(context).bodySmallFamily,
                                  fontSize: 16,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(CustomTheme.of(context)
                                          .bodySmallFamily),
                                ),
                          ),
                          AutoSizeText(
                            '${gotshareData?.number}',
                            style: CustomTheme.of(context)
                                .headlineSmall
                                .override(
                                  color:
                                      CustomTheme.of(context).primaryBackground,
                                  fontFamily: CustomTheme.of(context)
                                      .headlineSmallFamily,
                                  fontSize: 18,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(CustomTheme.of(context)
                                          .headlineSmallFamily),
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
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
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
                                  fontFamily:
                                      CustomTheme.of(context).bodySmallFamily,
                                  fontSize: 16,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(CustomTheme.of(context)
                                          .bodySmallFamily),
                                ),
                          ),
                          AutoSizeText(
                            '${gotshareData?.houseNo}',
                            style: CustomTheme.of(context)
                                .headlineSmall
                                .override(
                                  color:
                                      CustomTheme.of(context).primaryBackground,
                                  fontFamily: CustomTheme.of(context)
                                      .headlineSmallFamily,
                                  fontSize: 18,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(CustomTheme.of(context)
                                          .headlineSmallFamily),
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
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
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
                                  fontFamily:
                                      CustomTheme.of(context).bodySmallFamily,
                                  fontSize: 16,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(CustomTheme.of(context)
                                          .bodySmallFamily),
                                ),
                          ),
                          AutoSizeText(
                            '${gotshareData?.street}',
                            style: CustomTheme.of(context)
                                .headlineSmall
                                .override(
                                  color:
                                      CustomTheme.of(context).primaryBackground,
                                  fontFamily: CustomTheme.of(context)
                                      .headlineSmallFamily,
                                  fontSize: 18,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(CustomTheme.of(context)
                                          .headlineSmallFamily),
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
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
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
                            'Area',
                            style: CustomTheme.of(context).bodySmall.override(
                                  color: CustomTheme.of(context).secondaryText,
                                  fontFamily:
                                      CustomTheme.of(context).bodySmallFamily,
                                  fontSize: 16,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(CustomTheme.of(context)
                                          .bodySmallFamily),
                                ),
                          ),
                          AutoSizeText(
                            '${gotshareData?.area}',
                            style: CustomTheme.of(context)
                                .headlineSmall
                                .override(
                                  color:
                                      CustomTheme.of(context).primaryBackground,
                                  fontFamily: CustomTheme.of(context)
                                      .headlineSmallFamily,
                                  fontSize: 18,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(CustomTheme.of(context)
                                          .headlineSmallFamily),
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
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
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
                                  fontFamily:
                                      CustomTheme.of(context).bodySmallFamily,
                                  fontSize: 16,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(CustomTheme.of(context)
                                          .bodySmallFamily),
                                ),
                          ),
                          AutoSizeText(
                            '${gotshareData?.city}',
                            style: CustomTheme.of(context)
                                .headlineSmall
                                .override(
                                  color:
                                      CustomTheme.of(context).primaryBackground,
                                  fontFamily: CustomTheme.of(context)
                                      .headlineSmallFamily,
                                  fontSize: 18,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(CustomTheme.of(context)
                                          .headlineSmallFamily),
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
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
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
                                  fontFamily:
                                      CustomTheme.of(context).bodySmallFamily,
                                  fontSize: 16,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(CustomTheme.of(context)
                                          .bodySmallFamily),
                                ),
                          ),
                          AutoSizeText(
                            '${gotshareData?.state} , ${gotshareData?.pincode}',
                            style: CustomTheme.of(context)
                                .headlineSmall
                                .override(
                                  color:
                                      CustomTheme.of(context).primaryBackground,
                                  fontFamily: CustomTheme.of(context)
                                      .headlineSmallFamily,
                                  fontSize: 18,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(CustomTheme.of(context)
                                          .headlineSmallFamily),
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
                    padding:
                    const EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
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
                            'Shoe Size',
                            style: CustomTheme.of(context).bodySmall.override(
                              color: CustomTheme.of(context).secondaryText,
                              fontFamily:
                              CustomTheme.of(context).bodySmallFamily,
                              fontSize: 16,
                              useGoogleFonts: GoogleFonts.asMap()
                                  .containsKey(CustomTheme.of(context)
                                  .bodySmallFamily),
                            ),
                          ),
                          AutoSizeText(
                            '${gotshareData?.size}',
                            style: CustomTheme.of(context)
                                .headlineSmall
                                .override(
                              color:
                              CustomTheme.of(context).primaryBackground,
                              fontFamily: CustomTheme.of(context)
                                  .headlineSmallFamily,
                              fontSize: 18,
                              useGoogleFonts: GoogleFonts.asMap()
                                  .containsKey(CustomTheme.of(context)
                                  .headlineSmallFamily),
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
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
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
                                  fontFamily:
                                      CustomTheme.of(context).bodySmallFamily,
                                  fontSize: 16,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(CustomTheme.of(context)
                                          .bodySmallFamily),
                                ),
                          ),
                          AutoSizeText(
                            '${gotshareData?.uhid}',
                            style: CustomTheme.of(context)
                                .headlineSmall
                                .override(
                                  color:
                                      CustomTheme.of(context).primaryBackground,
                                  fontFamily: CustomTheme.of(context)
                                      .headlineSmallFamily,
                                  fontSize: 14,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(CustomTheme.of(context)
                                          .headlineSmallFamily),
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
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 15, 25),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => EditUser(
                          editUserRepo: EditUserRepo(),
                          userDetails: gotshareData,
                        ),
                      ),
                    ).then((updatedData) {
                      if (updatedData != null) {
                        setState(() {
                          gotshareData = updatedData;
                          widget.onUpdateUserData(updatedData);
                        });
                      }
                    });
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(const CircleBorder()),
                    padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                    backgroundColor: MaterialStateProperty.all(CustomTheme.of(context).primary), // <-- Button color
                    overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
                      if (states.contains(MaterialState.pressed)) return CustomTheme.of(context).alternate;
                      return null; // <-- Splash color
                    }),
                  ),
                  child: const Icon(Icons.edit),
                ),
              ),
          ],
        ),
      ),
    ));
  }
}
