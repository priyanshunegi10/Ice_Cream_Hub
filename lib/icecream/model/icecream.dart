import 'dart:convert';

// Function to parse JSON into IcecreamsData
IcecreamsData icecreamsDataFromJson(String str) {
  final jsonData = json.decode(str);
  return IcecreamsData.fromJson(jsonData);
}

// Function to encode IcecreamsData to JSON
String icecreamsDataToJson(IcecreamsData data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class IcecreamsData {
  List<Icecream>? icecreams;

  IcecreamsData({
    this.icecreams,
  });

  // Factory method to parse the JSON into IcecreamsData
  factory IcecreamsData.fromJson(Map<String, dynamic> json) {
    return IcecreamsData(
      icecreams: (json['icecreams'] as List<dynamic>?)
          ?.map((x) => Icecream.fromJson(x))
          .toList(),
    );
  }

  // Convert IcecreamsData back to JSON
  Map<String, dynamic> toJson() {
    return {
      'icecreams': icecreams?.map((x) => x.toJson()).toList(),
    };
  }
}

class Icecream {
  String flavor;
  String description;
  List<String> toppings;
  double price;
  String image;
  List<Ingredient> ingredients;

  Icecream({
    required this.flavor,
    required this.description,
    required this.toppings,
    required this.price,
    required this.image,
    required this.ingredients,
  });

  // Factory method to parse JSON into an Icecream object
  factory Icecream.fromJson(Map<String, dynamic> json) {
    return Icecream(
      flavor: json["flavor"] as String,
      description: json["description"] as String,
      toppings: List<String>.from(json["toppings"] as List<dynamic>),
      price: (json["price"] as num).toDouble(),
      image: json["image"] as String,
      ingredients: (json["ingredients"] as List<dynamic>)
          .map((x) => Ingredient.fromJson(x))
          .toList(),
    );
  }

  // Convert Icecream object back to JSON
  Map<String, dynamic> toJson() {
    return {
      "flavor": flavor,
      "description": description,
      "toppings": toppings.map((x) => x).toList(),
      "price": price,
      "image": image,
      "ingredients": ingredients.map((x) => x.toJson()).toList(),
    };
  }
}

class Ingredient {
  String name;
  String quantity;

  Ingredient({
    required this.name,
    required this.quantity,
  });

  // Factory method to parse JSON into an Ingredient object
  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      name: json['name'] as String,
      quantity: json['quantity'] as String,
    );
  }

  // Convert Ingredient object back to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'quantity': quantity,
    };
  }
}
