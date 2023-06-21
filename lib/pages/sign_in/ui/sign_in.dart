import 'package:blurry/blurry.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testproject/main.dart';
import 'package:testproject/pages/sign_in/bloc/signIn_bloc.dart';
import 'package:testproject/pages/sign_in/bloc/signIn_state.dart';
import 'package:testproject/pages/sign_in/repo/signIn_model.dart';
import 'package:testproject/pages/sign_in/repo/signIn_repo.dart';
import 'package:testproject/pages/sign_up/repo/signUp_repo.dart';
import 'package:testproject/pages/sign_up/ui/sign_up_widget.dart';

import '../bloc/signIn_event.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInWidget extends StatefulWidget {
  final SignInrepo userRepository;
   SignInWidget(this.userRepository);

  @override
  _SignInWidgetState createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? toshow;
  String? toshowtitle;
  final passwordError= "Please check your password";
  final emailError= "Please check your email or Signup with us";

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
      body: BlocProvider(
  create: (_) => SignInBloc(widget.userRepository),
  child: BlocConsumer<SignInBloc, SignInPageState>(
  listener: (context, state) {
    // TODO: implement listener
    if(state is SignInPageSuccessState){
      print("Data fetched in widget Successful");
      LoggedInData userDetails = state.loggedInData;
      print(state.loggedInData.toJson());
      print(userDetails);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(userDetails:userDetails),
        ),
      );
    }
    else if (state is SignInPageDataNotFoundState){
      print("SignInPageDataNotFoundState");
      print(state.error);

      if(state.error.toString().startsWith("This") ){
        toshow = emailError;
        toshowtitle= "Email Not found";
      }
      else{
        toshow = passwordError;
        toshowtitle= state.error.toString();
      }
      Blurry.error(
          title:  '${toshowtitle}',
          description:'${state.error.toString()} ${toshow}',
          confirmButtonText:  'Okay',
          onConfirmButtonPressed: () {
            print('hello world');
            Navigator.of(context).pop(true);
          })
          .show(context);
    }
    else if(state is SignInPageLoadingState){

    }
  },
  builder: (context, state) {
    return SafeArea(
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

                Form(
                    child: Column(
                      key: _formKey,
                      children: [
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
                      ],
                )),
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
                ElevatedButton(
                  onPressed: () {
                    print(_emailController.text);
                    print(_passwordController.text);
                    //if (_formKey.currentState!.validate()) {
                      print("inside if");
                      final email = _emailController.text;
                      final password = _passwordController.text;
                      context.read<SignInBloc>().add(SignInFetchDataEvent(email, password));
                    //}
                  },
                  child: Text('Sign in'),
                ),
                // Padding(
                //   padding: EdgeInsetsDirectional.fromSTEB(35, 40, 35, 20),
                //   child: Material(
                //     borderRadius: BorderRadius.circular(20),
                //     elevation: 20,
                //     child: FFButtonWidget(
                //       onPressed: () {
                //         print("Button pressed");
                //         if (_formKey.currentState != null && _formKey.currentState!.validate()) {
                //           final email = _emailController.text;
                //           final password = _passwordController.text;
                //           context.read<SignInBloc>().add(SignInFetchDataEvent(email, password));
                //         }
                //       },
                //       text: 'Sign In',
                //       options: FFButtonOptions(
                //         width: double.infinity,
                //         height: 50,
                //         padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                //         iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                //         color: Color(0xFFFA6A68),
                //         textStyle:
                //         CustomTheme.of(context).titleSmall.override(
                //           fontFamily: 'Poppins',
                //           color: Colors.white,
                //         ),
                //         borderSide: BorderSide(
                //           color: Colors.transparent,
                //           width: 1,
                //         ),
                //         borderRadius: BorderRadius.circular(16),
                //       ),
                //     ),
                //   ),
                // ),

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
      );
  },
),
),
    );
  }
}
