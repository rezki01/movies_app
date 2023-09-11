import 'package:flutter/material.dart';
import 'package:movies_app/common/common.dart';
import 'package:movies_app/ui/ui.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        const Text(
          "What do you want to watch?",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.white,
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
        SingleChildScrollView(
          child: SizedBox(
            height: 210,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(AssetPath.jurassicWorld),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: InkWell(
                    onTap: (){},
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(AssetPath.spiderman),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(AssetPath.sonic),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 48),
        Row(
          children: [
            const Expanded(
              child: Text(
                'Now Playing',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 8),
            InkWell(
              onTap: () {},
              child: const Text(
                'See More',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 3 / 4,
            crossAxisCount: 3,
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
