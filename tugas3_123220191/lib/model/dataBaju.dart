class DataBaju {
  int? id;
  String? name;
  int? price;
  String? category;
  int? rating;

  // Data detail
  String? brand;
  int? sold;
  int? stock;
  int? yearReleased;
  String? material;

  DataBaju({this.id, this.name, this.price, this.category, this.rating});

  DataBaju.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    category = json['category'];
    rating = json['rating'];
  }

  DataBaju.fromJsonDetail(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    category = json['category'];
    rating = json['rating'];
    brand = json['brand'];
    sold = json['sold'];
    stock = json['stock'];
    yearReleased = json['yearReleased'];
    material = json['material'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'category': category,
      'rating': rating,
    };
  }
}