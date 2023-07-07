import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:SneakerHead/pages/explore/repo/explore_model.dart';
import 'package:SneakerHead/pages/home/bloc/home_bloc.dart';
import 'package:SneakerHead/pages/home/bloc/home_state.dart';
import 'package:SneakerHead/pages/memory/user_details.dart';
import 'package:SneakerHead/pages/sign_in/repo/signIn_model.dart';

import '../../../flutter_flow/flutter_flow_model.dart';
import '../../explore/bloc/explore_bloc.dart';
import '../../explore/bloc/explore_state.dart';
import '../../product/product_details.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'home_screen_model.dart';
export 'home_screen_model.dart';

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
    final List<String> cardImages = [
      'https://picsum.photos/seed/472/601',
      'https://picsum.photos/seed/473/602',
      'https://picsum.photos/seed/474/603',
      'https://picsum.photos/seed/489/601',
      'https://picsum.photos/seed/493/601',
      // Add more image URLs as needed
    ];
    return Scaffold(
      backgroundColor: CustomTheme.of(context).primaryText,
      body: SafeArea(
        top: true,
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
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is ExplorePageLoadedState) {
                  List<ProductDetails> products = state.productDetails;
                  recentProducts = getProductsByCategory(products, "RECENT");
                  popularProducts = getProductsByCategory(products, "POPULAR");

                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Material(
                        shadowColor: CustomTheme.of(context).primaryBackground,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(48),
                            bottomRight: Radius.circular(48),
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(0),
                          ),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.2,
                          decoration: BoxDecoration(
                            color: CustomTheme.of(context).pBackground,
                            borderRadius: BorderRadius.only(
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
                                padding: EdgeInsetsDirectional.fromSTEB(
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
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        AutoSizeText(
                                          'Hey ${name}',
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
                                              padding: EdgeInsets.fromLTRB(
                                                  4, 0, 0, 0),
                                              child: AutoSizeText(
                                                '${add}',
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
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24, 24, 24, 0),
                                child: TextFormField(
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelText: 'Looking For shoes..',
                                    labelStyle: CustomTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w200,
                                        ),
                                    hintStyle:
                                        CustomTheme.of(context).labelMedium,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: CustomTheme.of(context)
                                            .secondaryBackground,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: CustomTheme.of(context)
                                            .secondaryBackground,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: CustomTheme.of(context).error,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: CustomTheme.of(context).error,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    filled: true,
                                    fillColor: CustomTheme.of(context)
                                        .primaryBackground,
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color:
                                          CustomTheme.of(context).secondaryText,
                                      size: 12,
                                    ),
                                  ),
                                  style: CustomTheme.of(context).bodyMedium,
                                  // validator: _model.textControllerValidator
                                  //     .asValidator(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Popular shoes text
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(26, 20, 26, 0),
                        child: Container(
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
                              AutoSizeText(
                                'View All',
                                style: CustomTheme.of(context)
                                    .bodySmall
                                    .override(
                                      decoration: TextDecoration.underline,
                                      fontFamily: 'Poppins',
                                      fontSize: 10,
                                      color: CustomTheme.of(context).accent3,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Popular Shoes Container
                      _buildCategoryList("RECENT", recentProducts),
                      // CarouselSlider(
                      //   options: CarouselOptions(
                      //     height: MediaQuery.of(context).size.height *
                      //         0.35, // Adjust the height as needed
                      //     enableInfiniteScroll: true,
                      //     autoPlay: true,
                      //   ),
                      //   items: cardImages.map((url) {
                      //     return Padding(
                      //       padding:
                      //       EdgeInsetsDirectional.fromSTEB(24, 8, 24, 0),
                      //       child: Material(
                      //         //color: Colors.red,
                      //         shadowColor:
                      //         CustomTheme.of(context).primaryBackground,
                      //         elevation: 2,
                      //         shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(24),
                      //         ),
                      //         child: Container(
                      //           decoration: BoxDecoration(
                      //             color: CustomTheme.of(context).pBackground,
                      //             borderRadius: BorderRadius.circular(24),
                      //           ),
                      //           child: Column(
                      //             mainAxisSize: MainAxisSize.max,
                      //             children: [
                      //               Padding(
                      //                 padding: EdgeInsetsDirectional.fromSTEB(
                      //                     12, 12, 12, 0),
                      //                 child: ClipRRect(
                      //                   borderRadius: BorderRadius.circular(12),
                      //                   child: Image.network(
                      //                     'https://picsum.photos/seed/472/601',
                      //                     width: double.infinity,
                      //                     height: 200,
                      //                     fit: BoxFit.cover,
                      //                   ),
                      //                 ),
                      //               ),
                      //               Padding(
                      //                 padding: EdgeInsetsDirectional.fromSTEB(
                      //                     12, 12, 12, 0),
                      //                 child: Row(
                      //                   mainAxisSize: MainAxisSize.max,
                      //                   mainAxisAlignment:
                      //                   MainAxisAlignment.spaceBetween,
                      //                   children: [
                      //                     Column(
                      //                       mainAxisSize: MainAxisSize.max,
                      //                       mainAxisAlignment:
                      //                       MainAxisAlignment.spaceBetween,
                      //                       crossAxisAlignment:
                      //                       CrossAxisAlignment.start,
                      //                       children: [
                      //                         Text(
                      //                           'Jordan Classic',
                      //                           style: CustomTheme.of(context)
                      //                               .titleSmall
                      //                               .override(
                      //                             fontFamily: 'Poppins',
                      //                             color: CustomTheme.of(
                      //                                 context)
                      //                                 .primaryBackground,
                      //                             fontSize: 16,
                      //                           ),
                      //                         ),
                      //                         Text(
                      //                           '\$89.93',
                      //                           style: CustomTheme.of(context)
                      //                               .bodyMedium
                      //                               .override(
                      //                             fontFamily: 'Poppins',
                      //                             color: CustomTheme.of(
                      //                                 context)
                      //                                 .primaryBackground,
                      //                           ),
                      //                         ),
                      //                       ],
                      //                     ),
                      //                     Container(
                      //                       width: 50,
                      //                       height: 50,
                      //                       decoration: BoxDecoration(
                      //                         color: CustomTheme.of(context)
                      //                             .secondaryBackground,
                      //                         shape: BoxShape.circle,
                      //                       ),
                      //                       child: FlutterFlowIconButton(
                      //                         borderColor:
                      //                         CustomTheme.of(context)
                      //                             .primaryBackground,
                      //                         borderRadius: 200,
                      //                         borderWidth: 1,
                      //                         buttonSize: 30,
                      //                         fillColor: CustomTheme.of(context)
                      //                             .primaryText,
                      //                         icon: Icon(
                      //                           Icons.add,
                      //                           color: CustomTheme.of(context)
                      //                               .primaryBackground,
                      //                           size: 24,
                      //                         ),
                      //                         onPressed: () {
                      //                           print('IconButton pressed ...');
                      //                         },
                      //                       ),
                      //                     ),
                      //                   ],
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       ),
                      //     );
                      //   }).toList(),
                      // ),
                      // Padding(
                      //   padding: EdgeInsetsDirectional.fromSTEB(24, 8, 24, 0),
                      //   child: Material(
                      //     //color: Colors.red,
                      //     shadowColor: Colors.purple,
                      //     elevation: 10,
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(24),
                      //     ),
                      //     child: Container(
                      //       width: double.infinity,
                      //       height: MediaQuery.of(context).size.height * 0.35,
                      //       decoration: BoxDecoration(
                      //         color: CustomTheme.of(context).secondaryBackground,
                      //         borderRadius: BorderRadius.circular(24),
                      //       ),
                      //       child: Column(
                      //         mainAxisSize: MainAxisSize.max,
                      //         children: [
                      //           Padding(
                      //             padding:
                      //                 EdgeInsetsDirectional.fromSTEB(12, 12, 12, 0),
                      //             child: ClipRRect(
                      //               borderRadius: BorderRadius.circular(12),
                      //               child: Image.network(
                      //                 'https://picsum.photos/seed/472/601',
                      //                 width: double.infinity,
                      //                 height: 200,
                      //                 fit: BoxFit.cover,
                      //               ),
                      //             ),
                      //           ),
                      //           Padding(
                      //             padding:
                      //                 EdgeInsetsDirectional.fromSTEB(12, 12, 12, 0),
                      //             child: Row(
                      //               mainAxisSize: MainAxisSize.max,
                      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //               children: [
                      //                 Column(
                      //                   mainAxisSize: MainAxisSize.max,
                      //                   mainAxisAlignment:
                      //                       MainAxisAlignment.spaceBetween,
                      //                   crossAxisAlignment: CrossAxisAlignment.start,
                      //                   children: [
                      //                     Text(
                      //                       'Jordan Classic',
                      //                       style: CustomTheme.of(context)
                      //                           .titleSmall
                      //                           .override(
                      //                             fontFamily: 'Poppins',
                      //                             color: CustomTheme.of(context)
                      //                                 .primaryText,
                      //                             fontSize: 16,
                      //                           ),
                      //                     ),
                      //                     Text(
                      //                       '\$89.93',
                      //                       style: CustomTheme.of(context)
                      //                           .bodyMedium
                      //                           .override(
                      //                             fontFamily: 'Poppins',
                      //                             color: CustomTheme.of(context)
                      //                                 .primaryText,
                      //                           ),
                      //                     ),
                      //                   ],
                      //                 ),
                      //                 Container(
                      //                   width: 50,
                      //                   height: 50,
                      //                   decoration: BoxDecoration(
                      //                     color: CustomTheme.of(context)
                      //                         .secondaryBackground,
                      //                     shape: BoxShape.circle,
                      //                   ),
                      //                   child: FlutterFlowIconButton(
                      //                     borderColor:
                      //                         CustomTheme.of(context).primary,
                      //                     borderRadius: 200,
                      //                     borderWidth: 1,
                      //                     buttonSize: 30,
                      //                     fillColor:
                      //                         CustomTheme.of(context).primaryText,
                      //                     icon: Icon(
                      //                       Icons.add,
                      //                       color: CustomTheme.of(context)
                      //                           .primaryBackground,
                      //                       size: 24,
                      //                     ),
                      //                     onPressed: () {
                      //                       print('IconButton pressed ...');
                      //                     },
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      // New Arrivals Text

                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 0),
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
                            AutoSizeText(
                              'View All',
                              style: CustomTheme.of(context).bodySmall.override(
                                    decoration: TextDecoration.underline,
                                    fontFamily: 'Poppins',
                                    fontSize: 10,
                                    color: CustomTheme.of(context).accent3,
                                  ),
                            )
                          ],
                        ),
                      ),
                      // GridView Builder
                      _buildCategoryGrid("POPULAR", popularProducts)
                      // New Arrivals Container
                      // Padding(
                      //   padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 0),
                      //   child: Row(
                      //     mainAxisSize: MainAxisSize.max,
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Material(
                      //         color: Colors.transparent,
                      //         elevation: 10,
                      //         shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(12),
                      //         ),
                      //         child: Container(
                      //           width: MediaQuery.of(context).size.width * 0.4,
                      //           height: MediaQuery.of(context).size.height * 0.2,
                      //           decoration: BoxDecoration(
                      //             color: CustomTheme.of(context).secondaryBackground,
                      //             borderRadius: BorderRadius.circular(12),
                      //           ),
                      //           child: Column(
                      //             mainAxisSize: MainAxisSize.max,
                      //             children: [
                      //               Padding(
                      //                 padding: EdgeInsetsDirectional.fromSTEB(
                      //                     10, 10, 10, 0),
                      //                 child: ClipRRect(
                      //                   borderRadius: BorderRadius.circular(8),
                      //                   child: Image.network(
                      //                     'https://picsum.photos/seed/474/600',
                      //                     width: double.infinity,
                      //                     height: MediaQuery.of(context).size.height *
                      //                         0.1,
                      //                     fit: BoxFit.cover,
                      //                   ),
                      //                 ),
                      //               ),
                      //               Padding(
                      //                 padding: EdgeInsetsDirectional.fromSTEB(
                      //                     10, 20, 10, 0),
                      //                 child: Row(
                      //                   mainAxisSize: MainAxisSize.max,
                      //                   mainAxisAlignment:
                      //                       MainAxisAlignment.spaceBetween,
                      //                   children: [
                      //                     Column(
                      //                       mainAxisSize: MainAxisSize.max,
                      //                       mainAxisAlignment:
                      //                           MainAxisAlignment.spaceBetween,
                      //                       crossAxisAlignment:
                      //                           CrossAxisAlignment.start,
                      //                       children: [
                      //                         Text(
                      //                           'Jordan Classic',
                      //                           style: CustomTheme.of(context)
                      //                               .titleSmall
                      //                               .override(
                      //                                 fontFamily: 'Poppins',
                      //                                 color: CustomTheme.of(context)
                      //                                     .primaryText,
                      //                                 fontSize: 10,
                      //                               ),
                      //                         ),
                      //                         Text(
                      //                           '\$89.93',
                      //                           style: CustomTheme.of(context)
                      //                               .bodyMedium
                      //                               .override(
                      //                                 fontFamily: 'Poppins',
                      //                                 color: CustomTheme.of(context)
                      //                                     .primaryText,
                      //                                 fontSize: 9,
                      //                               ),
                      //                         ),
                      //                       ],
                      //                     ),
                      //                     Container(
                      //                       width: MediaQuery.of(context).size.width *
                      //                           0.08,
                      //                       height:
                      //                           MediaQuery.of(context).size.width *
                      //                               0.08,
                      //                       decoration: BoxDecoration(
                      //                         color: CustomTheme.of(context)
                      //                             .secondaryBackground,
                      //                         shape: BoxShape.circle,
                      //                       ),
                      //                       child: FlutterFlowIconButton(
                      //                         borderColor:
                      //                             CustomTheme.of(context).primary,
                      //                         borderRadius: 800,
                      //                         borderWidth: 1,
                      //                         buttonSize: 15,
                      //                         fillColor:
                      //                             CustomTheme.of(context).primaryText,
                      //                         icon: Icon(
                      //                           Icons.add,
                      //                           color: CustomTheme.of(context)
                      //                               .primaryBackground,
                      //                           size: 16,
                      //                         ),
                      //                         onPressed: () {
                      //                           print('IconButton pressed ...');
                      //                         },
                      //                       ),
                      //                     ),
                      //                   ],
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       ),
                      //       Material(
                      //         color: Colors.transparent,
                      //         elevation: 10,
                      //         shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(12),
                      //         ),
                      //         child: Container(
                      //           width: MediaQuery.of(context).size.width * 0.4,
                      //           height: MediaQuery.of(context).size.height * 0.2,
                      //           decoration: BoxDecoration(
                      //             color: CustomTheme.of(context).secondaryBackground,
                      //             borderRadius: BorderRadius.circular(12),
                      //           ),
                      //           child: Column(
                      //             mainAxisSize: MainAxisSize.max,
                      //             children: [
                      //               Padding(
                      //                 padding: EdgeInsetsDirectional.fromSTEB(
                      //                     10, 10, 10, 0),
                      //                 child: ClipRRect(
                      //                   borderRadius: BorderRadius.circular(8),
                      //                   child: Image.network(
                      //                     'https://picsum.photos/seed/471/600',
                      //                     width: double.infinity,
                      //                     height: MediaQuery.of(context).size.height *
                      //                         0.1,
                      //                     fit: BoxFit.cover,
                      //                   ),
                      //                 ),
                      //               ),
                      //               Padding(
                      //                 padding: EdgeInsetsDirectional.fromSTEB(
                      //                     10, 20, 10, 0),
                      //                 child: Row(
                      //                   mainAxisSize: MainAxisSize.max,
                      //                   mainAxisAlignment:
                      //                       MainAxisAlignment.spaceBetween,
                      //                   children: [
                      //                     Column(
                      //                       mainAxisSize: MainAxisSize.max,
                      //                       mainAxisAlignment:
                      //                           MainAxisAlignment.spaceBetween,
                      //                       crossAxisAlignment:
                      //                           CrossAxisAlignment.start,
                      //                       children: [
                      //                         Text(
                      //                           'Jordan Classic',
                      //                           style: CustomTheme.of(context)
                      //                               .titleSmall
                      //                               .override(
                      //                                 fontFamily: 'Poppins',
                      //                                 color: CustomTheme.of(context)
                      //                                     .primaryText,
                      //                                 fontSize: 10,
                      //                               ),
                      //                         ),
                      //                         Text(
                      //                           '\$89.93',
                      //                           style: CustomTheme.of(context)
                      //                               .bodyMedium
                      //                               .override(
                      //                                 fontFamily: 'Poppins',
                      //                                 color: CustomTheme.of(context)
                      //                                     .primaryText,
                      //                                 fontSize: 9,
                      //                               ),
                      //                         ),
                      //                       ],
                      //                     ),
                      //                     Container(
                      //                       width: MediaQuery.of(context).size.width *
                      //                           0.08,
                      //                       height:
                      //                           MediaQuery.of(context).size.width *
                      //                               0.08,
                      //                       decoration: BoxDecoration(
                      //                         color: CustomTheme.of(context)
                      //                             .secondaryBackground,
                      //                         shape: BoxShape.circle,
                      //                       ),
                      //                       child: FlutterFlowIconButton(
                      //                         borderColor:
                      //                             CustomTheme.of(context).primary,
                      //                         borderRadius: 800,
                      //                         borderWidth: 1,
                      //                         buttonSize: 15,
                      //                         fillColor:
                      //                             CustomTheme.of(context).primaryText,
                      //                         icon: Icon(
                      //                           Icons.add,
                      //                           color: CustomTheme.of(context)
                      //                               .primaryBackground,
                      //                           size: 16,
                      //                         ),
                      //                         onPressed: () {
                      //                           print('IconButton pressed ...');
                      //                         },
                      //                       ),
                      //                     ),
                      //                   ],
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  );
                } else if (state is ExplorePageErrorState) {
                  return Center(
                    child: Text(
                      "An error occurred ${state.error}",
                      style: CustomTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            color: CustomTheme.of(context).secondaryBackground,
                          ),
                    ),
                  );
                } else {
                  return const Center(
                    child: Text("Unknown STATE"),
                  );
                }
              },
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
          padding: EdgeInsetsDirectional.fromSTEB(24, 08, 24, 0),
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
                      padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 0),
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
                      padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 0),
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
                              Text(
                                '${product.price}',
                                style:
                                    CustomTheme.of(context).bodyMedium.override(
                                          fontFamily: 'Poppins',
                                          color: CustomTheme.of(context)
                                              .primaryBackground,
                                        ),
                              ),
                            ],
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color:
                                  CustomTheme.of(context).secondaryBackground,
                              shape: BoxShape.circle,
                            ),
                            child: FlutterFlowIconButton(
                              borderColor:
                                  CustomTheme.of(context).primaryBackground,
                              borderRadius: 200,
                              borderWidth: 1,
                              buttonSize: 30,
                              fillColor: CustomTheme.of(context).primaryText,
                              icon: Icon(
                                Icons.add,
                                color:
                                    CustomTheme.of(context).primaryBackground,
                                size: 24,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
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
      padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                      padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.25,
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
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.08,
                            height: MediaQuery.of(context).size.width * 0.08,
                            decoration: BoxDecoration(
                              color:
                                  CustomTheme.of(context).secondaryBackground,
                              shape: BoxShape.circle,
                            ),
                            child: FlutterFlowIconButton(
                              borderColor:
                                  CustomTheme.of(context).primaryBackground,
                              borderRadius: 800,
                              borderWidth: 1,
                              buttonSize: 15,
                              fillColor: CustomTheme.of(context).primaryText,
                              icon: Icon(
                                Icons.add,
                                color:
                                    CustomTheme.of(context).primaryBackground,
                                size: 16,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
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
