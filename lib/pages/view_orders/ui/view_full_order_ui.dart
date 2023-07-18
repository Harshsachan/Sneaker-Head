import 'package:SneakerHead/pages/view_orders/repo/product_model.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../flutter_flow/flutter_flow_theme.dart';
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
            //height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: CustomTheme.of(context).primaryBackground,
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
                        color: CustomTheme.of(context).pBackground,
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
                                "https://picsum.photos/seed/472/601",
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                 widget.product?.name??'',
                                style: CustomTheme.of(context)
                                    .titleMedium
                                    .override(
                                  fontFamily: 'Poppins',
                                  color: CustomTheme.of(context)
                                      .primaryBackground,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                                maxLines: 1,
                              ),
                              AutoSizeText(
                                "product description",
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
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                      color: CustomTheme.of(context).pBackground,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                      color: CustomTheme.of(context).pBackground,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                      color: CustomTheme.of(context).pBackground,
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
