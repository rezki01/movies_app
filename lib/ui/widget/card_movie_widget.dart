import 'package:flutter/material.dart';
import 'package:movies_app/common/common.dart';

class CardMovieWidget extends StatelessWidget {
  final MovieModel movie;
  final Function()? onTap;

  const CardMovieWidget({
    Key? key,
    required this.movie, this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.zero,
        color: ColorConstant.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Image.asset(movie.image!),
            ),
          ],
        ),
      ),
    );
  }
}
