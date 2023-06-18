import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../flutter_flow/flutter_flow_icon_button.dart';
import '../../../flutter_flow/flutter_flow_widgets.dart';
import '../../product/product_details.dart';
import '../bloc/explore_bloc.dart';
import '../bloc/explore_state.dart';
import '../repo/explore_model.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 5, 0, 0),
                      child: Icon(
                        Icons.arrow_back_ios_outlined,
                        color: CustomTheme.of(context)
                            .secondaryBackground,
                        size: 35,
                      ),
                    ),
                    Text(
                      'Explore Page',
                      style: CustomTheme.of(context)
                          .headlineSmall
                          .override(
                        fontFamily: 'Poppins',
                        color: CustomTheme.of(context)
                            .secondaryBackground,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 15, 0),
                      child: Icon(
                        Icons.favorite_sharp,
                        color: CustomTheme.of(context)
                            .secondaryBackground,
                        size: 35,
                      ),
                    ),
                  ],
                ),
              ),
              BlocBuilder<ExploreBloc, ExplorePageState>(
                    builder: (context, state) {
                      if(state is ExplorePageLoadingState)
                        {
                          return Center(child: CircularProgressIndicator(),);
                        }
                      else if(state is ExplorePageLoadedState)
                        {
                          List<ProductDetails> products =state.productDetails;
                          return DataLoad(productDetails:products);
                        }
                      else if(state is ExplorePageErrorState)
                        {
                          return  Center(
                              child: Text("An error occurred ${state.error}", style: CustomTheme.of(context)
                                  .bodyMedium
                                  .override(
                                fontFamily: 'Poppins',
                                color:
                                CustomTheme.of(context)
                                    .secondaryBackground,
                              ) ,),);
                        }
                      else{
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

class DataLoad extends StatelessWidget {

  final List<ProductDetails> productDetails;
  const DataLoad({Key? key, required this.productDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
       // padding: EdgeInsets.zero,
       // shrinkWrap: true,
       // scrollDirection: Axis.vertical,
        itemCount: productDetails.length,
        itemBuilder: ( context, index) {
          final product = productDetails[index];
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
                              FFButtonWidget(
                                onPressed: () {
                                  print('Button pressed ...');
                                },
                                text: 'Add To Cart',
                                options: FFButtonOptions(
                                  height: 40,
                                  padding:
                                  EdgeInsetsDirectional.fromSTEB(
                                      24, 0, 24, 0),
                                  iconPadding:
                                  EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 0),
                                  color: CustomTheme.of(context)
                                      .primary,
                                  textStyle:
                                  CustomTheme.of(context)
                                      .titleSmall
                                      .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                                  elevation: 3,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius:
                                  BorderRadius.circular(8),
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

