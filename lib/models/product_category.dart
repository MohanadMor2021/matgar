class ProductByCategoryModel {
  bool? status;
  Data? data;

  ProductByCategoryModel({this.status, this.data});

  ProductByCategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  int? currentPage;
  List<Item3>? data;

  int? total;

  Data({this.currentPage, this.data, this.total});

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Item3>[];
      json['data'].forEach((v) {
        data!.add(Item3.fromJson(v));
      });
    }

    total = json['total'];
  }
}

class Item3 {
  int? id;
  String? mainImage;
  String? name;
  String? price;

  Item3({this.id, this.mainImage, this.name, this.price});

  Item3.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mainImage = json['main_image'];
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['main_image'] = this.mainImage;
    data['name'] = this.name;
    data['price'] = this.price;
    return data;
  }
}
