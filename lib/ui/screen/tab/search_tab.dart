import 'package:flutter/material.dart';
import '../../../common/common.dart';
import '../../ui.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({Key? key}) : super(key: key);

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  final TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text(
          'Find Movies, Tv Series, and more...',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 24),
        TextField(
          controller: search,
          decoration: InputDecoration(
            hintText: "Search",
            filled: true,
            suffixIcon: Icon(Icons.search),
            fillColor: Colors.grey,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 24),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 3 / 4,
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: MovieModel.dummies.length,
          itemBuilder: (context, index) {
            MovieModel movie = MovieModel.dummies[index];
            return CardMovieWidget(
              movie: movie,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RouteName.movieDetail,
                  arguments: movie,
                );
              },
            );
          },
        ),
      ],
    );
  }
}

