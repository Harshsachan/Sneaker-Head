import 'package:SneakerHead/pages/view_orders/ui/view_order_ui.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:SneakerHead/flutter_flow/flutter_flow_theme.dart';
import 'package:SneakerHead/form.dart';
import 'package:SneakerHead/pages/account/yourDetails/yourDetails.dart';
import 'package:SneakerHead/pages/memory/user_details.dart';
import 'package:SneakerHead/pages/sign_in/repo/signIn_model.dart';
import 'package:SneakerHead/pages/sign_in/repo/signIn_repo.dart';
import 'package:SneakerHead/pages/sign_in/ui/sign_in.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../flutter_flow/flutter_flow_widgets.dart';
import '../view_orders/bloc/view_orders_bloc.dart';
import '../view_orders/bloc/view_orders_events.dart';
import '../view_orders/bloc/view_orders_state.dart';
import '../view_orders/repo/view_orders_model.dart';
import '../view_orders/repo/view_orders_repo.dart';

class Accountpage extends StatefulWidget {
  final ViewPlacedOrderRepo viewPlacedOrderRepo;
  const Accountpage({Key? key,required this.viewPlacedOrderRepo}) : super(key: key);

  @override
  State<Accountpage> createState() => _AccountpageState();
}

class _AccountpageState extends State<Accountpage> {
  UserDetailsService userDetailsService = UserDetailsService();
  LoggedInData? gotshareData;
   String? userEmail="";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future<LoggedInData?> shareData =
        userDetailsService.getUserDataFromSharedPreferences();
    shareData.then((value) {
      if (value != null) {
        setState(() {
          gotshareData = value;
          userEmail= value.email;
        });
      }
    });
  }

  void handleUpdateUserData(LoggedInData? updatedData) {
    setState(() {
      gotshareData = updatedData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomTheme.of(context).primaryText,
        body: BlocProvider(
  create: (context) => ViewAllOrderBloc(widget.viewPlacedOrderRepo),
  child: BlocConsumer<ViewAllOrderBloc, ViewAllOrderState>(
  listener: (context, state) {
    // TODO: implement listener
    if(state is ViewAllOrderSuccessState)
      {
        print("ViewAllOrderSuccessState");
        List<PlacedOrderData> orders=state.placedOrderData;
        print(orders.runtimeType);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ViewOrders(orders: orders),
          ),
        );
      }
  },
  builder: (context, state) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Full info
            Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(15, 5, 15, 0),
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
                          decoration: const BoxDecoration(
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
                              '${gotshareData?.fName} ${gotshareData?.lName}',
                              style:
                                  CustomTheme.of(context).bodyMedium.override(
                                        fontFamily: 'Poppins',
                                        color: CustomTheme.of(context)
                                            .primaryBackground,
                                        fontSize: 22,
                                      ),
                            ),
                            AutoSizeText(
                              '${gotshareData?.email}',
                              style:
                                  CustomTheme.of(context).bodyMedium.override(
                                        fontFamily: 'Poppins',
                                        color: CustomTheme.of(context)
                                            .primaryBackground,
                                        fontSize: 14,
                                      ),
                            ),
                            AutoSizeText(
                              '+91 ${gotshareData?.number}',
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
              padding: const EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
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
              padding: const EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => YourDetails(
                              userDetails: gotshareData,
                              onUpdateUserData: handleUpdateUserData,
                            )),
                  ).then((updatedData) {
                    print("came back from previous screen");
                    if (updatedData != null) {
                      setState(() {
                        print("came back from previous screen");
                        print('${updatedData}');
                        gotshareData = updatedData;
                        print('${gotshareData?.fName}');
                      });
                    }
                  });
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
              padding: const EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CardForm()),
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
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
              child: GestureDetector(
                onTap: () {
                  context.read<ViewAllOrderBloc>().add(FindAllOrderEvents(userEmail));
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
                            "All Orders",
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
                  onPressed: () async {
                    userDetailsService.deleteUserDataFromSharedPreferences();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SignInWidget(SignInrepo())),
                    );
                  },
                  text: "Log Out",
                  options: FFButtonOptions(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.width * 0.115,
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    color: CustomTheme.of(context).error,
                    textStyle: CustomTheme.of(context).titleMedium.override(
                          fontFamily: CustomTheme.of(context).titleMediumFamily,
                          color: CustomTheme.of(context).primaryBackground,
                        ),
                    elevation: 1,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            )
          ],
        );
  },
),
),
      ),
    );
  }
}
