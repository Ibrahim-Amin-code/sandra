class GetProductsModel {
  bool? status;
  String? msg;
  List<Data>? data;

  GetProductsModel({this.status, this.msg, this.data});

  GetProductsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

}

class Data {
  int? id;
 String? name;
  var price;
  var quantity;
  String? coverImg;
  Data(
      {this.id,
        this.name,
        this.price,
        this.quantity,
        this.coverImg,
      });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    quantity = json['quantity'];
    coverImg = json['cover_img'];
    }
  }

