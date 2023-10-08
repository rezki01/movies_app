import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/common/common.dart';
import 'package:movies_app/common/model/meal_model.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({Key? key}) : super(key: key);

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  final Dio dio = Dio();
  final int id = 968051;

  Future<MealModel?> getMealFromAPI() async {
    Response response =
        await dio.get('https://www.themealdb.com/api/json/v1/1/random.php');

    if (response.statusCode == 200) {
      Map<String, dynamic> data = response.data;
      return MealModel.fromJson(data['meals'][0]);
    }
    return null;
  }

  Future<MovieModel?> getMovieFromAPI() async {
    Response response = await dio.get(
      'https://api.themoviedb.org/3/movie/$id',
      queryParameters: {
        'api_key': '39d16c8a840e66c05d04278d35f761f7',
      },
    );

    if (response.statusCode == 200) {
      print('-->result: ${response.data}');
      Map<String, dynamic> data = response.data;
      return MovieModel.fromMap(data);
    }
    return null;
  }

  Future<List<MovieModel>> getListMovieFromAPI() async {
    Response response = await dio.get(
      'https://api.themoviedb.org/3/movie/top_rated',
      queryParameters: {
        'api_key': '39d16c8a840e66c05d04278d35f761f7',
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = response.data;
      List<MovieModel> list =
          (data['results'] as List).map((e) => MovieModel.fromMap(e)).toList();
      return list;
    }

    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal DB'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      // body: FutureBuilder<MealModel?>(
      //   future: getMealFromAPI(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //     if (snapshot.hasData) {
      //       MealModel meal = snapshot.data!;
      //       return ListView(
      //         children: [
      //           AspectRatio(
      //             aspectRatio: 16 / 9,
      //             child: meal.image != null
      //                 ? Image.network(meal.image!, fit: BoxFit.cover)
      //                 : Container(
      //                     color: Colors.black38,
      //                     child: const FlutterLogo(),
      //                   ),
      //           ),
      //           const SizedBox(height: 16),
      //           Padding(
      //             padding: const EdgeInsets.symmetric(horizontal: 20),
      //             child: Column(
      //               mainAxisSize: MainAxisSize.min,
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Text(
      //                   meal.name ?? '-',
      //                   style: const TextStyle(
      //                     fontSize: 18,
      //                     fontWeight: FontWeight.w700,
      //                   ),
      //                 ),
      //                 const SizedBox(height: 4),
      //                 Text(
      //                   meal.category ?? '-',
      //                   style: const TextStyle(
      //                     fontSize: 12,
      //                     fontWeight: FontWeight.w500,
      //                   ),
      //                 ),
      //                 const SizedBox(height: 16),
      //                 Text(
      //                   meal.description ?? '-',
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ],
      //       );
      //     }
      //     if (snapshot.hasError) {
      //       return const Center(
      //         child: Text('Terjadi Kesalahan'),
      //       );
      //     }
      //     return SizedBox();
      //   },
      // ),
      // body: FutureBuilder<MovieModel?>(
      //   future: getMovieFromAPI(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //     if (snapshot.hasData) {
      //       MovieModel movie = snapshot.data!;
      //       return ListView(
      //         children: [
      //           AspectRatio(
      //             aspectRatio: 16 / 9,
      //             child: movie.imageUrl != null
      //                 ? Image.network(movie.imageUrl!, fit: BoxFit.cover)
      //                 : Container(
      //                     color: Colors.black38,
      //                     child: const FlutterLogo(),
      //                   ),
      //           ),
      //           const SizedBox(height: 16),
      //           Padding(
      //             padding: const EdgeInsets.symmetric(horizontal: 20),
      //             child: Column(
      //               mainAxisSize: MainAxisSize.min,
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Text(
      //                   movie.title ?? '-',
      //                   style: const TextStyle(
      //                     fontSize: 18,
      //                     fontWeight: FontWeight.w700,
      //                   ),
      //                 ),
      //                 const SizedBox(height: 16),
      //                 Text(
      //                   movie.about ?? '-',
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ],
      //       );
      //     }
      //     if (snapshot.hasError) {
      //       return const Center(
      //         child: Text('Terjadi Kesalahan'),
      //       );
      //     }
      //     return SizedBox();
      //   },
      // ),
      body: FutureBuilder<List<MovieModel>>(
        future: getListMovieFromAPI(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            List<MovieModel> list = snapshot.data!;
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                MovieModel movie = list[index];
                return Container(
                  margin: EdgeInsets.only(top: index == 0 ? 0 : 16),
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AspectRatio(
                          aspectRatio: 21 / 9,
                          child: movie.imageUrl != null
                              ? Image.network(
                                  movie.imageUrl!,
                                  fit: BoxFit.cover,
                                )
                              : Container(
                                  color: Colors.black38,
                                  child: const FlutterLogo(),
                                ),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            movie.title ?? '-',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('Terjadi Kesalahan'),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
