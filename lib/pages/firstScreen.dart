import 'package:testproject/pages/sign_in/repo/signIn_repo.dart';
import 'package:testproject/pages/sign_up/repo/signUp_repo.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'sign_in/ui/sign_in.dart';
import 'sign_up/ui/sign_up_widget.dart';

// import 'first_screen_model.dart';
// export 'first_screen_model.dart';

class FirstScreenWidget extends StatefulWidget {
  const FirstScreenWidget({Key? key}) : super(key: key);

  @override
  _FirstScreenWidgetState createState() => _FirstScreenWidgetState();
}

class _FirstScreenWidgetState extends State<FirstScreenWidget> {
  // late FirstScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // _model = createModel(context, () => FirstScreenModel());
  }

  @override
  void dispose() {
    // _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: CustomTheme.of(context).primaryBackground,
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: CustomTheme.of(context).lineColor,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        'https://img.freepik.com/free-vector/cute-girl-working-laptop-cartoon_138676-2958.jpg?w=1380&t=st=1683872324~exp=1683872924~hmac=9a65efc7b16aa5fce71d7fd7e069f9d1608f655b86545a36a759cbed20e109df',
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.5,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.13,
                    decoration: BoxDecoration(
                      color: CustomTheme.of(context).lineColor,
                    ),
                  ),
                  Text(
                    'Welcome ',
                    style: CustomTheme.of(context).headlineMedium.override(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Some other description of the project',
                    style: CustomTheme.of(context).titleMedium.override(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    indent: 40,
                    endIndent: 40,
                    color: CustomTheme.of(context).secondaryText,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                        color: CustomTheme.of(context).lineColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                //TODO
                                await Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateUserPage(SignUpRepo())));
                                print('Button pressed ...');
                              },
                              text: 'SIGN UP',
                              options: FFButtonOptions(
                                width: 130,
                                height: 50,
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                iconPadding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                color: Color(0xFFFA6A68),
                                textStyle: CustomTheme.of(context)
                                    .titleSmall
                                    .override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                                hoverColor: CustomTheme.of(context)
                                    .secondaryBackground,
                                hoverTextColor:
                                CustomTheme.of(context).primaryText,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: FFButtonWidget(
                              onPressed: () async{
                                await Navigator.push(context, MaterialPageRoute(builder: (context)=> SignInWidget(SignInrepo())));
                                print('Button pressed ...');
                              },
                              text: 'SIGN IN',
                              options: FFButtonOptions(
                                width: 130,
                                height: 50,
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                iconPadding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                color: Color(0xFFFA6A68),
                                textStyle: CustomTheme.of(context)
                                    .titleSmall
                                    .override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                                hoverColor: CustomTheme.of(context)
                                    .secondaryBackground,
                                hoverTextColor:
                                CustomTheme.of(context).primaryText,
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
          ),
        ),
      ),
    );
  }
}
