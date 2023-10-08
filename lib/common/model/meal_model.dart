class MealModel {
  final String? id;
  final String? name;
  final String? category;
  final String? description;
  final String? image;

  MealModel({
    this.id,
    this.name,
    this.category,
    this.description,
    this.image,
  });

  factory MealModel.fromJson(Map<String, dynamic> json) {
    return MealModel(
      id: json['idMeal'],
      name: json['strMeal'],
      category: json['strCategory'],
      description: json['strInstructions'],
      image: json['strMealThumb'],
    );
  }

  static MealModel dummy() {
    return MealModel(
      id: '1',
      name: 'Pizza',
      category: 'Kue / Roti',
      description: 'Pizza Keju',
      image: 'https://cdn0-production-images-kly.akamaized.net/dT2F_oEls2taB0dweLP4E-jTY5Y=/0x76:2300x1372/1200x675/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/3363549/original/061019500_1611978034-pizza.jpg'
    );
  }
}
