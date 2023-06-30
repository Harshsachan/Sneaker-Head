import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:neopop/widgets/buttons/neopop_tilted_button/neopop_tilted_button.dart';
import 'package:testproject/flutter_flow/flutter_flow_icon_button.dart';
import 'package:testproject/flutter_flow/flutter_flow_radio_button.dart';
import 'package:testproject/flutter_flow/flutter_flow_theme.dart';
import 'package:testproject/flutter_flow/flutter_flow_widgets.dart';
import 'package:testproject/flutter_flow/form_field_controller.dart';
import 'package:testproject/pages/explore/repo/explore_model.dart';
import 'package:testproject/pages/explore/ui/add_to_cart.dart';
import 'package:testproject/pages/memory/email.dart';

class OneCreateOrder extends StatefulWidget {
  final ProductDetails product;

  const OneCreateOrder({Key? key, required this.product}) : super(key: key);

  @override
  State<OneCreateOrder> createState() => _OneCreateOrderState();
}

class _OneCreateOrderState extends State<OneCreateOrder> {
  EmailService emailService = EmailService();
  String? userEmail= "";
  List<int?> order_ids=[];

  @override
  void initState() {
    // TODO: implement initState
    addOrderId();
    loadUserEmail();
    super.initState();
  }

  void loadUserEmail() async{
    String? gotUserEmail = await emailService.getUserEmail();
    setState(() {
      userEmail= gotUserEmail;
    });
    print(userEmail);
  }
  void addOrderId()
  {
    order_ids.add(widget.product.id);
    print(order_ids);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          onPressed: () async {},
        ),
        title: Text(
          'Page Title',
          style: CustomTheme.of(context).headlineMedium.override(
                fontFamily: 'Outfit',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                //primary: true,
                child: Container(
                  decoration: BoxDecoration(
                    color:
                    CustomTheme.of(context).primaryText,
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
                          final product =   widget.product;
                          return Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 30, 15, 5),
                            child: Material(
                              shadowColor:Colors.purple,
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height * 0.20,
                                decoration: BoxDecoration(
                                  color:
                                  const Color(0xFF161A1E),
                                  borderRadius: BorderRadius.circular(8),
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
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              10, 20, 0, 20),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(8),
                                            child: Image.network(
                                              product.image ?? '',
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              height: 80,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              10, 0, 0, 0),
                                          child: Container(
                                            width:
                                                MediaQuery.of(context).size.width *
                                                    0.5,
                                            height:
                                                MediaQuery.of(context).size.height *
                                                    0.13,
                                            // decoration: BoxDecoration(
                                            //   color: CustomTheme.of(context)
                                            //       .secondaryText,
                                            // ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                AutoSizeText(
                                                  product.name??'',
                                                  style: CustomTheme.of(context).bodyMedium.override(
                                                    fontFamily: 'Poppins',
                                                    color: CustomTheme.of(context)
                                                        .secondaryBackground,
                                                    //fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                AutoSizeText(
                                                  product.company??'',
                                                  style: CustomTheme.of(context).bodyMedium.override(
                                                    fontFamily: 'Poppins',
                                                    color: CustomTheme.of(context)
                                                        .accent5,
                                                    //fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                AutoSizeText(
                                                  'Size : 9',
                                                  style: CustomTheme.of(context).bodyMedium.override(
                                                    fontFamily: 'Poppins',
                                                    color: CustomTheme.of(context)
                                                        .accent5,
                                                    //fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                AutoSizeText(
                                                  '\$ ${product.price}'??'',
                                                  style: CustomTheme.of(context).bodyMedium.override(
                                                    fontFamily: 'Poppins',
                                                    color: CustomTheme.of(context)
                                                        .primaryBackground,
                                                    fontWeight: FontWeight.bold,
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
                                      color:
                                          CustomTheme.of(context).primaryBackground,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      Padding(
                          padding:EdgeInsetsDirectional.fromSTEB(0, 10, 0, 5),
                        child: AutoSizeText(
                          'Assured Quality | 100% Handpicked ',
                          style: CustomTheme.of(context).bodySmall.override(
                          fontFamily: 'Poppins',
                          color: CustomTheme.of(context)
                              .accent5,
                          //fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.08,
                          decoration: BoxDecoration(
                            color: CustomTheme.of(context).pBackground,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: Padding(
                                  padding:
                                      EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(
                                        Icons.discount_sharp,
                                        color:
                                            CustomTheme.of(context).primaryBackground,
                                        size: 24,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: AutoSizeText(
                                            'APPLY COUPON ',
                                            style: CustomTheme.of(context).bodyMedium.override(
                                              fontFamily: 'Poppins',
                                              color: CustomTheme.of(context)
                                                  .secondaryBackground,
                                              //fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),

                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                                child: SelectionArea(
                                    child: AutoSizeText(
                                      'SELECT',
                                      style: CustomTheme.of(context).bodyMedium.override(
                                        decoration: TextDecoration.underline,
                                        fontFamily: 'Poppins',
                                        color: CustomTheme.of(context)
                                            .secondaryBackground,
                                        //fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.10,
                          decoration: BoxDecoration(
                            color: CustomTheme.of(context).pBackground,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  'REDEMPTION OPTIONS',
                                  style: CustomTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    color: CustomTheme.of(context)
                                        .primaryBackground,
                                    //fontWeight: FontWeight.bold,
                                  ),
                                ),
                                // Radio(
                                //     value: "radio value",
                                //     groupValue: "group value",
                                //     onChanged: (value){
                                //       print(value); //selected value
                                //     }
                                // ),
                                FlutterFlowRadioButton(
                                  options: ['Loyality Points'].toList(),
                                  onChanged: (val) => setState(() {}),
                                  controller: FormFieldController<String>(null),
                                  optionHeight: 32,
                                  textStyle:  CustomTheme.of(context).labelMedium.override(
                                    fontFamily: 'Poppins',
                                    color:  CustomTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 12,
                                  ),
                                  selectedTextStyle:  CustomTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Poppins',
                                    color:  CustomTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 12,
                                  ),
                                  buttonPosition: RadioButtonPosition.left,
                                  direction: Axis.vertical,
                                  radioButtonColor:Colors.red,
                                   // CustomTheme.of(context).primary,
                                  inactiveRadioButtonColor:
                                   CustomTheme.of(context).primaryBackground,
                                  toggleable: false,
                                  horizontalAlignment: WrapAlignment.start,
                                  verticalAlignment: WrapCrossAlignment.start,
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: AutoSizeText(
                                    'You have no Loyality Points at the moment',
                                    style: CustomTheme.of(context).bodyMedium.override(
                                      fontFamily: 'Poppins',
                                      color: CustomTheme.of(context)
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Container(
                          width: double.infinity,
                          height: 223,
                          decoration: BoxDecoration(
                            color: CustomTheme.of(context).pBackground,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 15, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  'Order Details',
                                  style: CustomTheme.of(context).bodyLarge.override(
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
                                      style: CustomTheme.of(context).bodyMedium.override(
                                        fontFamily: 'Poppins',
                                        color: CustomTheme.of(context)
                                            .primaryBackground,
                                        //fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    AutoSizeText(
                                      '160000',
                                      style: CustomTheme.of(context).bodyMedium.override(
                                        fontFamily: 'Poppins',
                                        color: CustomTheme.of(context)
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
                                      style: CustomTheme.of(context).bodySmall.override(
                                        fontFamily: 'Poppins',
                                        color: CustomTheme.of(context)
                                            .primaryBackground,
                                        //fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    AutoSizeText(
                                      '-100',
                                      style: CustomTheme.of(context).bodySmall.override(
                                        fontFamily: 'Poppins',
                                        color: CustomTheme.of(context)
                                            .primaryBackground,
                                        //fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                AutoSizeText(
                                  'Convenience Fee WHAT\'S THIS',
                                  style: CustomTheme.of(context).bodySmall.override(
                                    fontFamily: 'Poppins',
                                    color: CustomTheme.of(context)
                                        .primaryBackground,
                                    //fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AutoSizeText(
                                        'Delivery Fee ',
                                          style: CustomTheme.of(context).bodySmall.override(
                                            fontFamily: 'Poppins',
                                            color: CustomTheme.of(context)
                                                .primaryBackground,
                                            //fontWeight: FontWeight.bold,
                                          ),
                                      ),
                                      AutoSizeText(
                                        'Free  99.00',
                                        style: CustomTheme.of(context).bodySmall.override(
                                          fontFamily: 'Poppins',
                                          decoration: TextDecoration.lineThrough,
                                          color: CustomTheme.of(context)
                                              .primaryBackground,
                                          //fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AutoSizeText(
                                        'Fulfilment Fee ',
                                        style: CustomTheme.of(context).bodySmall.override(
                                          fontFamily: 'Poppins',
                                          color: CustomTheme.of(context)
                                              .primaryBackground,
                                          //fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      AutoSizeText(
                                        '\$-9.00',
                                        style: CustomTheme.of(context).bodySmall.override(
                                          fontFamily: 'Poppins',
                                          color: CustomTheme.of(context)
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
                                      style: CustomTheme.of(context).bodyLarge.override(
                                        fontFamily: 'Poppins',
                                        color: CustomTheme.of(context)
                                            .primaryBackground,
                                        //fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    AutoSizeText(
                                      '1599891',
                                      style: CustomTheme.of(context).bodyLarge.override(
                                        fontFamily: 'Poppins',
                                        color: CustomTheme.of(context)
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
                      height: MediaQuery.of(context).size.height * 0.050,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            "\$ 1599891",
                            style: CustomTheme.of(context).titleMedium.override(
                                  fontFamily: 'Poppins',
                                  color: CustomTheme.of(context)
                                      .secondaryBackground,
                                ),
                          ),
                          AutoSizeText(
                            "View Details",
                            style: CustomTheme.of(context).bodySmall.override(
                                  fontFamily: 'Poppins',
                                  color: CustomTheme.of(context)
                                      .primaryBackground,
                                ),
                          ),
                        ],
                      )),
                  Container(
                    width: MediaQuery.of(context).size.width*0.50,
                    height: MediaQuery.of(context).size.height * 0.1,

                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: NeoPopTiltedButton(
                        isFloating: true,
                        onTapUp: () {},
                        decoration:  NeoPopTiltedButtonDecoration(
                          //color:  Color.fromRGBO(255, 235, 52, 1),
                          color: Color.fromRGBO(236, 236, 236, 1.0),
                          plunkColor: Color.fromRGBO(151, 151, 151, 1.0),
                          shadowColor: CustomTheme.of(context).primaryText,
                          showShimmer: true,
                          shimmerColor: CustomTheme.of(context).secondaryBackground,
                        ),
                        child:  Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: Center(
                            child: AutoSizeText(
                              "Proceed to Payment",
                              style: CustomTheme.of(context).bodySmall.override(
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
      ),
    );
  }
}
