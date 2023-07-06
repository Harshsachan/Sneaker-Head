import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:neopop/widgets/buttons/neopop_tilted_button/neopop_tilted_button.dart';
import 'package:testproject/flutter_flow/flutter_flow_theme.dart';
import 'package:testproject/pages/explore/ui/add_to_cart.dart';
import 'package:testproject/pages/order/repo/order_repo.dart';
import 'package:testproject/pages/order/ui/cart_order.dart';
import 'package:testproject/pages/product/product_details.dart';

import '../explore/repo/explore_model.dart';

class CartPage extends StatefulWidget {
  CartPage({Key? key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  CartService cartService = CartService();
  List<ProductDetails> cartItems = [];

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
      loadCartItems().then((value) => totalPrice());
      super.didChangeDependencies();
  }
  void navigateBack() {
    print("going back");
    Navigator.pop(context, cartItems); // Pass the updated cart items when navigating back
  }


  Future<void> loadCartItems() async {
    List<ProductDetails> items = await cartService.getCartItems();
    setState(() {
      cartItems = items;
    });
  }

  int totalPrice() {
    print("totalPrice called");
    int price=0;
    for (var element in cartItems) {
      price= price + (element.price ?? 0);
    }
    setState(() {

    });
    print('${price}');
    return price;
  }

  void removeFromCart(ProductDetails product) async {

    if (cartItems.any((item) => item.id == product.id)) {
      cartItems.removeWhere((element) => element.id == product.id);
      // cartItems.remove(product);
      await cartService.saveCartItems(cartItems);
      setState(() {
        // Update the UI
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Removed from cart')),
      );
    }
  }

  bool isProductInCart(ProductDetails product) {
    return cartItems.any((item) => item.id == product.id);
  }




  @override
  Widget build(BuildContext context) {
    bool showBackButton = Navigator.canPop(context);
    print('${showBackButton}');
    Future<bool> _onWillPop() async {
       Navigator.pop(context, cartItems);
       return true; //<-- SEE HERE
    }
    return WillPopScope(
        onWillPop:_onWillPop,
      child: Scaffold(
          appBar:AppBar(
            backgroundColor: CustomTheme.of(context).primaryText,
            automaticallyImplyLeading: false,
            leading: showBackButton?IconButton(
                   icon: const Icon(Icons.arrow_back),
                   onPressed: navigateBack, // Call navigateBack method when the back button is pressed
                 ):null,
            title: AutoSizeText(
              'My Carts',
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
        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //   leading: showBackButton ? IconButton(
        //     icon: const Icon(Icons.arrow_back),
        //     onPressed: navigateBack, // Call navigateBack method when the back button is pressed
        //   ):null,
        //   title:   Center(child: const AutoSizeText('My Cart')),
        //   backgroundColor: CustomTheme.of(context).primaryText,
        //
        // ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            color: CustomTheme.of(context).primaryText,
          ),
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              ListView.builder(
                itemCount:  cartItems.length,
                padding: EdgeInsets.only(bottom:  MediaQuery.of(context).size.height * 0.15),
                itemBuilder: (context, index) {
                  final product =  cartItems[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SingleProductWidget(product: product),
                        ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 30, 15, 5),
                      child: Material(
                        shadowColor: Colors.purple,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.15,
                          decoration: BoxDecoration(
                            color: CustomTheme.of(context).pBackground,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: CustomTheme.of(context)
                                  .primaryBackground,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 10, 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    product.image??"",
                                    width: MediaQuery.of(context).size.width *
                                        0.35,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                height: 100,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoSizeText(
                                      product.name??"",
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
                                    AutoSizeText(
                                      product.company??'',
                                      style: CustomTheme.of(context)
                                          .bodyMedium
                                          .override(
                                        fontFamily: 'Poppins',
                                        color: CustomTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        AutoSizeText(
                                          product.price.toString(),
                                          style: CustomTheme.of(context)
                                              .bodyMedium
                                              .override(
                                            fontFamily: 'Poppins',
                                            color:
                                            CustomTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            if (isProductInCart(product)) {
                                              removeFromCart(product);
                                            } else {
                                            }
                                          },
                                          child: AutoSizeText(
                                           'Remove',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                              fontSize: CustomTheme.of(context).titleSmall.fontSize,
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            primary: CustomTheme.of(context).primary,
                                            onPrimary: Colors.white,
                                            elevation: 3,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 0),
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
                    ),
                  );
                },
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.13,
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AutoSizeText(
                              "Total \$ - ${totalPrice()}",
                              style: CustomTheme.of(context).titleMedium.override(
                                fontFamily: 'Poppins',
                                color: CustomTheme.of(context)
                                    .secondaryBackground,
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
                          onTapUp: () {
                            print("click");
                              Navigator.push(context,
                                MaterialPageRoute(
                                builder: (context) => CartCreateOrder(placeOrderRepo:PlaceOrderRepo()),
                                ),
                              );
                          },
                          decoration:  NeoPopTiltedButtonDecoration(
                            //color:  Color.fromRGBO(255, 235, 52, 1),
                            color: CustomTheme.of(context).neoColor,
                            //color: Color.fromRGBO(236, 236, 236, 1.0),
                            plunkColor: CustomTheme.of(context).neoPlunkColor,
                            shadowColor: CustomTheme.of(context).primaryText,
                            showShimmer: true,
                            shimmerColor: CustomTheme.of(context).secondaryBackground,
                          ),
                          child:  Padding(
                            padding: const EdgeInsets.all(9.0),
                            child: Center(
                              child: AutoSizeText(
                                "Place Order",
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
      ),
    );
  }
}
// "Total \$ - ${totalPrice()}"

// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) => CartCreateOrder(placeOrderRepo:PlaceOrderRepo()),
// ),
// );