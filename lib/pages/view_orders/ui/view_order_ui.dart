import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../custom_theme/flutter_flow_theme.dart';
import '../../ratings/ui/ratingUI.dart';
import '../repo/view_orders_model.dart';
import '../repo/view_orders_repo.dart';
import 'view_full_order_ui.dart';

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
      if(mounted){
      setState(() {
        order.product = product;
      });}
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
                () {
                  Navigator.pop(context);
                }, // Call navigateBack method when the back button is pressed
          ),
          title: AutoSizeText(
            'Orders',
            style: CustomTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 22,
                ),
          ),
          //actions: [],
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
                widget.orders[index].productIds;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    shadowColor: Colors.purple,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.23,
                      decoration: BoxDecoration(
                        color: CustomTheme.of(context).primaryText,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: CustomTheme.of(context)
                              .primaryBackground,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PlacedOrderDisplay(order: order),
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
                              DateFormat('dd-MMM-yy hh:mm a').format(dateLocal),
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
                          RatingUi(),
                        ],
                      ),
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

// Import 'package:flutter/material.dart' and other necessary packages

class _PlacedOrderDisplayState extends State<PlacedOrderDisplay> {
  @override
  Widget build(BuildContext context) {
    final order = widget.order;
    final product = order.product;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ViewFullOrderDart(order: order, product: product),
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 10, 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      product?.image ?? "https://picsum.photos/seed/472/601",
                      width: MediaQuery.of(context).size.width * 0.20,
                      height: MediaQuery.of(context).size.width * 0.15,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                VerticalDivider(
                  width: 20,
                  thickness: 2,
                  indent: 20,
                  endIndent: 10,
                  color: Colors.white,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        product?.name ?? '',
                        style: CustomTheme.of(context).titleMedium.override(
                          fontFamily: 'Poppins',
                          color: CustomTheme.of(context).primaryBackground,
                          fontWeight: FontWeight.w400,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      AutoSizeText(
                        product?.description ?? "",
                        style: CustomTheme.of(context).titleMedium.override(
                          fontFamily: 'Poppins',
                          color: CustomTheme.of(context).primaryBackground,
                          fontWeight: FontWeight.w200,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      AutoSizeText(
                        "Size : 39",
                        style: CustomTheme.of(context).titleMedium.override(
                          fontFamily: 'Poppins',
                          color: CustomTheme.of(context).primaryBackground,
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
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.arrow_forward_ios_outlined,
              color: CustomTheme.of(context).primaryBackground,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}



// class RatingWidget extends StatefulWidget {
//   @override
//   _RatingWidgetState createState() => _RatingWidgetState();
// }
//
// class _RatingWidgetState extends State<RatingWidget> {
//   int _rating = 0;
//
//   void _updateRating(int rating) {
//     setState(() {
//       _rating = rating;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Padding(
//           padding: EdgeInsetsDirectional.fromSTEB(
//               MediaQuery.of(context).size.width * 0.030,
//               5,
//               MediaQuery.of(context).size.width * 0.025,
//               5),
//           child: AutoSizeText(
//             "Rating",
//             style: CustomTheme.of(context).titleMedium.override(
//                   fontFamily: 'Poppins',
//                   color: CustomTheme.of(context).primaryBackground,
//                   fontSize: 16,
//                   fontWeight: FontWeight.w300,
//                 ),
//             maxLines: 1,
//           ),
//         ),
//         IconButton(
//           icon: Icon(_rating >= 1 ? Icons.star : Icons.star_border),
//           color: CustomTheme.of(context).alternate,
//           onPressed: () => _updateRating(1),
//         ),
//         IconButton(
//           icon: Icon(_rating >= 2 ? Icons.star : Icons.star_border),
//           color: CustomTheme.of(context).alternate,
//           onPressed: () => _updateRating(2),
//         ),
//         IconButton(
//           icon: Icon(_rating >= 3 ? Icons.star : Icons.star_border),
//           color: CustomTheme.of(context).alternate,
//           onPressed: () => _updateRating(3),
//         ),
//         IconButton(
//           icon: Icon(_rating >= 4 ? Icons.star : Icons.star_border),
//           color: CustomTheme.of(context).alternate,
//           onPressed: () => _updateRating(4),
//         ),
//         IconButton(
//           icon: Icon(_rating >= 5 ? Icons.star : Icons.star_border),
//           color: CustomTheme.of(context).alternate,
//           onPressed: () => _updateRating(5),
//         ),
//       ],
//     );
//   }
// }



