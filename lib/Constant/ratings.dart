import 'package:auto_size_text/auto_size_text.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  final double rating;

  Rating({required this.rating});

  @override
  Widget build(BuildContext context) {
    final int starCount = 5;
    final int filledStars = rating.floor();
    final int halfStars = ((rating - filledStars) * 2).round();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(starCount, (index) {
            double size = 14.0; // Adjust the size of the stars here

            if (index < filledStars) {
              // Filled star icon
              return Icon(Icons.star, color:  CustomTheme.of(context).alternate, size: size);
            } else if (index == filledStars && halfStars == 1) {
              // Half-filled star icon
              return Icon(Icons.star_half, color:  CustomTheme.of(context).alternate, size: size);
            } else {
              // Empty star icon
              return Icon(Icons.star_border, color:  CustomTheme.of(context).alternate, size: size);
            }
          }),
        ),
        SizedBox(width: 5),
        AutoSizeText(
          rating == rating.toInt() ? '(${rating.toInt()}/5)' : '(${rating.toStringAsFixed(1)}/5)',
          style: CustomTheme.of(context).bodySmall.override(
            fontFamily: 'Poppins',
            color: CustomTheme.of(context)
                .primaryBackground,
          ),
        ),
      ],
    );
  }
}
