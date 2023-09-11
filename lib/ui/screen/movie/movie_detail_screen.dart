import 'package:flutter/material.dart';
import 'package:movies_app/common/common.dart';
import 'package:movies_app/ui/ui.dart';

class MovieDetailScreen extends StatefulWidget {
  final MovieModel movie;

  const MovieDetailScreen({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.background,
        title: const Center(
          child: Text(
            'Detail Movie',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        elevation: 0.2,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              AssetPath.detail,
              width: 18,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    widget.movie.image ?? '-',
                    height: 400,
                    fit: BoxFit.fitWidth,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          widget.movie.title ?? '-',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                        const Divider(height: 16, color: Colors.white),
                        const SizedBox(height: 16),
                        Text(
                          widget.movie.about ?? '-',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
