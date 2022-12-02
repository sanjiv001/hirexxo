class Building {
  List<String> images;
  // List<String> like;
  // List<String> dislike;
  // List<String> favories;
  //String uid;
  String name;
  String contact;
  String address;
  String price;
  String detail;

  ApartmentType type;
  //String id;
  Building({
    required this.detail,
    required this.images,
    required this.name,
    required this.contact,
    required this.address,
    required this.price,
    required this.type,
    // required this.id,
    // required this.uid,
    // required this.dislike,
    // required this.like,
    // required this.favories
  });

  // factory Building.fromJson(Map<String, dynamic> map,
  //         {required String id}) =>
  //     Building(
  //         id: id,
  //         name: map["name"],
  //         contact: map["contact"],
  //         address: map["address"],
  //         price: map["price"],
  //         detail: map["detail"],
  //         uid: map["uid"],
  //         images: map["images"].map<String>((i) => i as String).toList(),
  //         like:
  //             map["like"] ==
  //                     null
  //                 ? []
  //                 : map["like"].map<String>((i) => i as String).toList(),
  //         favories:
  //             map[
  //                         "favories"] ==
  //                     null
  //                 ? []
  //                 : map["favories"].map<String>((i) => i as String).toList(),
  //         dislike: map["dislike"] == null
  //             ? []
  //             : map["dislike"].map<String>((i) => i as String).toList(),
  //         type: map["type"] == "car"
  //             ? ApartmentType.apartment
  //             : ApartmentType.room);

  Map<String, dynamic> toMap() {
    return {
      "type": type == ApartmentType.apartment ? "apartment" : "room",
      "images": images,
      "name": name,
      "address": address,
      "contact": contact,
      "detail": detail,
      "price": price,
      // "uid": uid,
      // "like": like,
      // "dislike": dislike,
      // "favories": favories
    };
  }
}

enum ApartmentType { apartment, room }
