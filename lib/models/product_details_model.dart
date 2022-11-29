class ProductDetailsModel {
  bool? status;
  int? code;
  Data? data;

  ProductDetailsModel({this.status, this.code, this.data});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  dynamic id;
  dynamic name;
  dynamic images;
  dynamic desc;
  dynamic price;
  dynamic user;

  Data({this.id, this.name, this.images, this.desc, this.price, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    images = json['images'];
    desc = json['desc'];
    price = json['price'];
    user = json['user'];
  }
}
