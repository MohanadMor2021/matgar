class AdsModel {
  bool? status;
  Data? data;

  AdsModel({this.status, this.data});

  AdsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];

    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  List<Item>? item;

  Data({
    this.item,
  });

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      item = <Item>[];
      json['data'].forEach((v) {
        item!.add(Item.fromJson(v));
      });
    }
  }
}

class Item {
  int? id;
  String? image;

  Item({this.id, this.image});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}
