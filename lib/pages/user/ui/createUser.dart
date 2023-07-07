import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:neopop/widgets/buttons/neopop_tilted_button/neopop_tilted_button.dart';
import 'package:SneakerHead/flutter_flow/flutter_flow_theme.dart';
import 'package:SneakerHead/main.dart';
import 'package:SneakerHead/pages/memory/email.dart';
import 'package:SneakerHead/pages/memory/user_details.dart';
import 'package:SneakerHead/pages/sign_in/repo/signIn_model.dart';
import 'package:SneakerHead/pages/user/repo/createUser_repo.dart';

import '../bloc/createUser_bloc.dart';
import '../bloc/createUser_event.dart';
import '../bloc/createUser_state.dart';

class CreateUser extends StatefulWidget {
  final CreateUserRepo createUserRepo;
   // CreateUser({Key? key,required this.createUserRepo}) : super(key: key);
  CreateUser(this.createUserRepo);

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  EmailService emailService =EmailService();
  UserDetailsService userDetailsService=UserDetailsService();
  String? userEmail ="";

  @override
  void initState() {
    // TODO: implement initState
    loadUserEmail();
    super.initState();
  }
  void loadUserEmail() async{
    String? gotUserEmail= await emailService.getUserEmail();
    setState(() {
      userEmail=gotUserEmail;
    });
    
  }

  // FORM CONTROLLER
  final _formKey = GlobalKey<FormState>();
  final _fNameController = TextEditingController();
  final _lNameController = TextEditingController();
  //final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _houseNoController = TextEditingController();
  final _streetController = TextEditingController();
  final _areaController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _pincodeController = TextEditingController();
  late LoggedInData loggedInData;

