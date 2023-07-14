import 'package:SneakerHead/pages/view_orders/bloc/view_orders_bloc.dart';
import 'package:SneakerHead/pages/view_orders/bloc/view_orders_state.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../flutter_flow/flutter_flow_theme.dart';
import '../repo/view_orders_model.dart';
import '../repo/view_orders_repo.dart';

class ViewOrders extends StatefulWidget {
final List<PlacedOrderData> orders;
  const ViewOrders({Key? key,required this.orders}) : super(key: key);

  @override
  State<ViewOrders> createState() => _ViewOrdersState();
}

class _ViewOrdersState extends State<ViewOrders> {
  final ViewPlacedOrderRepo repo = ViewPlacedOrderRepo();
  @override
  void initState() {
    super.initState();
    fetchProductDetails();
  }
  Future<void> fetchProductDetails() async {
    for (final order in widget.orders) {
      final productId = order.productIds?.first;
      final product = await repo.fetchProductById(productId!);
      setState(() {
        order.product = product;
      });
    }
  }
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
            'Orders',
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
          child:ListView.builder(
              itemCount: widget.orders.length,
              itemBuilder: (context, index) {
                PlacedOrderData order= widget.orders[index];
                DateTime dateTime = DateTime.parse(order.createdAt??"");
                var dateLocal = dateTime.toLocal();
                print("dateLocal");
                print(dateLocal);
                widget.orders[index].productIds;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.23,
                    decoration: BoxDecoration(
                      color: CustomTheme.of(context).primaryText,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PlacedOrderDisplay(order: order,),
                        Divider(
                          height: 2,
                          thickness: 0.25,
                          indent: MediaQuery.of(context).size.width * 0.025,
                          endIndent:
                          MediaQuery.of(context).size.width * 0.025,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              MediaQuery.of(context).size.width * 0.030,
                              5,
                              MediaQuery.of(context).size.width * 0.025,
                              5),
                          child: AutoSizeText(
                            DateFormat('dd/MMM/yy hh:mm a').format(dateLocal),
                            style: CustomTheme.of(context)
                                .titleMedium
                                .override(
                              fontFamily: 'Poppins',
                              color: CustomTheme.of(context)
                                  .primaryBackground,
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                            maxLines: 1,
                          ),
                        ),
                        Divider(
                          height: 2,
                          thickness: 0.25,
                          indent: MediaQuery.of(context).size.width * 0.025,
                          endIndent:
                          MediaQuery.of(context).size.width * 0.025,
                          color: Colors.white,
                        ),
                        RatingWidget(),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}

class PlacedOrderDisplay extends StatefulWidget {
  final PlacedOrderData order;
  PlacedOrderDisplay( {Key? key,required this.order}) : super(key: key);

  @override
  State<PlacedOrderDisplay> createState() => _PlacedOrderDisplayState();
}

class _PlacedOrderDisplayState extends State<PlacedOrderDisplay> {
  @override
  Widget build(BuildContext context) {
    final order = widget.order;
    final product = order.product;
    print(product?.price);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width:
          MediaQuery.of(context).size.width * 0.80,
          child: Row(
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
                        0.20,
                    height: MediaQuery.of(context)
                        .size
                        .width *
                        0.15,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              VerticalDivider(
                width: 20,
                thickness: 2,
                indent: 20,
                endIndent: 0,
                color: Colors.white,
              ),
              Column(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    product?.name ?? '',
                    style: CustomTheme.of(context)
                        .titleMedium
                        .override(
                      fontFamily: 'Poppins',
                      color: CustomTheme.of(context)
                          .primaryBackground,
                      fontSize: 6,
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
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(
              0, 0, 10, 0),
          child: Icon(
            Icons.arrow_forward_ios_outlined,
            color: CustomTheme.of(context)
                .primaryBackground,
            size: 24,
          ),
        ),
      ],
    );
  }
}


class RatingWidget extends StatefulWidget {
  @override
  _RatingWidgetState createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  int _rating = 0;

  void _updateRating(int rating) {
    setState(() {
      _rating = rating;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(
              MediaQuery.of(context).size.width * 0.030,
              5,
              MediaQuery.of(context).size.width * 0.025,
              5),
          child: AutoSizeText(
            "Rating",
            style: CustomTheme.of(context).titleMedium.override(
                  fontFamily: 'Poppins',
                  color: CustomTheme.of(context).primaryBackground,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
            maxLines: 1,
          ),
        ),
        IconButton(
          icon: Icon(_rating >= 1 ? Icons.star : Icons.star_border),
          color: CustomTheme.of(context).alternate,
          onPressed: () => _updateRating(1),
        ),
        IconButton(
          icon: Icon(_rating >= 2 ? Icons.star : Icons.star_border),
          color: CustomTheme.of(context).alternate,
          onPressed: () => _updateRating(2),
        ),
        IconButton(
          icon: Icon(_rating >= 3 ? Icons.star : Icons.star_border),
          color: CustomTheme.of(context).alternate,
          onPressed: () => _updateRating(3),
        ),
        IconButton(
          icon: Icon(_rating >= 4 ? Icons.star : Icons.star_border),
          color: CustomTheme.of(context).alternate,
          onPressed: () => _updateRating(4),
        ),
        IconButton(
          icon: Icon(_rating >= 5 ? Icons.star : Icons.star_border),
          color: CustomTheme.of(context).alternate,
          onPressed: () => _updateRating(5),
        ),
      ],
    );
  }
}



