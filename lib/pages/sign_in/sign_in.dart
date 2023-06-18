import 'package:testproject/pages/sign_up/repo/signUp_repo.dart';
import 'package:testproject/pages/sign_up/ui/sign_up_widget.dart';

import '../../flutter_flow/flutter_flow_model.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'sign_in_model.dart';
export 'sign_in_model.dart';

class SignInWidget extends StatefulWidget {
  const SignInWidget({Key? key}) : super(key: key);

  @override
  _SignInWidgetState createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();


  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
                  padding: EdgeInsetsDirectional.fromSTEB(0, 125, 0, 0),
                  child: Text(
                    'Welcome Back',
                    style:
                    CustomTheme.of(context).headlineMedium.override(
                      fontFamily: 'Poppins',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Text(
                    'Enter Your Details ',
                    style: CustomTheme.of(context).bodyMedium.override(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                  child: Text(
                    'Below',
                    style: CustomTheme.of(context).bodyMedium.override(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                // Email text controller
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Material(
                        borderRadius: BorderRadius.circular(10),
                        elevation: 30,
                        child: TextFormField(
                          controller:  _emailController,
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Enter Your Email',
                            hintText: 'example@gmail.com',
                            hintStyle: CustomTheme.of(context)
                                .bodySmall
                                .override(
                              fontFamily: 'Poppins',
                              color: CustomTheme.of(context).accent1,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: CustomTheme.of(context)
                                    .secondaryBackground,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: CustomTheme.of(context)
                                    .secondaryBackground,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: CustomTheme.of(context)
                                    .secondaryBackground,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: CustomTheme.of(context)
                                    .secondaryBackground,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            fillColor: CustomTheme.of(context)
                                .secondaryBackground,
                            contentPadding:
                            EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          ),
                          style:
                          CustomTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            color: CustomTheme.of(context).accent1,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter an email';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                // password text controller
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Material(
                        borderRadius: BorderRadius.circular(10),
                        elevation: 30,
                        child: TextFormField(
                          controller: _passwordController,
                          autofocus: false,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            hintStyle: CustomTheme.of(context)
                                .bodySmall
                                .override(
                              fontFamily: 'Poppins',
                              color: CustomTheme.of(context).accent1,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: CustomTheme.of(context)
                                    .secondaryBackground,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: CustomTheme.of(context)
                                    .secondaryBackground,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: CustomTheme.of(context)
                                    .secondaryBackground,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: CustomTheme.of(context)
                                    .secondaryBackground,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            fillColor: CustomTheme.of(context)
                                .secondaryBackground,
                            contentPadding:
                            EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          ),
                          style:
                          CustomTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            color: CustomTheme.of(context).accent1,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a password';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                // Forget password
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(180, 15, 0, 0),
                  child: AutoSizeText(
                    'Forget Password',
                    style: CustomTheme.of(context).bodyMedium.override(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
                // Signin Button
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(35, 40, 35, 20),
                  child: Material(
                    borderRadius: BorderRadius.circular(20),
                    elevation: 20,
                    child: FFButtonWidget(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final email = _emailController.text;
                          final password = _passwordController.text;
                          context.read<SignUpBloc>().add(SignUpPostEvent(email, password));
                        }
                      },
                      text: 'Sign In',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 50,
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: Color(0xFFFA6A68),
                        textStyle:
                        CustomTheme.of(context).titleSmall.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),

                // Other login methods

                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Text(
                    'Or continue with',
                    style: CustomTheme.of(context).bodyMedium.override(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                          color: CustomTheme.of(context)
                              .secondaryBackground,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                          child: Material(
                            borderRadius: BorderRadius.circular(5),
                            elevation: 20,
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 5,
                              borderWidth: 1,
                              buttonSize: 60,
                              fillColor: CustomTheme.of(context).lineColor,
                              icon: FaIcon(
                                FontAwesomeIcons.google,
                                color: CustomTheme.of(context).primaryText,
                                size: 30,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                          color: CustomTheme.of(context)
                              .secondaryBackground,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                          child: Material(
                            elevation: 20,
                            borderRadius: BorderRadius.circular(5),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 5,
                              borderWidth: 1,
                              buttonSize: 60,
                              fillColor: CustomTheme.of(context).lineColor,
                              icon: FaIcon(
                                FontAwesomeIcons.apple,
                                color: CustomTheme.of(context).primaryText,
                                size: 30,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                          color: CustomTheme.of(context)
                              .secondaryBackground,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                          child: Material(
                            elevation: 20,
                            borderRadius: BorderRadius.circular(5),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 5,
                              borderWidth: 1,
                              buttonSize: 60,
                              fillColor: CustomTheme.of(context).lineColor,
                              icon: FaIcon(
                                FontAwesomeIcons.facebook,
                                color: CustomTheme.of(context).primaryText,
                                size: 30,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateUserPage(SignUpRepo()),
                        ),
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'SIGN UP',
                            style: TextStyle(),
                          )
                        ],
                        style: CustomTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: CustomTheme.of(context).info,
                          fontSize: 16,
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
