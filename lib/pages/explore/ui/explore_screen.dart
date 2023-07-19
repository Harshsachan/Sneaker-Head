import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../flutter_flow/flutter_flow_icon_button.dart';
import '../../../flutter_flow/flutter_flow_widgets.dart';
import '../../cart/cart_screen.dart';
import '../../product/product_details.dart';
import '../bloc/explore_bloc.dart';
import '../bloc/explore_state.dart';
import '../repo/explore_model.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'add_to_cart.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  List<ProductDetails> cartItems = [];

  void updateCartItems(List<ProductDetails> updatedCartItems) {
    setState(() {
      cartItems = updatedCartItems;
    });
  }
  void navigateToCartPage() async {
    final updatedCartItems = await Navigator.push<List<ProductDetails>>(
      context,
      MaterialPageRoute(
        builder: (context) => CartPage(),
      ),
    );

    if (updatedCartItems != null) {
      setState(() {
        cartItems = updatedCartItems;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.of(context).primaryBackground,
      body: SafeArea(
        top: true,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            color: CustomTheme.of(context).primaryText,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.07,
                decoration: BoxDecoration(
                  color: CustomTheme.of(context).primaryText,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.30,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.40,
                      child: AutoSizeText(
                        'Explore Page',
                        style: CustomTheme.of(context).headlineSmall.override(
                              fontFamily: 'Poppins',
                              color:
                                  CustomTheme.of(context).secondaryBackground,
                            ),
                      ),
                    ),
                    Container(
                      alignment: AlignmentDirectional.centerEnd,
                      width: MediaQuery.of(context).size.width * 0.30,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                        child: GestureDetector(
                          onTap: () {
                            navigateToCartPage();
                            // Navigate to CartPage
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => const CartPage(),
                            //   ),
                            // ).then((value) {
                            //   if(mounted){
                            //     setState(() {
                            //       print("setstate called on navigating back from cart page");
                            //     });
                            //   }
                            // });
                          },
                          child: Icon(
                            Icons.shopping_cart,
                            color: CustomTheme.of(context).secondaryBackground,
                            size: 35,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              BlocBuilder<ExploreBloc, ExplorePageState>(
                builder: (context, state) {
                  if (state is ExplorePageLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  else if (state is ExplorePageLoadedState) {
                    List<ProductDetails> products = state.productDetails;
                    return DataLoad(
                      productDetails: products,
                      cartItems: cartItems,
                      updateCartItems: updateCartItems,
                    );
                  } else if (state is ExplorePageErrorState) {
                    return Center(
                      child: Text(
                        "An error occurred ${state.error}",
                        style: CustomTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              color:
                                  CustomTheme.of(context).secondaryBackground,
                            ),
                      ),
                    );
                  } else {
                    return const Center(
                      child: Text('Unknown State '),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

typedef UpdateCartItemsCallback = void Function(List<ProductDetails> updatedCartItems);

class DataLoad extends StatefulWidget {
  final List<ProductDetails> productDetails;
  final UpdateCartItemsCallback updateCartItems;
  List<ProductDetails> cartItems = [];
  //final Function(List<ProductDetails>) updateCartItems;

   DataLoad({
    Key? key,
    required this.productDetails,
     required this.cartItems,
     required this.updateCartItems,
    //required this.updateCartItems,
  }) : super(key: key);

  @override
  State<DataLoad> createState() => _DataLoadState();
}

class _DataLoadState extends State<DataLoad> {
  CartService cartService = CartService();
  // List<ProductDetails> cartItems = [];

  @override
  void initState() {
    super.initState();
    //cartItems = widget.productDetails;
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    loadCartItems();
    super.didChangeDependencies();
  }

  void loadCartItems() async {
    List<ProductDetails> items = await cartService.getCartItems();
    setState(() {
      widget.cartItems = items;
    });
  }

  void addToCart(ProductDetails product) async {
    if (!widget.cartItems.any((item) => item.id == product.id)) {
      print("cartItems add");
      widget.cartItems.add(product);
      await cartService.saveCartItems(widget.cartItems);
      setState(() {
        // Update the UI
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Added to cart')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Product already in cart')),
      );
    }
  }

  void removeFromCart(ProductDetails product) async {
    print("removeFromCart called");
    if (widget.cartItems.any((item) => item.id == product.id)) {
      print("cartItem removed");
      widget.cartItems.removeWhere((element) => element.id == product.id);
      // cartItems.remove(product);
      await cartService.saveCartItems(widget.cartItems);
      print("cartItems");
      setState(() {
        // Update the UI
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Removed from cart')),
      );
    }
  }

  bool isProductInCart(ProductDetails product) {
    return widget.cartItems.any((item) => item.id == product.id);
  }

  Future<void> _navigateToSecondPage(product) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SingleProductWidget(product: product),
      ),
    );

    if (result != null) {
      setState(() {
        widget.cartItems = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        // padding: EdgeInsets.zero,
        // shrinkWrap: true,
        // scrollDirection: Axis.vertical,
        itemCount: widget.productDetails.length,
        itemBuilder: (context, index) {
          final product = widget.productDetails[index];
          return GestureDetector(
            onTap: () {
              _navigateToSecondPage(product);
              // Navigator.push(
              //   context
              //   MaterialPageRoute(
              //     builder: (context) => SingleProductWidget(product: product),
              //   ),
              // );
            },
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.15,
                decoration: BoxDecoration(
                  color: CustomTheme.of(context).primaryText,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: CustomTheme.of(context).primaryBackground,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          product.image ?? "",
                          width: MediaQuery.of(context).size.width * 0.35,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 100,
                      decoration: BoxDecoration(
                        color: CustomTheme.of(context).primaryText,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            product.name ?? "",
                            style: CustomTheme.of(context).titleMedium.override(
                                  fontFamily: 'Poppins',
                                  color:
                                      CustomTheme.of(context).primaryBackground,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                            maxLines: 1,
                          ),
                          AutoSizeText(
                            product.company??'',
                            style: CustomTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Poppins',
                                  color: CustomTheme.of(context)
                                      .secondaryBackground,
                                  fontSize: 14,
                                ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AutoSizeText(
                                product.price.toString(),
                                style:
                                    CustomTheme.of(context).bodyMedium.override(
                                          fontFamily: 'Poppins',
                                          color: CustomTheme.of(context)
                                              .secondaryBackground,
                                        ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (isProductInCart(product)) {
                                    removeFromCart(product);
                                  } else {
                                    addToCart(product);
                                  }
                                },
                                child: AutoSizeText(
                                  isProductInCart(product) ? 'Remove' : 'Add',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: CustomTheme.of(context)
                                        .titleSmall
                                        .fontSize,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: CustomTheme.of(context).primary,
                                  onPrimary: Colors.white,
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 0),
                                  textStyle: TextStyle(
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
