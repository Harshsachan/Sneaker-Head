import 'package:auto_size_text/auto_size_text.dart';
import 'package:SneakerHead/pages/explore/ui/add_to_cart.dart';
import 'package:SneakerHead/pages/order/repo/order_repo.dart';
import 'package:SneakerHead/pages/order/ui/order.dart';

import '../../custom_theme/ratings.dart';
import '../explore/repo/explore_model.dart';
import '../../custom_theme/flutter_flow_icon_button.dart';
import '../../custom_theme/flutter_flow_theme.dart';
import '../../custom_theme/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'repo/fetchReview.dart';
import 'repo/ratingsReview_model.dart';

class SingleProductWidget extends StatefulWidget {
  final ProductDetails product;

  const SingleProductWidget({Key? key, required this.product})
      : super(key: key);

  @override
  State<SingleProductWidget> createState() => _SingleProductWidgetState();
}

class _SingleProductWidgetState extends State<SingleProductWidget> {
  CartService cartService = CartService();
  List<ProductDetails> cartItems = [];
  final FetchReviewRepo _fetchReviewRepo = FetchReviewRepo();
  List<FindReviewsAndRatingsByProductId> reviews = [];
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadCartItems();
    fetchReviews(widget.product.id);
  }

  Future<void> fetchReviews(int? productId) async {
    try {
      List<FindReviewsAndRatingsByProductId> fetchedReviews =
          await _fetchReviewRepo.fetchAllReview(productId!);
      setState(() {
        reviews = fetchedReviews; // Update the state with the fetched reviews
      });
      // Do something with the reviews, e.g., update the UI with the fetched data
    } catch (error) {
      // Handle the error, e.g., show an error message
    }
  }

  void loadCartItems() async {
    List<ProductDetails> items = await cartService.getCartItems();
    setState(() {
      cartItems = items;
    });
  }

  void addToCart(ProductDetails product) async {
    if (!cartItems.any((item) => item.id == product.id)) {
      cartItems.add(product);
      await cartService.saveCartItems(cartItems);
      setState(() {
        // Update the UI
      });
    } else {}
  }

  void removeFromCart(ProductDetails product) async {
    if (cartItems.any((item) => item.id == product.id)) {
      cartItems.removeWhere((element) => element.id == product.id);
      await cartService.saveCartItems(cartItems);
      setState(() {
        // Update the UI
      });
    }
  }

  bool isProductInCart(ProductDetails product) {
    return cartItems.any((item) => item.id == product.id);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomTheme.of(context).primaryText,
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                      color: CustomTheme.of(context).primaryBackground),
                  child: Column(
                    //mainAxisSize: MainAxisSize.max,
                    children: [
                      //Image
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.4,
                        decoration: BoxDecoration(
                          color: CustomTheme.of(context).primaryBackground,
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0, 0),
                              child: Hero(
                                tag: 'productShoe',
                                transitionOnUserGestures: true,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0),
                                  child: Image.network(
                                    widget.product.image ?? '',
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8, 8, 8, 8),
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color:
                                    CustomTheme.of(context).primaryBackground,
                                elevation: 100,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  buttonSize: 46,
                                  icon: Icon(
                                    Icons.arrow_back_ios_outlined,
                                    color: CustomTheme.of(context).primaryText,
                                    size: 24,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context, cartItems);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //Details
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: CustomTheme.of(context).primaryText,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24, 0, 24, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                              ),
                              AutoSizeText(
                                widget.product.name ?? '',
                                style: CustomTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: CustomTheme.of(context)
                                          .primaryBackground,
                                      // fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                maxLines: 1,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  AutoSizeText(
                                    'Retailed by ',
                                    style: CustomTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: CustomTheme.of(context)
                                              .primaryBackground,
                                        ),
                                  ),
                                  AutoSizeText(
                                    widget.product.company ?? '',
                                    style: CustomTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: CustomTheme.of(context)
                                              .primaryBackground,
                                        ),
                                  ),
                                ],
                              ),
                              AutoSizeText(
                                '\$ - ${widget.product.price}',
                                style: CustomTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: CustomTheme.of(context).alternate,
                                    ),
                              ),
                              AutoSizeText(
                                'DESCRIPTION',
                                style: CustomTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: CustomTheme.of(context)
                                          .primaryBackground,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 10, 0, 0),
                                child: AutoSizeText(
                                  '${widget.product.description}',
                                  textAlign: TextAlign.justify,
                                  style: CustomTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: CustomTheme.of(context)
                                            .primaryBackground,
                                        //fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 10, 0, 10),
                                child: Row(
                                  children: [
                                    AutoSizeText(
                                      'Reviews',
                                      style: CustomTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: CustomTheme.of(context)
                                                .primaryBackground,
                                          ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          5, 0, 0, 0),
                                      child: AutoSizeText(
                                        '(${reviews.length.toString()})',
                                        style: CustomTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: CustomTheme.of(context)
                                                  .primaryBackground,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                  height: 0.1,
                                  color: CustomTheme.of(context)
                                      .secondaryBackground),
                              reviews.isEmpty // Check if the reviews list is empty
                                  ? Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: AutoSizeText(
                                          'No review\'s available',
                                          style: CustomTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: CustomTheme.of(context)
                                                    .primaryBackground,
                                              ),
                                        ),
                                      ),
                                    ) // Display a message if there are no reviews
                                  : ListView.builder(
                                      //scrollDirection: Axis.vertical,
                                      physics: const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: reviews.length,
                                      itemBuilder: (context, index) {
                                        final review = reviews[index];
                                        return Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  15, 10, 0, 0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              AutoSizeText(
                                                review.customerFullName ?? '',
                                                style: CustomTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color: CustomTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                    ),
                                              ),
                                              Rating(
                                                  rating: review.rating!
                                                      .toDouble()),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(2, 5, 0, 0),
                                                child: AutoSizeText(
                                                  review.review ??
                                                      'No review ',
                                                  style: CustomTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: CustomTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                      ),
                                                  // maxLines: 2,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: CustomTheme.of(context).primaryText,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 4,
                    color: Colors.white,
                    offset: Offset(0, 1),
                  )
                ],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 52),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FFButtonWidget(
                      onPressed: () {
                        if (isProductInCart(widget.product)) {
                          removeFromCart(widget.product);
                        } else {
                          addToCart(widget.product);
                        }
                      },
                      text: isProductInCart(widget.product)
                          ? 'Remove From Cart'
                          : 'Add To cart',
                      icon: FaIcon(
                        FontAwesomeIcons.cartShopping,
                        color: CustomTheme.of(context).secondaryBackground,
                        size: 20,
                      ),
                      options: FFButtonOptions(
                        width: 160,
                        height: 50,
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: CustomTheme.of(context).primaryText,
                        textStyle: CustomTheme.of(context).titleSmall.override(
                              fontFamily: 'Outfit',
                              color:
                                  CustomTheme.of(context).secondaryBackground,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                        elevation: 0,
                        borderSide: BorderSide(
                          color: CustomTheme.of(context).alternate,
                          width: 2,
                        ),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () {
                        // if(!isProductInCart(widget.product))
                        //   {
                        //     addToCart(widget.product);
                        //   }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OneCreateOrder(
                                product: widget.product,
                                placeOrderRepo: PlaceOrderRepo()),
                          ),
                        );
                      },
                      text: 'Buy Now',
                      icon: FaIcon(
                        FontAwesomeIcons.shopify,
                        color: CustomTheme.of(context).secondaryBackground,
                        size: 20,
                      ),
                      options: FFButtonOptions(
                        width: 160,
                        height: 50,
                        color: CustomTheme.of(context).alternate,
                        textStyle: CustomTheme.of(context).titleSmall.override(
                              fontFamily: 'Outfit',
                              color:
                                  CustomTheme.of(context).secondaryBackground,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                        elevation: 0,
                        borderSide: BorderSide(
                          color: CustomTheme.of(context).alternate,
                          width: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