  void sendDataToServer() async {
    // Get the data from the controller
    String fName = _fNameController.text;
    String lName = _lNameController.text;
    //String email = _emailController.text;
    String number = _phoneController.text;
    String house_no = _houseNoController.text;
    String street = _streetController.text;
    String area = _areaController.text;
    String city = _cityController.text;
    String state = _stateController.text;
    String pincode = _pincodeController.text;

    // Get other data from the controller as needed

    //Create an Instance of LoggedInData with the collected data
    loggedInData = LoggedInData(
      fName: fName,
      lName: lName,
      email: userEmail,
      number: int.tryParse(number),
      houseNo: house_no,
      street: street,
      area: area,
      city: city,
      state: state,
      pincode: int.tryParse(pincode),
    );
    // Create the event with the logged in data
    //context.read<CreateUserBloc>().add(CreateUserPostUserDataEvent(loggedInData));
    // CreateUserPostUserDataEvent event = CreateUserPostUserDataEvent(loggedInData);
    //
    // // Dispatch the event to the appropriate bloc or handler
    // context.read<CreateUserBloc>().add(event);

    // Create the data payload
    // var data = {
    //   'fName': fName,
    //   'lName': lName,
    //   'email':userEmail,
    //   'number':number,
    //   'house_no':house_no,
    //   'street':street,
    //   'area':area,
    //   'city':city,
    //   'state':state,
    //   'pincode':pincode,
    //   // Add other properties as needed
    // };
    // print("ddata");
    // print('${data}');
  }



  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: CustomTheme.of(context).primaryText,
      appBar: AppBar(
        backgroundColor: CustomTheme.of(context).primaryText,
        elevation: 1,
        centerTitle: true,
        title: AutoSizeText('Create Account'),
      ),
      body: BlocProvider(
            create: (_) => CreateUserBloc(widget.createUserRepo),
            child: BlocConsumer<CreateUserBloc, CreateUserPageState>(
                listener: (context, state) {
                  // TODO: implement listener
                  if (state is CreateUserPageSuccessState){
                    print("user data posted successfully in db");
                    LoggedInData userDetails = state.loggedInData;
                    print(state.loggedInData.toJson());
                    print(userDetails);
                    userDetailsService.storeUserDataInSharedPreferences(userDetails);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyHomePage(),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is CreateUserPageLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return SafeArea(
                                top: true,
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: SingleChildScrollView(
                                        child: Container(
                                            decoration: BoxDecoration(
                                              color: CustomTheme.of(context).primaryText,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height*0.025, 0, MediaQuery.of(context).size.height*0.05),
                                              child: Form(
                                                key: _formKey,
                                                child: Column(
                                                  children: [
                                                    Align(
                                                      alignment: AlignmentDirectional(0, 0),
                                                      child: Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                                        child: Container(
                                                          width: MediaQuery.of(context).size.width * 0.9,
                                                          child: Material(
                                                            borderRadius: BorderRadius.circular(10),
                                                            elevation: 5,
                                                            shadowColor: Colors.white,
                                                            child: TextFormField(
                                                              controller: _fNameController,
                                                              autofocus: false,
                                                              obscureText: false,
                                                              decoration: InputDecoration(
                                                                labelText: 'Enter Your First Name',
                                                                labelStyle: CustomTheme.of(context)
                                                                    .bodySmall
                                                                    .override(
                                                                  fontFamily: 'Poppins',
                                                                  color: CustomTheme.of(context)
                                                                      .secondaryBackground,
                                                                ),
                                                                hintText: 'First Name',
                                                                hintStyle: CustomTheme.of(context)
                                                                    .bodySmall
                                                                    .override(
                                                                  fontFamily: 'Poppins',
                                                                  color: CustomTheme.of(context)
                                                                      .secondaryBackground,
                                                                ),
                                                                enabledBorder: OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                    color: CustomTheme.of(context)
                                                                        .secondaryText,
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
                                                                fillColor: CustomTheme.of(context).forBtn,
                                                                contentPadding:
                                                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                              ),
                                                              style: CustomTheme.of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                fontFamily: 'Poppins',
                                                                color: CustomTheme.of(context).primaryBackground,
                                                              ),
                                                              validator: (value) {
                                                                if (value == null || value.isEmpty) {
                                                                  return 'Please enter your first name';
                                                                }
                                                                return null;
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment: AlignmentDirectional(0, 0),
                                                      child: Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                                        child: Container(
                                                          width: MediaQuery.of(context).size.width * 0.9,
                                                          child: Material(
                                                            borderRadius: BorderRadius.circular(10),
                                                            elevation: 5,
                                                            shadowColor: Colors.white,
                                                            child: TextFormField(
                                                              controller: _lNameController,
                                                              autofocus: false,
                                                              obscureText: false,
                                                              decoration: InputDecoration(
                                                                labelText: 'Enter Your Last Name',
                                                                labelStyle: CustomTheme.of(context)
                                                                    .bodySmall
                                                                    .override(
                                                                  fontFamily: 'Poppins',
                                                                  color: CustomTheme.of(context)
                                                                      .secondaryBackground,
                                                                ),
                                                                hintText: 'Last Name',
                                                                hintStyle: CustomTheme.of(context)
                                                                    .bodySmall
                                                                    .override(
                                                                  fontFamily: 'Poppins',
                                                                  color: CustomTheme.of(context)
                                                                      .secondaryBackground,
                                                                ),
                                                                enabledBorder: OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                    color: CustomTheme.of(context)
                                                                        .secondaryText,
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
                                                                fillColor: CustomTheme.of(context).forBtn,
                                                                contentPadding:
                                                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                              ),
                                                              style: CustomTheme.of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                fontFamily: 'Poppins',
                                                                color: CustomTheme.of(context).primaryBackground,
                                                              ),
                                                              validator: (value) {
                                                                if (value == null || value.isEmpty) {
                                                                  return 'Please enter your last name';
                                                                }
                                                                return null;
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment: AlignmentDirectional(0, 0),
                                                      child: Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                                        child: Container(
                                                          width: MediaQuery.of(context).size.width * 0.9,
                                                          child: Material(
                                                            borderRadius: BorderRadius.circular(10),
                                                            elevation: 5,
                                                            shadowColor: Colors.white,
                                                            child: TextFormField(
                                                              enabled: false,
                                                              // controller: _emailController,
                                                              autofocus: false,
                                                              obscureText: false,
                                                              decoration: InputDecoration(
                                                                labelText: '${userEmail}',
                                                                labelStyle: CustomTheme.of(context)
                                                                    .bodySmall
                                                                    .override(
                                                                  fontFamily: 'Poppins',
                                                                  color: CustomTheme.of(context)
                                                                      .secondaryBackground,
                                                                ),
                                                                hintText: '${userEmail}',
                                                                hintStyle: CustomTheme.of(context)
                                                                    .bodySmall
                                                                    .override(
                                                                  fontFamily: 'Poppins',
                                                                  color: CustomTheme.of(context)
                                                                      .secondaryBackground,
                                                                ),
                                                                enabledBorder: OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                    color: CustomTheme.of(context)
                                                                        .secondaryText,
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
                                                                fillColor: CustomTheme.of(context).forBtn,
                                                                contentPadding:
                                                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                              ),
                                                              style: CustomTheme.of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                fontFamily: 'Poppins',
                                                                color: CustomTheme.of(context).primaryBackground,
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
                                                    Align(
                                                      alignment: AlignmentDirectional(0, 0),
                                                      child: Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                                        child: Container(
                                                          width: MediaQuery.of(context).size.width * 0.9,
                                                          child: Material(
                                                            borderRadius: BorderRadius.circular(10),
                                                            elevation: 5,
                                                            shadowColor: Colors.white,
                                                            child: TextFormField(
                                                              controller: _phoneController,
                                                              autofocus: false,
                                                              obscureText: false,
                                                              decoration: InputDecoration(
                                                                labelText: 'Enter Your Phone Number',
                                                                labelStyle: CustomTheme.of(context)
                                                                    .bodySmall
                                                                    .override(
                                                                  fontFamily: 'Poppins',
                                                                  color: CustomTheme.of(context)
                                                                      .secondaryBackground,
                                                                ),
                                                                hintText: '8400370072',
                                                                hintStyle: CustomTheme.of(context)
                                                                    .bodySmall
                                                                    .override(
                                                                  fontFamily: 'Poppins',
                                                                  color: CustomTheme.of(context)
                                                                      .secondaryBackground,
                                                                ),
                                                                enabledBorder: OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                    color: CustomTheme.of(context)
                                                                        .secondaryText,
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
                                                                fillColor: CustomTheme.of(context).forBtn,
                                                                contentPadding:
                                                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                              ),
                                                              style: CustomTheme.of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                fontFamily: 'Poppins',
                                                                color: CustomTheme.of(context).primaryBackground,
                                                              ),
                                                              validator: (value) {
                                                                if (value == null || value.isEmpty) {
                                                                  return 'Please enter your Phone Number';
                                                                }

                                                                // Email validation using regex
                                                                RegExp phoneRegex = RegExp(r'^\d{10}$');

                                                                // RegExp phoneRegex = RegExp(r'^\+?\d{1,3}[-.\s]?\(?\d{1,3}\)?[-.\s]?\d{1,4}[-.\s]?\d{1,4}[-.\s]?\d{1,9}$');
                                                                if (!phoneRegex.hasMatch(value)) {
                                                                  return 'Please enter a valid Phone number';
                                                                }

                                                                return null;
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment: AlignmentDirectional(0, 0),
                                                      child: Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                                        child: Container(
                                                          width: MediaQuery.of(context).size.width * 0.9,
                                                          child: Material(
                                                            borderRadius: BorderRadius.circular(10),
                                                            elevation: 5,
                                                            shadowColor: Colors.white,
                                                            child: TextFormField(
                                                              controller: _houseNoController,
                                                              autofocus: false,
                                                              obscureText: false,
                                                              decoration: InputDecoration(
                                                                labelText: 'Enter Your House No. / Building name',
                                                                labelStyle: CustomTheme.of(context)
                                                                    .bodySmall
                                                                    .override(
                                                                  fontFamily: 'Poppins',
                                                                  color: CustomTheme.of(context)
                                                                      .secondaryBackground,
                                                                ),
                                                                hintText: 'Flat no - 104',
                                                                hintStyle: CustomTheme.of(context)
                                                                    .bodySmall
                                                                    .override(
                                                                  fontFamily: 'Poppins',
                                                                  color: CustomTheme.of(context)
                                                                      .secondaryBackground,
                                                                ),
                                                                enabledBorder: OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                    color: CustomTheme.of(context)
                                                                        .secondaryText,
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
                                                                fillColor: CustomTheme.of(context).forBtn,
                                                                contentPadding:
                                                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                              ),
                                                              style: CustomTheme.of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                fontFamily: 'Poppins',
                                                                color: CustomTheme.of(context).primaryBackground,
                                                              ),
                                                              validator: (value) {
                                                                if (value == null || value.isEmpty) {
                                                                  return 'Please enter your House Number';
                                                                }
                                                                return null;
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment: AlignmentDirectional(0, 0),
                                                      child: Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                                        child: Container(
                                                          width: MediaQuery.of(context).size.width * 0.9,
                                                          child: Material(
                                                            borderRadius: BorderRadius.circular(10),
                                                            elevation: 5,
                                                            shadowColor: Colors.white,
                                                            child: TextFormField(
                                                              controller: _streetController,
                                                              autofocus: false,
                                                              obscureText: false,
                                                              decoration: InputDecoration(
                                                                labelText: 'Enter Your Street Name',
                                                                labelStyle: CustomTheme.of(context)
                                                                    .bodySmall
                                                                    .override(
                                                                  fontFamily: 'Poppins',
                                                                  color: CustomTheme.of(context)
                                                                      .secondaryBackground,
                                                                ),
                                                                hintText: 'Street Name',
                                                                hintStyle: CustomTheme.of(context)
                                                                    .bodySmall
                                                                    .override(
                                                                  fontFamily: 'Poppins',
                                                                  color: CustomTheme.of(context)
                                                                      .secondaryBackground,
                                                                ),
                                                                enabledBorder: OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                    color: CustomTheme.of(context)
                                                                        .secondaryText,
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
                                                                fillColor: CustomTheme.of(context).forBtn,
                                                                contentPadding:
                                                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                              ),
                                                              style: CustomTheme.of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                fontFamily: 'Poppins',
                                                                color: CustomTheme.of(context).primaryBackground,
                                                              ),
                                                              validator: (value) {
                                                                if (value == null || value.isEmpty) {
                                                                  return 'Please enter your Street Name';
                                                                }
                                                                return null;
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment: AlignmentDirectional(0, 0),
                                                      child: Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                                        child: Container(
                                                          width: MediaQuery.of(context).size.width * 0.9,
                                                          child: Material(
                                                            borderRadius: BorderRadius.circular(10),
                                                            elevation: 5,
                                                            shadowColor: Colors.white,
                                                            child: TextFormField(
                                                              controller: _areaController,
                                                              autofocus: false,
                                                              obscureText: false,
                                                              decoration: InputDecoration(
                                                                labelText: 'Enter Your Area',
                                                                labelStyle: CustomTheme.of(context)
                                                                    .bodySmall
                                                                    .override(
                                                                  fontFamily: 'Poppins',
                                                                  color: CustomTheme.of(context)
                                                                      .secondaryBackground,
                                                                ),
                                                                hintText: 'Area ',
                                                                hintStyle: CustomTheme.of(context)
                                                                    .bodySmall
                                                                    .override(
                                                                  fontFamily: 'Poppins',
                                                                  color: CustomTheme.of(context)
                                                                      .secondaryBackground,
                                                                ),
                                                                enabledBorder: OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                    color: CustomTheme.of(context)
                                                                        .secondaryText,
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
                                                                fillColor: CustomTheme.of(context).forBtn,
                                                                contentPadding:
                                                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                              ),
                                                              style: CustomTheme.of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                fontFamily: 'Poppins',
                                                                color: CustomTheme.of(context).primaryBackground,
                                                              ),
                                                              validator: (value) {
                                                                if (value == null || value.isEmpty) {
                                                                  return 'Please enter your Area Name';
                                                                }
                                                                return null;
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment: AlignmentDirectional(0, 0),
                                                      child: Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                                        child: Container(
                                                          width: MediaQuery.of(context).size.width * 0.9,
                                                          child: Material(
                                                            borderRadius: BorderRadius.circular(10),
                                                            elevation: 5,
                                                            shadowColor: Colors.white,
                                                            child: TextFormField(
                                                              controller: _cityController,
                                                              autofocus: false,
                                                              obscureText: false,
                                                              decoration: InputDecoration(
                                                                labelText: 'Enter Your City',
                                                                labelStyle: CustomTheme.of(context)
                                                                    .bodySmall
                                                                    .override(
                                                                  fontFamily: 'Poppins',
                                                                  color: CustomTheme.of(context)
                                                                      .secondaryBackground,
                                                                ),
                                                                hintText: 'City (Hyderabad)',
                                                                hintStyle: CustomTheme.of(context)
                                                                    .bodySmall
                                                                    .override(
                                                                  fontFamily: 'Poppins',
                                                                  color: CustomTheme.of(context)
                                                                      .secondaryBackground,
                                                                ),
                                                                enabledBorder: OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                    color: CustomTheme.of(context)
                                                                        .secondaryText,
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
                                                                fillColor: CustomTheme.of(context).forBtn,
                                                                contentPadding:
                                                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                              ),
                                                              style: CustomTheme.of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                fontFamily: 'Poppins',
                                                                color: CustomTheme.of(context).primaryBackground,
                                                              ),
                                                              validator: (value) {
                                                                if (value == null || value.isEmpty) {
                                                                  return 'Please enter your City Name';
                                                                }
                                                                return null;
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment: AlignmentDirectional(0, 0),
                                                      child: Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                                        child: Container(
                                                          width: MediaQuery.of(context).size.width * 0.9,
                                                          child: Material(
                                                            borderRadius: BorderRadius.circular(10),
                                                            elevation: 5,
                                                            shadowColor: Colors.white,
                                                            child: TextFormField(
                                                              controller: _stateController,
                                                              autofocus: false,
                                                              obscureText: false,
                                                              decoration: InputDecoration(
                                                                labelText: 'Enter Your State',
                                                                labelStyle: CustomTheme.of(context)
                                                                    .bodySmall
                                                                    .override(
                                                                  fontFamily: 'Poppins',
                                                                  color: CustomTheme.of(context)
                                                                      .secondaryBackground,
                                                                ),
                                                                hintText: 'Telangana',
                                                                hintStyle: CustomTheme.of(context)
                                                                    .bodySmall
                                                                    .override(
                                                                  fontFamily: 'Poppins',
                                                                  color: CustomTheme.of(context)
                                                                      .secondaryBackground,
                                                                ),
                                                                enabledBorder: OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                    color: CustomTheme.of(context)
                                                                        .secondaryText,
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
                                                                fillColor: CustomTheme.of(context).forBtn,
                                                                contentPadding:
                                                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                              ),
                                                              style: CustomTheme.of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                fontFamily: 'Poppins',
                                                                color: CustomTheme.of(context).primaryBackground,
                                                              ),
                                                              validator: (value) {
                                                                if (value == null || value.isEmpty) {
                                                                  return 'Please enter your State Name';
                                                                }
                                                                return null;
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment: AlignmentDirectional(0, 0),
                                                      child: Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                                        child: Container(
                                                          width: MediaQuery.of(context).size.width * 0.9,
                                                          child: Material(
                                                            borderRadius: BorderRadius.circular(10),
                                                            elevation: 5,
                                                            shadowColor: Colors.white,
                                                            child: TextFormField(
                                                              controller: _pincodeController,
                                                              autofocus: false,
                                                              obscureText: false,
                                                              decoration: InputDecoration(
                                                                labelText: 'Enter Your Pin Code',
                                                                labelStyle: CustomTheme.of(context)
                                                                    .bodySmall
                                                                    .override(
                                                                  fontFamily: 'Poppins',
                                                                  color: CustomTheme.of(context)
                                                                      .secondaryBackground,
                                                                ),
                                                                hintText: '500084',
                                                                hintStyle: CustomTheme.of(context)
                                                                    .bodySmall
                                                                    .override(
                                                                  fontFamily: 'Poppins',
                                                                  color: CustomTheme.of(context)
                                                                      .secondaryBackground,
                                                                ),
                                                                enabledBorder: OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                    color: CustomTheme.of(context)
                                                                        .secondaryText,
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
                                                                fillColor: CustomTheme.of(context).forBtn,
                                                                contentPadding:
                                                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                              ),
                                                              style: CustomTheme.of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                fontFamily: 'Poppins',
                                                                color: CustomTheme.of(context).primaryBackground,
                                                              ),
                                                              validator: (value) {
                                                                if (value == null || value.isEmpty) {
                                                                  return 'Please enter your Pin Code';
                                                                }

                                                                // Pincode validation using regex
                                                                RegExp pincodeRegex = RegExp(r'^\d{6}$');
                                                                if (!pincodeRegex.hasMatch(value)) {
                                                                  return 'Please enter a valid Pin code ';
                                                                }

                                                                return null;
                                                              },
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

                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width*0.5,
                                      height: MediaQuery.of(context).size.height * 0.075,
                                        decoration: BoxDecoration(
                                            borderRadius:BorderRadius.circular(16),
                                        ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: NeoPopButton(
                                          color:CustomTheme.of(context).alternate,
                                          buttonPosition: Position.center,
                                          onTapUp: () {
                                            if (_formKey.currentState!.validate()) {
                                            }
                                            sendDataToServer();

                                            context.read<CreateUserBloc>().add(CreateUserPostUserDataEvent(loggedInData));
                                            //context.read<CreateUserBloc>().add(CreateUserPostUserDataEvent(loggedInData));
                                            //context.read<CreateUserBloc>().add(CreateUserPostUserDataEvent(loggedInData));
                                          },
                                          border:  Border.fromBorderSide(
                                            BorderSide( color:CustomTheme.of(context).secondaryBackground, width: 1)
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children:  [
                                                AutoSizeText(
                                                  "Create Account",
                                                  style: CustomTheme.of(context)
                                                      .titleMedium
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                    color: CustomTheme.of(context)
                                                        .primaryBackground,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                },
),
          ),
    );
  }
}
