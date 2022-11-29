class CategoryModel {
  bool? status;
  dynamic? code;
  Data? data;

  CategoryModel({this.status, this.code, this.data});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  int? currentPage;
  List<Item2>? item;

  Data({
    this.currentPage,
    this.item,
  });

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      item = <Item2>[];
      json['data'].forEach((v) {
        item!.add(Item2.fromJson(v));
      });
    }
  }
}

class Item2 {
  dynamic id;
  dynamic name;
  dynamic image;
  dynamic count;

  Item2({this.id, this.name, this.image, this.count});

  Item2.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    count = json['count'];
  }
}
