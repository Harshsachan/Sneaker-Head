import 'package:SneakerHead/pages/view_orders/repo/product_model.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../components/my_painter.dart';
import '../../../custom_theme/flutter_flow_theme.dart';
import '../repo/view_orders_model.dart';

class ViewFullOrderDart extends StatefulWidget {
  final PlacedOrderData order;
  final Product? product;
  const ViewFullOrderDart(
      {Key? key, required this.order, required this.product})
      : super(key: key);

  @override
  State<ViewFullOrderDart> createState() => _ViewFullOrderDartState();
}

class _ViewFullOrderDartState extends State<ViewFullOrderDart> {
  bool _showPriceBreakup = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: CustomTheme.of(context).primaryText,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed:
                () {}, // Call navigateBack method when the back button is pressed
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
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: CustomTheme.of(context).pBackground,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
              10, 10, 10, 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color:  CustomTheme.of(context).primaryBackground, // You can set the border color here
                          width: 1.0, // You can adjust the border width as needed
                        ),
                        color: CustomTheme.of(context).primaryText,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20, 20, 0, 20),
                            child: ClipRRect(
                              borderRadius:
                              BorderRadius.circular(8),
                              child: Image.network(
                                widget.product?.image??"https://picsum.photos/seed/472/601",
                                width: MediaQuery.of(context)
                                    .size
                                    .width *
                                    0.30,
                                // height: MediaQuery.of(context)
                                //     .size
                                //     .width *
                                //     0.25,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          VerticalDivider(
                            width: 20,
                            thickness: 2,
                            indent: 5,
                            endIndent: 10,
                            color: Colors.white,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                AutoSizeText(
                                   widget.product?.name??'',
                                  style: CustomTheme.of(context)
                                      .titleMedium
                                      .override(
                                    fontFamily: 'Poppins',
                                    color: CustomTheme.of(context)
                                        .primaryBackground,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                AutoSizeText(
                                  widget.product?.description??"Description",
                                  style: CustomTheme.of(context)
                                      .titleMedium
                                      .override(
                                    fontFamily: 'Poppins',
                                    color: CustomTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w200,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                AutoSizeText(
                                  "Size : 39",
                                  style: CustomTheme.of(context)
                                      .titleMedium
                                      .override(
                                    fontFamily: 'Poppins',
                                    color: CustomTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w200,
                                  ),
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color:  CustomTheme.of(context).primaryBackground, // You can set the border color here
                          width: 1.0, // You can adjust the border width as needed
                        ),
                        color: CustomTheme.of(context).primaryText,
                      ),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10, 10, 0, 0),
                            child: AutoSizeText(
                              "Delivery Status :",
                              style: CustomTheme.of(context)
                                  .titleMedium
                                  .override(
                                fontFamily: 'Poppins',
                                color: CustomTheme.of(context)
                                    .primaryBackground,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              maxLines: 1,
                            ),
                          ),
                          Padding(
                           padding: EdgeInsetsDirectional.fromSTEB(
                                10, 10, 10, 10),
                            child: DeliveryTimeline(currentStatus: DeliveryStatus.OutForDelivery),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        10, 10, 10, 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      //height: MediaQuery.of(context).size.height * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color:  CustomTheme.of(context).primaryBackground, // You can set the border color here
                          width: 1.0, // You can adjust the border width as needed
                        ),
                        color: CustomTheme.of(context).primaryText,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10, 10, 10, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              'Delivery Address :',
                              style: CustomTheme.of(context)
                                  .titleMedium
                                  .override(
                                fontFamily: 'Poppins',
                                color: CustomTheme.of(context)
                                    .primaryBackground,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            AutoSizeText(
                              widget.order.customerFullName??'',
                              style: CustomTheme.of(context)
                                  .titleMedium
                                  .override(
                                fontFamily: 'Poppins',
                                color: CustomTheme.of(context)
                                    .primaryBackground,
                                fontWeight: FontWeight.w300,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            AutoSizeText(
                              widget.order.customerNumber.toString(),
                              style: CustomTheme.of(context)
                                  .titleMedium
                                  .override(
                                fontFamily: 'Poppins',
                                color: CustomTheme.of(context)
                                    .primaryBackground,
                                fontWeight: FontWeight.w300,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            AutoSizeText(
                              widget.order.customerEmail??'',
                              style: CustomTheme.of(context)
                                  .titleMedium
                                  .override(
                                fontFamily: 'Poppins',
                                color: CustomTheme.of(context)
                                    .primaryBackground,
                                fontWeight: FontWeight.w200,
                              ),
                              maxLines: 1,
                              //overflow: TextOverflow.ellipsis,
                            ),
                            AutoSizeText(
                              widget.order.address??'',
                              style: CustomTheme.of(context)
                                  .titleMedium
                                  .override(
                                fontFamily: 'Poppins',
                                color: CustomTheme.of(context)
                                    .primaryBackground,
                                fontWeight: FontWeight.w200,
                              ),

                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          10, 10, 10, 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color:  CustomTheme.of(context).primaryBackground, // You can set the border color here
                          width: 1.0, // You can adjust the border width as needed
                        ),
                        color: CustomTheme.of(context).primaryText,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10, 10, 10, 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AutoSizeText(
                                  'Total Payable',
                                  style: CustomTheme.of(context)
                                      .titleMedium
                                      .override(
                                    fontFamily: 'Poppins',
                                    color: CustomTheme.of(context)
                                        .primaryBackground,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _showPriceBreakup = !_showPriceBreakup;
                                    });
                                  },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      AutoSizeText(
                                        '${widget.product?.price}',
                                        style: CustomTheme.of(context)
                                            .titleMedium
                                            .override(
                                          fontFamily: 'Poppins',
                                          color: CustomTheme.of(context)
                                              .primaryBackground,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          AutoSizeText(
                                            'View Price Breakup',
                                            style: CustomTheme.of(context).bodySmall.override(
                                              fontFamily: 'Poppins',
                                              color: CustomTheme.of(context).primary,
                                            ),
                                          ),
                                          Icon(
                                            _showPriceBreakup ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                                            color: CustomTheme.of(context).primary,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                        Visibility(
                          visible: _showPriceBreakup,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  AutoSizeText(
                                    'MRP: ', // Replace with the actual tax value
                                    style: CustomTheme.of(context).bodyMedium.override(
                                      fontFamily: 'Poppins',
                                      color: CustomTheme.of(context).primaryBackground,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  AutoSizeText(
                                    '\$${widget.product?.price}', // Replace with the actual tax value
                                    style: CustomTheme.of(context).bodyMedium.override(
                                      fontFamily: 'Poppins',
                                      color: CustomTheme.of(context).primaryBackground,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  AutoSizeText(
                                    'Coupon Discount: ', // Replace with the actual tax value
                                    style: CustomTheme.of(context).bodyMedium.override(
                                      fontFamily: 'Poppins',
                                      color: CustomTheme.of(context).primaryBackground,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  AutoSizeText(
                                    '- \$${widget.product?.price}', // Replace with the actual tax value
                                    style: CustomTheme.of(context).bodyMedium.override(
                                      fontFamily: 'Poppins',
                                      color: CustomTheme.of(context).primaryBackground,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              // Add more details here as needed
                            ],
                          ),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),),
      ),
    );
  }
}

enum DeliveryStatus {
  Preparing,
  OutForDelivery,
  Delivered,
}

class StatusIndicator extends StatelessWidget {
  final bool isActive;

  StatusIndicator({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Colors.green : Colors.grey, // Customize the active and inactive indicator colors
      ),
    );
  }
}

class DeliveryTimeline extends StatelessWidget {
  final DeliveryStatus currentStatus;

  DeliveryTimeline({required this.currentStatus});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Column(
              children: [
                Container(
                height: MediaQuery.of(context).size.height * 0.025,
                width: 2,
                color: Colors.green, // Customize the color of the timeline line
              ),
                StatusIndicator(isActive: currentStatus == DeliveryStatus.OutForDelivery),
                Container(
                  height: MediaQuery.of(context).size.height * 0.025,
                  width: 2,
                  color: Colors.green, // Customize the color of the timeline line
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  5, 0, 0, 0),
              child: AutoSizeText(
                "Preparing",
                style: CustomTheme.of(context)
                    .titleMedium
                    .override(
                  fontFamily: 'Poppins',
                  color: CustomTheme.of(context)
                      .primaryBackground,
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                ),
                maxLines: 1,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Column(
              children: [
                Container(
                height: MediaQuery.of(context).size.height * 0.025,
                width: 2,
                color: Colors.green, // Customize the color of the timeline line
              ),
                StatusIndicator(isActive: currentStatus == DeliveryStatus.OutForDelivery),
                Container(
                  height: MediaQuery.of(context).size.height * 0.025,
                  width: 2,
                  color: Colors.green, // Customize the color of the timeline line
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  5, 0, 0, 0),
              child: AutoSizeText(
                "Out For Delivery",
                style: CustomTheme.of(context)
                    .titleMedium
                    .override(
                  fontFamily: 'Poppins',
                  color: CustomTheme.of(context)
                      .primaryBackground,
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                ),
                maxLines: 1,
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              children: [
                CustomPaint(
                  painter: DottedLinePainter(),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.025,
                    width: 2,
                  ),
                ),
                StatusIndicator(isActive: currentStatus == DeliveryStatus.Delivered),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  5, 0, 0, 0),
              child: AutoSizeText(
                "Expected Deliverey",
                style: CustomTheme.of(context)
                    .titleMedium
                    .override(
                  fontFamily: 'Poppins',
                  color: CustomTheme.of(context)
                      .primaryBackground,
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                ),
                maxLines: 1,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

