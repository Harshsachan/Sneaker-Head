import 'package:SneakerHead/pages/edit_user/bloc/editUser_event.dart';
import 'package:SneakerHead/pages/edit_user/bloc/editUser_state.dart';
import 'package:SneakerHead/pages/loading_screen/loading_screen.dart';
import 'package:SneakerHead/pages/memory/user_details.dart';
import 'package:SneakerHead/pages/sign_in/repo/signIn_model.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';

import '../../../custom_theme/flutter_flow_theme.dart';
import '../bloc/editUser_bloc.dart';
import '../repo/editUser_repo.dart';

class EditUser extends StatefulWidget {
  final EditUserRepo  editUserRepo;
  final LoggedInData? userDetails;
  const EditUser({Key? key,required this.editUserRepo,required this.userDetails}) : super(key: key);

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  UserDetailsService userDetailsService =UserDetailsService();
  LoggedInData? previousUserData;

  // FORM CONTROLLER
  final _formKey = GlobalKey<FormState>();
  final _fNameController = TextEditingController();
  final _lNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _houseNoController = TextEditingController();
  final _streetController = TextEditingController();
  final _areaController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _pinCodeController = TextEditingController();
  late LoggedInData loggedInData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future<LoggedInData?> sharedPrefData=userDetailsService.getUserDataFromSharedPreferences();
    sharedPrefData.then((value) => {
      if(value!=null){
        setState((){
          _fNameController.text=value.fName!;
          _lNameController.text=value.lName!;
          _phoneController.text=value.number.toString();
          _houseNoController.text=value.houseNo!;
          _streetController.text=value.street!;
          _areaController.text=value.area!;
          _cityController.text=value.city!;
          _stateController.text=value.state!;
          _pinCodeController.text=value.pincode.toString();
          previousUserData= value;
        })
      }
    });
  }

  void sendDataToServer() async {
    // Get the data from the controller
    String fName = _fNameController.text;
    String lName = _lNameController.text;
    //String email = _emailController.text;
    String number = _phoneController.text;
    String houseNo = _houseNoController.text;
    String street = _streetController.text;
    String area = _areaController.text;
    String city = _cityController.text;
    String state = _stateController.text;
    String pincode = _pinCodeController.text;

    // Get other data from the controller as needed

    //Create an Instance of LoggedInData with the collected data
    loggedInData = LoggedInData(
      fName: fName,
      lName: lName,
      email: previousUserData?.email,
      number: int.tryParse(number),
      houseNo: houseNo,
      street: street,
      area: area,
      city: city,
      state: state,
      pincode: int.tryParse(pincode),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.of(context).primaryText,
      appBar: AppBar(
        backgroundColor: CustomTheme.of(context).primaryText,
        elevation: 1,
        centerTitle: true,
        title: const AutoSizeText('Edit Your Details'),
      ),
      body: BlocProvider(
        create: (_) => EditUserBloc(widget.editUserRepo),
        child: BlocConsumer<EditUserBloc, EditUserPageState>(
          listener: (context, state) {
            if (state is EditUserPageSuccessState){
              LoggedInData userDetails = state.loggedInData;
              userDetailsService.deleteUserDataFromSharedPreferences();
              userDetailsService.updateUserDataInSharedPreferences(userDetails);
              LoggedInData updatedData = state.loggedInData;
              Navigator.pop(context, updatedData);
            }
          },
          builder: (context, state) {
            if (state is EditUserPageLoadingState) {
              return LoadingScreen();
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
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                    child: SizedBox(
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
                                            const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
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
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                    child: SizedBox(
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
                                            const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
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
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                    child: SizedBox(
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
                                            labelText: '${previousUserData?.email}',
                                            labelStyle: CustomTheme.of(context)
                                                .bodySmall
                                                .override(
                                              fontFamily: 'Poppins',
                                              color: CustomTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            hintText: '${previousUserData?.email}',
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
                                            const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                          ),
                                          style: CustomTheme.of(context)
                                              .bodyMedium
                                              .override(
                                            fontFamily: 'Poppins',
                                            color: CustomTheme.of(context).primaryBackground,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                    child: SizedBox(
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
                                            const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
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
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                    child: SizedBox(
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
                                            const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
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
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                    child: SizedBox(
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
                                            const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
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
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                    child: SizedBox(
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
                                            const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
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
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                    child: SizedBox(
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
                                            const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
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
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                    child: SizedBox(
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
                                            const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
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
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.9,
                                      child: Material(
                                        borderRadius: BorderRadius.circular(10),
                                        elevation: 5,
                                        shadowColor: Colors.white,
                                        child: TextFormField(
                                          controller: _pinCodeController,
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
                                            const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
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
                          context.read<EditUserBloc>().add(EditUserPageUpdateUserDetailsEvent(loggedInData));
                        },
                        border:  Border.fromBorderSide(
                            BorderSide( color:CustomTheme.of(context).secondaryBackground, width: 1)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              AutoSizeText(
                                "Update",
                                style: CustomTheme.of(context)
                                    .titleLarge
                                    .override(
                                  fontFamily: 'Poppins',
                                  color: CustomTheme.of(context)
                                      .primaryBackground,
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
