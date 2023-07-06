import 'package:blurry/blurry.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testproject/main.dart';
import 'package:testproject/pages/memory/email.dart';
import 'package:testproject/pages/memory/user_details.dart';
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
  EmailService emailService =EmailService();
  UserDetailsService userDetailsService=UserDetailsService();

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
              print("From SShared Preference");
              userDetailsService.storeUserDataInSharedPreferences(userDetails);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
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
            if (state is SignInPageLoadingState) {
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
                            final email = _emailController.text;
                            final password = _passwordController.text;
                            String userEmail= _emailController.text;
                            await emailService.saveUserEmail(userEmail);
                            context.read<SignInBloc>().add(SignInFetchDataEvent(email, password));
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
                                  'SIGN IN',
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
                                builder: (context) => SignUpPage(SignUpRepo()),
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
// class Check extends StatelessWidget {
//   const Check({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(16.0),
//       child: Form(
//         key: _formKey,
//         child: Column(
//           children: [
//             TextFormField(
//               controller: _emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//               validator: (value) {
//                 if (value!.isEmpty) {
//                   return 'Please enter an email';
//                 }
//                 return null;
//               },
//             ),
//             TextFormField(
//               controller: _passwordController,
//               decoration: InputDecoration(labelText: 'Password'),
//               validator: (value) {
//                 if (value!.isEmpty) {
//                   return 'Please enter a password';
//                 }
//                 return null;
//               },
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 print("sign up clicked");
//                 if (_formKey.currentState!.validate()) {
//                   final email = _emailController.text;
//                   final password = _passwordController.text;
//                   context.read<SignUpBloc>().add(SignUpPostEvent(email, password));
//                 }
//               },
//               child: Text('Create'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }