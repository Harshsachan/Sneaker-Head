import 'package:SneakerHead/custom_theme/ratings.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:SneakerHead/pages/explore/repo/explore_model.dart';
import 'package:SneakerHead/pages/memory/user_details.dart';
import 'package:SneakerHead/pages/sign_in/repo/signIn_model.dart';
import 'package:shimmer/shimmer.dart';

import '../../developer/meet_the_developer.dart';
import '../../explore/bloc/explore_bloc.dart';
import '../../explore/bloc/explore_state.dart';
import '../../product/product_details.dart';
import '../../../custom_theme/flutter_flow_icon_button.dart';
import '../../../custom_theme/flutter_flow_theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  UserDetailsService userDetailsService = UserDetailsService();
  String? add;
  String? name;
  List<ProductDetails> recentProducts = [];
  List<ProductDetails> popularProducts = [];

  @override
  void initState() {
    Future<LoggedInData?> shareData =
        userDetailsService.getUserDataFromSharedPreferences();
    shareData.then((value) {
      if (value != null) {
        setState(() {
          add = value.city;
          name = value.fName;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.of(context).primaryText,
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0,0,0, 24),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: CustomTheme.of(context).primaryText,
            ),
            child: SingleChildScrollView(
              child: BlocBuilder<ExploreBloc, ExplorePageState>(
                builder: (context, state) {
                  if (state is ExplorePageLoadingState) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width * 1,
                      child: Shimmer.fromColors(
                        baseColor: CustomTheme.of(context).primaryText,
                        highlightColor: Colors.white12,
                        direction: ShimmerDirection.ltr,
                        child:  Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 1,
                                  height: MediaQuery.of(context).size.height * 0.15,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 1,
                                  height: MediaQuery.of(context).size.height * 0.15,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 1,
                                  height: MediaQuery.of(context).size.height * 0.15,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 1,
                                  height: MediaQuery.of(context).size.height * 0.15,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 1,
                                  height: MediaQuery.of(context).size.height * 0.15,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 1,
                                  height: MediaQuery.of(context).size.height * 0.15,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 1,
                                  height: MediaQuery.of(context).size.height * 0.15,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        //period: Duration(milliseconds: 1000),
                      ),
                    );
                  }
                  else if (state is ExplorePageLoadedState) {
                    List<ProductDetails> products = state.productDetails;
                    recentProducts = getProductsByCategory(products, "RECENT");
                    popularProducts = getProductsByCategory(products, "POPULAR");
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Material(
                          shadowColor: CustomTheme.of(context).primaryBackground,
                          elevation: 2,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(48),
                              bottomRight: Radius.circular(48),
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(0),
                            ),
                          ),
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.1,
                            decoration: BoxDecoration(
                              color: CustomTheme.of(context).pBackground,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(48),
                                bottomRight: Radius.circular(48),
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(0),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24, 24, 24, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      FlutterFlowIconButton(
                                        borderColor: CustomTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: 20,
                                        borderWidth: 0,
                                        buttonSize: 40,
                                        fillColor:
                                            CustomTheme.of(context).primaryText,
                                        icon: FaIcon(
                                          FontAwesomeIcons.gripLines,
                                          color: CustomTheme.of(context)
                                              .primaryBackground,
                                          size: 24,
                                        ),
                                        onPressed: () {
                                        },
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          AutoSizeText(
                                            'Hey $name',
                                            style: CustomTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 10,
                                                  color: CustomTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.location_on_sharp,
                                                color: CustomTheme.of(context)
                                                    .alternate,
                                                size: 12,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(
                                                    4, 0, 0, 0),
                                                child: AutoSizeText(
                                                  '$add',
                                                  style: CustomTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 12,
                                                        color: CustomTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      FlutterFlowIconButton(
                                        borderColor: CustomTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: 20,
                                        borderWidth: 0,
                                        buttonSize: 40,
                                        fillColor:
                                            CustomTheme.of(context).primaryText,
                                        icon: Icon(
                                          Icons.account_circle_outlined,
                                          color: CustomTheme.of(context)
                                              .primaryBackground,
                                          size: 24,
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => const MeetDeveloper()),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                // Padding(
                                //   padding: const EdgeInsetsDirectional.fromSTEB(
                                //       24, 24, 24, 0),
                                //   child: TextFormField(
                                //     autofocus: false,
                                //     obscureText: false,
                                //     decoration: InputDecoration(
                                //       isDense: true,
                                //       labelText: 'Looking For shoes..',
                                //       labelStyle: CustomTheme.of(context)
                                //           .bodySmall
                                //           .override(
                                //             fontFamily: 'Poppins',
                                //             fontWeight: FontWeight.w200,
                                //           ),
                                //       hintStyle:
                                //           CustomTheme.of(context).labelMedium,
                                //       enabledBorder: OutlineInputBorder(
                                //         borderSide: BorderSide(
                                //           color: CustomTheme.of(context)
                                //               .secondaryBackground,
                                //           width: 2,
                                //         ),
                                //         borderRadius: BorderRadius.circular(18),
                                //       ),
                                //       focusedBorder: OutlineInputBorder(
                                //         borderSide: BorderSide(
                                //           color: CustomTheme.of(context)
                                //               .secondaryBackground,
                                //           width: 2,
                                //         ),
                                //         borderRadius: BorderRadius.circular(18),
                                //       ),
                                //       errorBorder: OutlineInputBorder(
                                //         borderSide: BorderSide(
                                //           color: CustomTheme.of(context).error,
                                //           width: 2,
                                //         ),
                                //         borderRadius: BorderRadius.circular(18),
                                //       ),
                                //       focusedErrorBorder: OutlineInputBorder(
                                //         borderSide: BorderSide(
                                //           color: CustomTheme.of(context).error,
                                //           width: 2,
                                //         ),
                                //         borderRadius: BorderRadius.circular(18),
                                //       ),
                                //       filled: true,
                                //       fillColor: CustomTheme.of(context)
                                //           .primaryBackground,
                                //       prefixIcon: Icon(
                                //         Icons.search,
                                //         color:
                                //             CustomTheme.of(context).secondaryText,
                                //         size: 12,
                                //       ),
                                //     ),
                                //     style: CustomTheme.of(context).bodyMedium,
                                //     // validator: _model.textControllerValidator
                                //     //     .asValidator(context),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),

                        // Popular shoes text
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(26, 20, 26, 0),
                          child: SizedBox(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.05,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AutoSizeText(
                                  'Popular Shoes',
                                  style: CustomTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        color: CustomTheme.of(context).accent3,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Popular Shoes Container
                        _buildCategoryList("RECENT", recentProducts),

                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(24, 24, 24, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AutoSizeText(
                                'New Arrivals',
                                style: CustomTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      color: CustomTheme.of(context).accent3,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        // GridView Builder
                        _buildCategoryGrid("POPULAR", popularProducts)
                      ],
                    );
                  }

                  else if (state is ExplorePageErrorState) {
                    return Center(
                      child: Text(
                        "An error occurred ${state.error}",
                        style: CustomTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              color: CustomTheme.of(context).secondaryBackground,
                            ),
                      ),
                    );
                  }
                  else {
                    return const Center(
                      child: Text("Unknown STATE"),
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<ProductDetails> getProductsByCategory(
      List<ProductDetails> products, String category) {
    return products.where((product) => product.category == category).toList();
  }

  Widget _buildCategoryList(String category, List<ProductDetails> products) {
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height *
            0.35, // Adjust the height as needed
        enableInfiniteScroll: true,
        autoPlay: true,
      ),
      items: products.map((product) {
        return Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(24, 08, 24, 0),
          child: Material(
            //color: Colors.red,
            shadowColor: CustomTheme.of(context).primaryBackground,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22),
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SingleProductWidget(product: product),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: CustomTheme.of(context).pBackground,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          product.image??'',
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                '${product.name}',
                                style:
                                    CustomTheme.of(context).titleSmall.override(
                                          fontFamily: 'Poppins',
                                          color: CustomTheme.of(context)
                                              .primaryBackground,
                                          fontSize: 2,
                                        ),
                              ),
                              AutoSizeText(
                                '${product.price}',
                                style:
                                    CustomTheme.of(context).bodyMedium.override(
                                          fontFamily: 'Poppins',
                                          color: CustomTheme.of(context)
                                              .primaryBackground,
                                        ),
                              ),
                              Rating(rating: product.averageRating),
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
      }).toList(),
    );
  }

  Widget _buildCategoryGrid(String category, List<ProductDetails> products) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(24, 24, 24, 0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          final product = products[index];
          return Material(
            color: CustomTheme.of(context).primaryBackground,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SingleProductWidget(product: product),
                  ),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  color: CustomTheme.of(context).pBackground,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        product.image ?? "",
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.1,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.30,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  '${product.name}',
                                  wrapWords: false,
                                  maxLines: 1,
                                  style: CustomTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: CustomTheme.of(context)
                                            .primaryBackground,
                                        fontSize: 2,
                                      ),
                                ),
                                AutoSizeText(
                                  '\$ ${product.price}',
                                  style: CustomTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: CustomTheme.of(context)
                                            .primaryBackground,
                                        //fontSize: 9,
                                      ),
                                ),
                                Rating(rating: product.averageRating)
                              ],
                            ),
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
