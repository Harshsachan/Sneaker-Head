import 'dart:async';
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neopop/widgets/buttons/neopop_tilted_button/neopop_tilted_button.dart';
import 'package:SneakerHead/custom_theme/flutter_flow_icon_button.dart';
import 'package:SneakerHead/custom_theme/flutter_flow_theme.dart';
import 'package:SneakerHead/pages/explore/repo/explore_model.dart';
import 'package:SneakerHead/pages/memory/email.dart';
import 'package:SneakerHead/pages/order/bloc/order_bloc.dart';
import 'package:SneakerHead/pages/order/bloc/order_event.dart';
import 'package:SneakerHead/pages/order/bloc/order_state.dart';
import 'package:SneakerHead/pages/order/repo/order_repo.dart';
import 'package:SneakerHead/pages/order/ui/afterOrder.dart';

import '../../loading_screen/loading_screen.dart';
import '../../memory/user_details.dart';
import '../../sign_in/repo/signIn_model.dart';
import '../repo/product_order_model.dart';

class OneCreateOrder extends StatefulWidget {
  final ProductDetails product;
  final PlaceOrderRepo placeOrderRepo;

  const OneCreateOrder(
      {Key? key, required this.product, required this.placeOrderRepo})
      : super(key: key);

  @override
  State<OneCreateOrder> createState() => _OneCreateOrderState();
}

class _OneCreateOrderState extends State<OneCreateOrder> {
  ConfettiController _confettiController = ConfettiController();
  EmailService emailService = EmailService();
  UserDetailsService userDetailsService = UserDetailsService();

  String? userEmail = "";
  List<int?> order_ids = [];
  List<ProductOrderModel> productsOrders =[];
  String? userName = "";
  int? userNumber;
  String? address;

  double orderPrice = 0;
  double couponSavings = 0;

  double selectedCouponDiscount = 0.0;
  String selectedOption = 'Loyality Points';

  @override
  void initState() {
    // TODO: implement initState
    orderPrice = widget.product.price!.toDouble();
    addOrderId();
    loadUserEmail();
    Future<LoggedInData?> sharedPrefData =
        userDetailsService.getUserDataFromSharedPreferences();
    sharedPrefData.then((value) => {
          if (value != null)
            {
              setState(() {
                userName = '${value.fName}  ${value.lName}';
                userNumber = value.number;
                address =
                    '${value.houseNo} ${value.street} ${value.area} ${value.city} ${value.state} ${value.pincode.toString()}';
              })
            }
        });
    super.initState();
  }

  void loadUserEmail() async {
    String? gotUserEmail = await emailService.getUserEmail();
    setState(() {
      userEmail = gotUserEmail;
    });
    print(userEmail);
  }

  void addOrderId() {
    order_ids.add(widget.product.id);
    print(order_ids);
  }

  void CouponSaving() {
    couponSavings = widget.product.price!.toDouble() - orderPrice;
    setState(() {
      couponSavings = widget.product.price!.toDouble() - orderPrice;
    });
  }

  String? selectedCoupon;
  bool couponApplied = false;

  void _celebrate() {
    _confettiController.play();
    Timer(Duration(seconds: 3), () {
      _confettiController.stop();
    });
  }

