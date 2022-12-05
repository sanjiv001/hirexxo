class Building {
  List<String> images;
  String name;
  String contact;
  String address;
  String price;
  String description;
  ApartmentType type;

  Building({
    required this.description,
    required this.images,
    required this.name,
    required this.contact,
    required this.address,
    required this.price,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      "type": type == ApartmentType.apartment ? "apartment" : "room",
      "images": images,
      "name": name,
      "address": address,
      "contact": contact,
      "description": description,
      "price": price,
    };
  }
}

enum ApartmentType { apartment, room }
