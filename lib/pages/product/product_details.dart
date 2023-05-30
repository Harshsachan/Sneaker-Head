import '../../flutter_flow/flutter_flow_model.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'product_details_model.dart';
export 'product_details_model.dart';

class Product8Widget extends StatefulWidget {
  const Product8Widget({Key? key}) : super(key: key);

  @override
  _Product8WidgetState createState() => _Product8WidgetState();
}

class _Product8WidgetState extends State<Product8Widget>
    with TickerProviderStateMixin {
  late Product8Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Product8Model());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: CustomTheme.of(context).secondaryBackground,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    height: 400,
                    decoration: BoxDecoration(
                      color: Color(0xFFDBE2E7),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Hero(
                            tag: 'productShoe',
                            transitionOnUserGestures: true,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0),
                              child: Image.network(
                                'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/7c5678f4-c28d-4862-a8d9-56750f839f12/zion-1-basketball-shoes-bJ0hLJ.png',
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: Color(0xFF80C3F3),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      buttonSize: 46,
                                      icon: Icon(
                                        Icons.arrow_back_rounded,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                      onPressed: () async {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                  Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: Color(0xFF80C3F3),
                                    elevation: 100,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      buttonSize: 46,
                                      icon: Icon(
                                        Icons.favorite_border,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
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
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.03,
                    decoration: BoxDecoration(
                      color: Color(0xFFF6F6F6),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: CustomTheme.of(context).primaryBackground,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 10, 24, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Zion Limited',
                            style: CustomTheme.of(context).headlineMedium,
                          ),
                          Text(
                            '\$156.00',
                            style: CustomTheme.of(context)
                                .headlineMedium
                                .override(
                              fontFamily: 'Poppins',
                              color: Color(0xFF80C3F3),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: CustomTheme.of(context).primaryBackground,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Retailed by Nike',
                            style: CustomTheme.of(context).labelMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: CustomTheme.of(context).primaryBackground,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 8, 24, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          RatingBarIndicator(
                            itemBuilder: (context, index) => Icon(
                              Icons.star_rounded,
                              color: Color(0xFFFFA130),
                            ),
                            direction: Axis.horizontal,
                            rating: 5,
                            unratedColor: Color(0xFF95A1AC),
                            itemCount: 5,
                            itemSize: 24,
                          ),
                          Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                            child: Text(
                              '4/5 Reviews',
                              style: CustomTheme.of(context).labelMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: CustomTheme.of(context).primaryBackground,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 16, 24, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'DESCRIPTION',
                            style:
                            CustomTheme.of(context).bodySmall.override(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: CustomTheme.of(context).primaryBackground,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              'With a down-to-earth persona and abilities that are out of this world, Zion is unlike anybody else. On court, the gentle spirit who\'s all about family transforms into an unmatched force of unstoppable athleticism and speed.',
                              style: CustomTheme.of(context).labelMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: CustomTheme.of(context).primaryBackground,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 16, 24, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'SIZE',
                            style:
                            CustomTheme.of(context).bodySmall.override(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: CustomTheme.of(context).primaryBackground,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 12, 16, 0),
                      child: Wrap(
                        spacing: 0,
                        runSpacing: 0,
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        direction: Axis.horizontal,
                        runAlignment: WrapAlignment.start,
                        verticalDirection: VerticalDirection.down,
                        clipBehavior: Clip.none,
                        children: [
                          Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                            child: FlutterFlowChoiceChips(
                              options: [
                                ChipData('4'),
                                ChipData('5'),
                                ChipData('6'),
                                ChipData('7'),
                                ChipData('8'),
                                ChipData('9'),
                                ChipData('10'),
                                ChipData('11'),
                                ChipData('12'),
                                ChipData('13'),
                                ChipData('14')
                              ],
                              onChanged: (val) => setState(
                                      () => _model.choiceChipsValue = val?.first),
                              selectedChipStyle: ChipStyle(
                                backgroundColor:
                                CustomTheme.of(context).alternate,
                                textStyle:
                                CustomTheme.of(context).titleSmall,
                                iconColor: Colors.white,
                                iconSize: 18,
                                labelPadding: EdgeInsetsDirectional.fromSTEB(
                                    12, 4, 12, 4),
                                elevation: 2,
                              ),
                              unselectedChipStyle: ChipStyle(
                                backgroundColor: Color(0xFF80C3F3),
                                textStyle:
                                CustomTheme.of(context).labelMedium,
                                iconColor:
                                CustomTheme.of(context).primaryText,
                                iconSize: 18,
                                labelPadding: EdgeInsetsDirectional.fromSTEB(
                                    12, 4, 12, 4),
                                elevation: 0,
                              ),
                              chipSpacing: 12,
                              rowSpacing: 12,
                              multiselect: false,
                              alignment: WrapAlignment.start,
                              controller: _model.choiceChipsValueController ??=
                                  FormFieldController<List<String>>(
                                    [],
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
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: CustomTheme.of(context).primaryText,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Color(0x55000000),
                  offset: Offset(0, 2),
                )
              ],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 52),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Apple Pay',
                    icon: FaIcon(
                      FontAwesomeIcons.apple,
                      color: CustomTheme.of(context).secondaryBackground,
                      size: 20,
                    ),
                    options: FFButtonOptions(
                      width: 160,
                      height: 50,
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: CustomTheme.of(context).primaryText,
                      textStyle:
                      CustomTheme.of(context).titleSmall.override(
                        fontFamily: 'Outfit',
                        color: CustomTheme.of(context)
                            .secondaryBackground,
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
                      print('Button pressed ...');
                    },
                    text: 'Add to Cart',
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      size: 15,
                    ),
                    options: FFButtonOptions(
                      width: 160,
                      height: 50,
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: CustomTheme.of(context).alternate,
                      textStyle:
                      CustomTheme.of(context).titleSmall.override(
                        fontFamily: 'Outfit',
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      elevation: 3,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