  void _showCouponDialog(BuildContext context) {
    if (couponApplied) {
      // If the coupon has already been applied, show a message or take appropriate action.
      // You can also choose to not open the dialog again.
      setState(() {
        selectedCoupon = null;
        couponApplied = false;
        couponSavings = 0;
        orderPrice = widget.product.price!
            .toDouble(); // Reset the orderPrice to original value
      });
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CouponDialog(
          onCouponSelected: (selectedCoupon) {
            // Handle the selected coupon here
            // For example, you can update the orderPrice based on the selected coupon.
            if (selectedCoupon == 'Coupon 1') {
              setState(() {
                // Apply 10% discount
                orderPrice -= (orderPrice * 0.10).ceil();
                couponSavings = widget.product.price!.toDouble() - orderPrice;
              });
            } else if (selectedCoupon == 'Coupon 2') {
              setState(() {
                // Apply 23% discount
                orderPrice -= (orderPrice * 0.23).ceil();
                couponSavings = widget.product.price!.toDouble() - orderPrice;
              });
            }

            // Perform any other actions based on the selected coupon

            // Update the displayed price in the "APPLY COUPON" section
            setState(() {});
            couponApplied = true;
            if (selectedCoupon != null) {
              // Trigger Confetti animation when the coupon is applied
              print("Triggered");
              _celebrate();
            }
          },
        );
      },
    );
  }

  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  @override
  Widget build(BuildContext context) {
    return ConfettiWidget(
      confettiController: _confettiController,
      blastDirectionality: BlastDirectionality
          .explosive, // don't specify a direction, blast randomly
      shouldLoop: true, // start again as soon as the animation is finished
      colors: const [
        Colors.green,
        Colors.blue,
        Colors.pink,
        Colors.orange,
        Colors.purple
      ], // manually specify the colors to be used
      createParticlePath: drawStar,
      child: Scaffold(
        backgroundColor: CustomTheme.of(context).primaryText,
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
              color: Colors.white,
              size: 30,
            ),
            onPressed: () async {
              Navigator.pop(context);
            },
          ),
          title: AutoSizeText(
            'Order',
            style: CustomTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 22,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2,
        ),
        body: BlocProvider(
          create: (_) => OrderPageBloc(widget.placeOrderRepo),
          child: BlocConsumer<OrderPageBloc, OrderPageState>(
            listener: (context, state) {
              // TODO: implement listener
              if (state is OrderPageSuccessState) {
                print("Order finally placed successful from widget");
                String? op = state.message;
                print('${op}');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AfterOrder(),
                  ),
                );
              }
              else if (state is OrderPageLoadingState) {
              } else if (state is OrderPageErrorState) {}
            },
            builder: (context, state) {
              if (state is OrderPageLoadingState) {
                // Show loading screen here
                return LoadingScreen();
              } else {
                return SafeArea(
                  top: true,
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          //primary: true,
                          child: Container(
                            decoration: BoxDecoration(
                              color: CustomTheme.of(context).primaryText,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  primary: false,
                                  itemCount: 1,
                                  itemBuilder: (context, index) {
                                    final product = widget.product;
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15, 30, 15, 5),
                                      child: Material(
                                        shadowColor: Colors.purple,
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(24),
                                        ),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.20,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF161A1E),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                              color: CustomTheme.of(context)
                                                  .primaryBackground,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 20, 0, 20),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      child: Image.network(
                                                        product.image ?? '',
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.3,
                                                        height: 80,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 0, 0, 0),
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.5,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.13,
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          AutoSizeText(
                                                            product.name ?? '',
                                                            style:
                                                                CustomTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: CustomTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      //fontWeight: FontWeight.bold,
                                                                    ),
                                                          ),
                                                          AutoSizeText(
                                                            product.company ??
                                                                '',
                                                            style:
                                                                CustomTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: CustomTheme.of(
                                                                              context)
                                                                          .accent5,
                                                                      //fontWeight: FontWeight.bold,
                                                                    ),
                                                          ),
                                                          AutoSizeText(
                                                            'Size : 9',
                                                            style:
                                                                CustomTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: CustomTheme.of(
                                                                              context)
                                                                          .accent5,
                                                                      //fontWeight: FontWeight.bold,
                                                                    ),
                                                          ),
                                                          AutoSizeText(
                                                            '\$ ${product.price}' ??
                                                                '',
                                                            style:
                                                                CustomTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: CustomTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Divider(
                                                thickness: 1,
                                                indent: 10,
                                                endIndent: 10,
                                                color: CustomTheme.of(context)
                                                    .primaryBackground,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 5),
                                  child: AutoSizeText(
                                    'Assured Quality | 100% Handpicked ',
                                    style: CustomTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          color:
                                              CustomTheme.of(context).accent5,
                                          //fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 0),
                                  child: Container(
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height *
                                        0.08,
                                    decoration: BoxDecoration(
                                      color:
                                          CustomTheme.of(context).pBackground,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.6,
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 0, 0, 0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Icon(
                                                      Icons.discount_sharp,
                                                      color: CustomTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                      size: 24,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10, 0, 0, 0),
                                                      child: AutoSizeText(
                                                        'APPLY COUPON ',
                                                        style:
                                                            CustomTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: CustomTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  //fontWeight: FontWeight.bold,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                couponApplied
                                                    ? Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(55, 0,
                                                                    0, 0),
                                                        child: AutoSizeText(
                                                          "Coupon Applied",
                                                          style: CustomTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: CustomTheme.of(
                                                                        context)
                                                                    .success,
                                                              ),
                                                        ),
                                                      )
                                                    : Container()
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 20, 0),
                                          child: SelectionArea(
                                            child: GestureDetector(
                                              onTap: () {
                                                _showCouponDialog(
                                                    context); // Show coupon dialog on button click
                                              },
                                              child: AutoSizeText(
                                                'SELECT',
                                                style: CustomTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      decoration: TextDecoration
                                                          .underline,
                                                      fontFamily: 'Poppins',
                                                      color: CustomTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                      //fontWeight: FontWeight.bold,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color:
                                          CustomTheme.of(context).pBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AutoSizeText(
                                            'REDEMPTION OPTIONS',
                                            style: CustomTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: CustomTheme.of(context)
                                                      .primaryBackground,
                                                  //fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          Row(
                                            children: [
                                              Radio(
                                                value: selectedOption,
                                                groupValue: 'Loyalty Points',
                                                onChanged: (value) {
                                                  setState(() {
                                                    selectedOption =
                                                        value as String;
                                                  });
                                                },
                                                activeColor: Colors
                                                    .red, // Customize the active radio color
                                              ),
                                              Text(
                                                'Loyality Points',
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  color: CustomTheme.of(context)
                                                      .primaryBackground,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: AutoSizeText(
                                              'You have no Loyality Points at the moment',
                                              style: CustomTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: CustomTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    //fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 223,
                                    decoration: BoxDecoration(
                                      color:
                                          CustomTheme.of(context).pBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 15, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AutoSizeText(
                                            'Order Details',
                                            style: CustomTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: CustomTheme.of(context)
                                                      .secondaryBackground,
                                                  //fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              AutoSizeText(
                                                'Bag Total',
                                                style: CustomTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color: CustomTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                      //fontWeight: FontWeight.bold,
                                                    ),
                                              ),
                                              AutoSizeText(
                                                '\$ ${orderPrice}',
                                                style: CustomTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color: CustomTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                      //fontWeight: FontWeight.bold,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              AutoSizeText(
                                                'Coupon Savings',
                                                style: CustomTheme.of(context)
                                                    .bodySmall
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color: CustomTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                      //fontWeight: FontWeight.bold,
                                                    ),
                                              ),
                                              AutoSizeText(
                                                '- ${couponSavings}',
                                                style: CustomTheme.of(context)
                                                    .bodySmall
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color: CustomTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                      //fontWeight: FontWeight.bold,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          AutoSizeText(
                                            'Convenience Fee WHAT\'S THIS',
                                            style: CustomTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: CustomTheme.of(context)
                                                      .primaryBackground,
                                                  //fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 0, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                AutoSizeText(
                                                  'Delivery Fee ',
                                                  style: CustomTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: CustomTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                        //fontWeight: FontWeight.bold,
                                                      ),
                                                ),
                                                AutoSizeText(
                                                  'Free  99.00',
                                                  style: CustomTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                        color: CustomTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                        //fontWeight: FontWeight.bold,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 0, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                AutoSizeText(
                                                  'Fulfilment Fee ',
                                                  style: CustomTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: CustomTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                        //fontWeight: FontWeight.bold,
                                                      ),
                                                ),
                                                AutoSizeText(
                                                  '\$-9.00',
                                                  style: CustomTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                        color: CustomTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                        //fontWeight: FontWeight.bold,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'AMOUNT PAYABLE',
                                                style: CustomTheme.of(context)
                                                    .bodyLarge
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color: CustomTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                      //fontWeight: FontWeight.bold,
                                                    ),
                                              ),
                                              AutoSizeText(
                                                '\$ ${orderPrice}',
                                                style: CustomTheme.of(context)
                                                    .bodyLarge
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color: CustomTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                      //fontWeight: FontWeight.bold,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.10,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(33, 33, 33, 1.0),
                          //borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width * 0.40,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoSizeText(
                                      "\$ ${orderPrice}",
                                      style: CustomTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: CustomTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                    ),
                                    AutoSizeText(
                                      "View Details",
                                      style: CustomTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: CustomTheme.of(context)
                                                .primaryBackground,
                                          ),
                                    ),
                                  ],
                                )),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.50,
                              height: MediaQuery.of(context).size.height * 0.1,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: NeoPopTiltedButton(
                                  isFloating: true,
                                  onTapUp: () {
                                    print("click");
                                    context.read<OrderPageBloc>().add(
                                        OrderPagePlaceOrderEvent(
                                            userEmail,
                                            order_ids,
                                            widget.product.price,
                                            userName,
                                            userNumber,
                                            address));
                                  },
                                  decoration: NeoPopTiltedButtonDecoration(
                                    //color:  Color.fromRGBO(255, 235, 52, 1),alternate
                                    color: Color.fromRGBO(236, 236, 236, 1.0),
                                    plunkColor:
                                        Color.fromRGBO(151, 151, 151, 1.0),
                                    shadowColor:
                                        CustomTheme.of(context).primaryText,
                                    showShimmer: true,
                                    shimmerColor: CustomTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(9.0),
                                    child: Center(
                                      child: AutoSizeText(
                                        "Proceed to Payment",
                                        style: CustomTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: CustomTheme.of(context)
                                                  .primaryText,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class CouponDialog extends StatefulWidget {
  final Function(String?)
      onCouponSelected; // Callback function to pass selected coupon

  CouponDialog({required this.onCouponSelected}); // Constructor

  @override
  _CouponDialogState createState() => _CouponDialogState();
}

class _CouponDialogState extends State<CouponDialog> {
  String? selectedCoupon; // Define the selectedCoupon variable

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: CustomTheme.of(context).primaryText,
      title: Text('Select a Coupon',
          style: TextStyle(color: CustomTheme.of(context).primaryBackground)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text('Welcome 10',
                style: TextStyle(
                    color: CustomTheme.of(context).primaryBackground)),
            leading: Radio<String>(
              fillColor: MaterialStateColor.resolveWith(
                  (states) => CustomTheme.of(context).primaryBackground),
              value: 'Coupon 1',
              groupValue: selectedCoupon,
              onChanged: (value) {
                setState(() {
                  selectedCoupon = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text('HARSH 23',
                style: TextStyle(
                    color: CustomTheme.of(context).primaryBackground)),
            leading: Radio<String>(
              fillColor: MaterialStateColor.resolveWith(
                  (states) => CustomTheme.of(context).primaryBackground),
              value: 'Coupon 2',
              groupValue: selectedCoupon,
              onChanged: (value) {
                setState(() {
                  selectedCoupon = value;
                });
              },
            ),
          ),
        ],
      ),
      actions: <Widget>[
        Row(
          children: [
            if (selectedCoupon !=
                null) // Only show the "Remove" button when a coupon is selected
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedCoupon = null; // Deselect the selected coupon
                  });
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                    primary: CustomTheme.of(context).alternate),
                child: Text('Remove'),
              ),
            Spacer(), // Add spacer to push "Done" button to the right
            ElevatedButton(
              onPressed: () {
                // You can use the selectedCoupon variable here
                // to perform any action based on the selected coupon.
                // For example, you can close the dialog and apply the coupon.
                if (selectedCoupon == null) {
                } else {
                  widget.onCouponSelected(selectedCoupon);
                  Navigator.of(context).pop();
                }
              },
              style: ElevatedButton.styleFrom(
                  primary: CustomTheme.of(context).alternate),
              child: Text('Done'),
            ),
          ],
        ),
      ],
    );
  }
}
