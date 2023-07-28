import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../custom_theme/flutter_flow_theme.dart';


class RatingUi extends StatefulWidget {
  const RatingUi({Key? key}) : super(key: key);

  @override
  State<RatingUi> createState() => _RatingUiState();
}

class _RatingUiState extends State<RatingUi> {
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



