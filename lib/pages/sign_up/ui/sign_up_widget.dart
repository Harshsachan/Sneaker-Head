// //import '/flutter_flow/flutter_flow_icon_button.dart';
// import 'package:testproject/flutter_flow/flutter_flow_icon_button.dart';
// import 'package:testproject/flutter_flow/flutter_flow_model.dart';
//
// import '../../sign_in/sign_in.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import '../sign_up_model.dart';
// export '../sign_up_model.dart';
//
// class SignUpWidget extends StatefulWidget {
//   const SignUpWidget({Key? key}) : super(key: key);
//
//   @override
//   _SignUpWidgetState createState() => _SignUpWidgetState();
// }
//
// class _SignUpWidgetState extends State<SignUpWidget> {
//   late SignUpModel _model;
//
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//   final _unfocusNode = FocusNode();
//
//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => SignUpModel());
//
//     _model.textController1 ??= TextEditingController();
//     _model.textController2 ??= TextEditingController();
//   }
//
//   @override
//   void dispose() {
//     _model.dispose();
//
//     _unfocusNode.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: scaffoldKey,
//       backgroundColor: CustomTheme.of(context).primaryBackground,
//       body: SafeArea(
//         child: Container(
//           width: double.infinity,
//           height: double.infinity,
//           decoration: BoxDecoration(
//             color: CustomTheme.of(context).lineColor,
//           ),
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.max,
//               children: [
//                 Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(0.0, 125.0, 0.0, 0.0),
//                   child: Text(
//                     'Hello Mate ',
//                     style: CustomTheme.of(context).headlineMedium.override(
//                           fontFamily: 'Poppins',
//                           fontSize: 30.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
//                   child: Text(
//                     'Create Your Account',
//                     style: CustomTheme.of(context).bodyMedium.override(
//                           fontFamily: 'Poppins',
//                           fontSize: 20.0,
//                           fontWeight: FontWeight.normal,
//                         ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
//                   child: Text(
//                     'Below',
//                     style: CustomTheme.of(context).bodyMedium.override(
//                           fontFamily: 'Poppins',
//                           fontSize: 18.0,
//                           fontWeight: FontWeight.normal,
//                         ),
//                   ),
//                 ),
//                 Align(
//                   alignment: AlignmentDirectional(0.0, 0.0),
//                   child: Padding(
//                     padding:
//                         EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
//                     child: Container(
//                       width: MediaQuery.of(context).size.width * 0.8,
//                       child: Material(
//                         borderRadius: BorderRadius.circular(20),
//                         elevation: 20,
//                         child: TextFormField(
//                           controller: _model.textController1,
//                           autofocus: false,
//                           obscureText: false,
//                           decoration: InputDecoration(
//                             labelText: 'Enter Your Email',
//                             hintText: 'example@gmail.com',
//                             hintStyle:
//                                 CustomTheme.of(context).bodySmall.override(
//                                       fontFamily: 'Poppins',
//                                       color: CustomTheme.of(context).accent1,
//                                     ),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: CustomTheme.of(context)
//                                     .secondaryBackground,
//                                 width: 1.0,
//                               ),
//                               borderRadius: BorderRadius.circular(10.0),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: CustomTheme.of(context)
//                                     .secondaryBackground,
//                                 width: 1.0,
//                               ),
//                               borderRadius: BorderRadius.circular(10.0),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: CustomTheme.of(context)
//                                     .secondaryBackground,
//                                 width: 1.0,
//                               ),
//                               borderRadius: BorderRadius.circular(10.0),
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: CustomTheme.of(context)
//                                     .secondaryBackground,
//                                 width: 1.0,
//                               ),
//                               borderRadius: BorderRadius.circular(10.0),
//                             ),
//                             filled: true,
//                             fillColor:
//                                 CustomTheme.of(context).secondaryBackground,
//                             contentPadding: EdgeInsetsDirectional.fromSTEB(
//                                 10.0, 0.0, 0.0, 0.0),
//                           ),
//                           style: CustomTheme.of(context).bodyMedium.override(
//                                 fontFamily: 'Poppins',
//                                 color: CustomTheme.of(context).accent1,
//                               ),
//                           validator: _model.textController1Validator
//                               .asValidator(context),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Align(
//                   alignment: AlignmentDirectional(0.0, 0.0),
//                   child: Padding(
//                     padding:
//                         EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
//                     child: Container(
//                       width: MediaQuery.of(context).size.width * 0.8,
//                       child: Material(
//                         borderRadius: BorderRadius.circular(20),
//                         elevation: 20,
//                         child: TextFormField(
//                           controller: _model.textController2,
//                           autofocus: false,
//                           obscureText: !_model.passwordVisibility,
//                           decoration: InputDecoration(
//                             labelText: 'Password',
//                             hintStyle:
//                                 CustomTheme.of(context).bodySmall.override(
//                                       fontFamily: 'Poppins',
//                                       color: CustomTheme.of(context).accent1,
//                                     ),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: CustomTheme.of(context)
//                                     .secondaryBackground,
//                                 width: 1.0,
//                               ),
//                               borderRadius: BorderRadius.circular(10.0),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: CustomTheme.of(context)
//                                     .secondaryBackground,
//                                 width: 1.0,
//                               ),
//                               borderRadius: BorderRadius.circular(10.0),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: CustomTheme.of(context)
//                                     .secondaryBackground,
//                                 width: 1.0,
//                               ),
//                               borderRadius: BorderRadius.circular(10.0),
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: CustomTheme.of(context)
//                                     .secondaryBackground,
//                                 width: 1.0,
//                               ),
//                               borderRadius: BorderRadius.circular(10.0),
//                             ),
//                             filled: true,
//                             fillColor:
//                                 CustomTheme.of(context).secondaryBackground,
//                             contentPadding: EdgeInsetsDirectional.fromSTEB(
//                                 10.0, 0.0, 0.0, 0.0),
//                             suffixIcon: InkWell(
//                               onTap: () => setState(
//                                 () => _model.passwordVisibility =
//                                     !_model.passwordVisibility,
//                               ),
//                               focusNode: FocusNode(skipTraversal: true),
//                               child: Icon(
//                                 _model.passwordVisibility
//                                     ? Icons.visibility_outlined
//                                     : Icons.visibility_off_outlined,
//                                 size: 10.0,
//                               ),
//                             ),
//                           ),
//                           style: CustomTheme.of(context).bodyMedium.override(
//                                 fontFamily: 'Poppins',
//                                 color: CustomTheme.of(context).accent1,
//                               ),
//                           validator: _model.textController2Validator
//                               .asValidator(context),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 // Padding(
//                 //   padding:
//                 //       EdgeInsetsDirectional.fromSTEB(180.0, 15.0, 0.0, 0.0),
//                 //   child: AutoSizeText(
//                 //     'Forget Password',
//                 //     style: FlutterFlowTheme.of(context).bodyMedium.override(
//                 //           fontFamily: 'Poppins',
//                 //           fontSize: 14.0,
//                 //           fontWeight: FontWeight.w200,
//                 //         ),
//                 //   ),
//                 // ),
//                 Padding(
//                   padding:
//                       EdgeInsetsDirectional.fromSTEB(35.0, 40.0, 35.0, 20.0),
//                   child: Material(
//                     borderRadius: BorderRadius.circular(20),
//                     elevation: 20,
//                     child: FFButtonWidget(
//                       onPressed: () {
//                         print('Button pressed ...');
//                       },
//                       text: 'Sign Up',
//                       options: FFButtonOptions(
//                         width: double.infinity,
//                         height: 50.0,
//                         padding:
//                             EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
//                         iconPadding:
//                             EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
//                         color: Color(0xFFFA6A68),
//                         textStyle:
//                             CustomTheme.of(context).titleSmall.override(
//                                   fontFamily: 'Poppins',
//                                   color: Colors.white,
//                                 ),
//                         borderSide: BorderSide(
//                           color: Colors.transparent,
//                           width: 1.0,
//                         ),
//                         borderRadius: BorderRadius.circular(16.0),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
//                   child: Text(
//                     'Or continue with',
//                     style: CustomTheme.of(context).bodyMedium.override(
//                           fontFamily: 'Poppins',
//                           fontWeight: FontWeight.w200,
//                         ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Container(
//                         width: 75.0,
//                         height: 75.0,
//                         decoration: BoxDecoration(
//                           color:
//                               CustomTheme.of(context).secondaryBackground,
//                           borderRadius: BorderRadius.circular(5.0),
//                         ),
//                         child: Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(
//                               2.0, 2.0, 2.0, 2.0),
//                           child: Material(
//                             borderRadius: BorderRadius.circular(5),
//                             elevation: 20,
//                             child: FlutterFlowIconButton(
//                               borderColor: Colors.transparent,
//                               borderRadius: 5.0,
//                               borderWidth: 1.0,
//                               buttonSize: 60.0,
//                               fillColor: CustomTheme.of(context).lineColor,
//                               icon: FaIcon(
//                                 FontAwesomeIcons.google,
//                                 color: CustomTheme.of(context).primaryText,
//                                 size: 30.0,
//                               ),
//                               onPressed: () {
//                                 print('IconButton pressed ...');
//                               },
//                             ),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         width: 75.0,
//                         height: 75.0,
//                         decoration: BoxDecoration(
//                           color:
//                               CustomTheme.of(context).secondaryBackground,
//                           borderRadius: BorderRadius.circular(5.0),
//                         ),
//                         child: Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(
//                               2.0, 2.0, 2.0, 2.0),
//                           child: Material(
//                             borderRadius: BorderRadius.circular(5),
//                             elevation: 20.0,
//                             child: FlutterFlowIconButton(
//                               borderColor: Colors.transparent,
//                               borderRadius: 5.0,
//                               borderWidth: 1.0,
//                               buttonSize: 60.0,
//                               fillColor: CustomTheme.of(context).lineColor,
//                               icon: FaIcon(
//                                 FontAwesomeIcons.apple,
//                                 color: CustomTheme.of(context).primaryText,
//                                 size: 30.0,
//                               ),
//                               onPressed: () {
//                                 print('IconButton pressed ...');
//                               },
//                             ),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         width: 75.0,
//                         height: 75.0,
//                         decoration: BoxDecoration(
//                           color:
//                               CustomTheme.of(context).secondaryBackground,
//                           borderRadius: BorderRadius.circular(5.0),
//                         ),
//                         child: Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(
//                               2.0, 2.0, 2.0, 2.0),
//                           child: Material(
//                             borderRadius: BorderRadius.circular(5),
//                             elevation: 20.0,
//                             child: FlutterFlowIconButton(
//                               borderColor: Colors.transparent,
//                               borderRadius: 5.0,
//                               borderWidth: 1.0,
//                               buttonSize: 60.0,
//                               fillColor: CustomTheme.of(context).lineColor,
//                               icon: FaIcon(
//                                 FontAwesomeIcons.facebook,
//                                 color: CustomTheme.of(context).primaryText,
//                                 size: 30.0,
//                               ),
//                               onPressed: () {
//                                 print('IconButton pressed ...');
//                               },
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
//                   child: InkWell(
//                     splashColor: Colors.transparent,
//                     focusColor: Colors.transparent,
//                     hoverColor: Colors.transparent,
//                     highlightColor: Colors.transparent,
//                     onTap: () async {
//                       await Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => SignInWidget(),
//                         ),
//                       );
//                     },
//                     child: RichText(
//                       text: TextSpan(
//                         children: [
//                           TextSpan(
//                             text: 'SIGN IN ?',
//                             style: TextStyle(),
//                           )
//                         ],
//                         style: CustomTheme.of(context).bodyMedium.override(
//                           fontFamily: 'Poppins',
//                           color: CustomTheme.of(context).info,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//           ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



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


class CreateUserPage extends StatefulWidget {
  final SignUpRepo userRepository;

  CreateUserPage(this.userRepository);

  @override
  _CreateUserPageState createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {
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
      appBar: AppBar(
        title: Text('Create User'),
      ),
      body: BlocProvider(
        create: (_) => SignUpBloc(widget.userRepository),
        child: BlocConsumer<SignUpBloc, SignUpPageState>(
          listener: (context, state) {
            if (state is SignUpPageSuccessState) {
              SignUp userDetails = state.signup;
              print("User Created Successfully");
              print(state.signup);
              print(userDetails);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => MyHomePage(userDetails:userDetails),
              //   ),
              // );
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

            return Padding(
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter an email';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(labelText: 'Password'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        print("sign up clicked");
                        if (_formKey.currentState!.validate()) {
                          final email = _emailController.text;
                          final password = _passwordController.text;
                          context.read<SignUpBloc>().add(SignUpPostEvent(email, password));
                        }
                      },
                      child: Text('Create'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
