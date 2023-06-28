import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:testproject/flutter_flow/flutter_flow_theme.dart';
import 'package:testproject/pages/explore/ui/add_to_cart.dart';
import 'package:testproject/pages/product/product_details.dart';

import '../explore/repo/explore_model.dart';

class CartPage extends StatefulWidget {

  const CartPage({Key? key}) : super(key: key);

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
    return Scaffold(
      appBar: AppBar(
        title:  Center(child: AutoSizeText(' My Cart')),
        backgroundColor: CustomTheme.of(context).primaryText,
        automaticallyImplyLeading: false,
      ),
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
                    padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      decoration: BoxDecoration(
                        color: CustomTheme.of(context).primaryText,
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
                            decoration: BoxDecoration(
                              color:
                              CustomTheme.of(context).primaryText,
                            ),
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
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Material(
                shadowColor:Colors.grey,
                elevation: 20,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                   height: MediaQuery.of(context).size.height * 0.10,
                  decoration: BoxDecoration(
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.grey,
                      //     spreadRadius: 4,
                      //   )
                      // ],
                    color: CustomTheme.of(context).primaryText,
                    // borderRadius: BorderRadius.circular(10),
                    // border: Border.all(
                    //   color: CustomTheme.of(context)
                    //       .primaryBackground,
                    // ),
                  ),
                  child: Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AutoSizeText("Total \$ - ${totalPrice()}",
                          style: CustomTheme.of(context)
                            .titleLarge
                            .override(
                          fontFamily: 'Poppins',
                          color:
                          CustomTheme.of(context)
                              .secondaryBackground,
                        ),),
                        ElevatedButton(
                            onPressed: () {},
                            child: AutoSizeText(
                              'Place Order',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontSize: CustomTheme.of(context).titleMedium.fontSize,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: CustomTheme.of(context).alternate,
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
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
