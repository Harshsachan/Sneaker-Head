//import '/flutter_flow/flutter_flow_icon_button.dart';
import 'package:lottie/lottie.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:testproject/flutter_flow/flutter_flow_icon_button.dart';
import 'package:testproject/flutter_flow/flutter_flow_model.dart';
import 'package:testproject/pages/memory/email.dart';
import 'package:testproject/pages/sign_in/repo/signIn_repo.dart';
import 'package:testproject/pages/sign_in/ui/sign_in.dart';
import 'package:testproject/pages/user/repo/createUser_repo.dart';
import 'package:testproject/pages/user/ui/createUser.dart';

// import '../../sign_in/sign_in.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../sign_up_model.dart';
export '../sign_up_model.dart';



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:testproject/main.dart';
import 'package:testproject/pages/nav_bar/nav_bar.dart';
import 'package:testproject/pages/sign_up/bloc/signUp_bloc.dart';
import 'package:testproject/pages/sign_up/bloc/signUp_event.dart';
import 'package:testproject/pages/sign_up/bloc/signUp_state.dart';
import 'package:testproject/pages/sign_up/repo/signUp_repo.dart';


import '../repo/signUp_model.dart';


class SignUpPage extends StatefulWidget {
  final SignUpRepo userRepository;

  SignUpPage(this.userRepository);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  EmailService emailService =EmailService();
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Create User'),
      // ),
      body: BlocProvider(
        create: (_) => SignUpBloc(widget.userRepository),
        child: BlocConsumer<SignUpBloc, SignUpPageState>(
          listener: (context, state) {
            if (state is SignUpPageSuccessState) {
              SignUp userDetails = state.signup;
              print("User Created Successfully");
              print(state.signup);
              print(userDetails);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreateUser(CreateUserRepo()),
                ),
              );
              // User created successfully, navigate to another page or show a success message
            } else if (state is SignUpPageErrorState) {
              print("in error state");
              final err =state.error;
              print(err.toString());
              Center(child: Text("tu ${err.toString()}"),);
              // Handle error, show an error message
            }
          },
          builder: (context, state) {
            if (state is SignUpPageLoadingState) {
              return Center(child: CircularProgressIndicator());
            }

            return SafeArea(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: CustomTheme.of(context).pBackground,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Lottie.network(
                        'https://assets5.lottiefiles.com/packages/lf20_wxgsv6qg.json',
                        width: MediaQuery.of(context).size.width*0.75,
                        height: MediaQuery.of(context).size.width*0.5,
                        fit: BoxFit.cover,
                        frameRate: FrameRate(120),
                        repeat: true,
                        animate: true,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                        child: Text(
                          'Welcome !',
                          style:
                          CustomTheme.of(context).headlineMedium.override(
                            color:CustomTheme.of(context).secondaryBackground,
                            fontFamily: 'Poppins',
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                        child: Text(
                          'Create Your Account Below',
                          style:
                          CustomTheme.of(context).headlineMedium.override(
                            color:CustomTheme.of(context).secondaryBackground,
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
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
                                        // validator: (value) {
                                        //   if (value == null || value.isEmpty) {
                                        //     return 'Please enter your email';
                                        //   }
                                        //
                                        //   // Email validation using regex
                                        //   final emailRegex = RegExp(
                                        //       r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
                                        //   if (!emailRegex.hasMatch(value)) {
                                        //     return 'Please enter a valid email';
                                        //   }
                                        //
                                        //   return null;
                                        // },
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
                        padding: EdgeInsetsDirectional.fromSTEB(180, 15, 0, 15),
                        child: AutoSizeText(
                          'Forget Password ?',
                          style: CustomTheme.of(context).bodyMedium.override(
                            color:CustomTheme.of(context).secondaryBackground,
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ),
                      // Signin Button
                      Container(
                        width: MediaQuery.of(context).size.width*0.45,
                        child: NeoPopButton(
                          color: const Color.fromRGBO(0, 0, 0, 1),
                          buttonPosition: Position.center,
                          onTapUp: () async{
                            // if (_formKey.currentState!.validate()) {
                            // }
                            final email = _emailController.text;
                            final password = _passwordController.text;
                            String userEmail= _emailController.text;
                            await emailService.saveUserEmail(userEmail);
                            context.read<SignUpBloc>().add(SignUpPostEvent(email, password));
                          },
                          border:  Border.fromBorderSide(
                            BorderSide(color: Colors.white, width: .5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:  [
                                AutoSizeText(
                                  'SIGN UP',
                                  style: CustomTheme.of(context).bodyMedium.override(
                                    color:CustomTheme.of(context).secondaryBackground,
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Text(
                          'Or continue with',
                          style: CustomTheme.of(context).bodyMedium.override(
                            color:CustomTheme.of(context).primaryBackground,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
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
                      Container(
                        width: MediaQuery.of(context).size.width*0.25,
                        child: NeoPopButton(
                          color: const Color.fromRGBO(0, 0, 0, 1),
                          buttonPosition: Position.center,
                          onTapUp: () async{
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  SignInWidget(SignInrepo())
                              ),
                            );
                          },
                          border:  Border.fromBorderSide(
                            BorderSide(color: Colors.white, width: .5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:  [
                                AutoSizeText(
                                  'SIGN IN ',
                                  style: CustomTheme.of(context).bodyMedium.override(
                                    color:CustomTheme.of(context).secondaryBackground,
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      //   child: InkWell(
                      //     splashColor: Colors.transparent,
                      //     focusColor: Colors.transparent,
                      //     hoverColor: Colors.transparent,
                      //     highlightColor: Colors.transparent,
                      //     onTap: () async {
                      //       await Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //           builder: (context) => CreateUserPage(SignUpRepo()),
                      //         ),
                      //       );
                      //     },
                      //     child: RichText(
                      //       text: TextSpan(
                      //         children: [
                      //           TextSpan(
                      //             text: 'SIGN UP',
                      //             style: TextStyle(),
                      //           )
                      //         ],
                      //         style: CustomTheme.of(context).bodyMedium.override(
                      //           fontFamily: 'Poppins',
                      //           color: CustomTheme.of(context).info,
                      //           fontSize: 16,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
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

