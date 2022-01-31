class OffersModel {
  bool? status;
  String? msg;
  List<Data>? data;

  OffersModel({this.status, this.msg, this.data});

  OffersModel.fromJson(Map<String, dynamic> json) {
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
  int? price;
  String? coverImg;
  Offer? offer;

  Data(
      {this.id,
        this.name,
        this.price,
        this.coverImg,
        this.offer});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    coverImg = json['cover_img'];
    offer = json['offer'] != null ? new Offer.fromJson(json['offer']) : null;
  }

}


class Offer {
  int? id;
  int? productId;
  int? price;
  String? formDate;
  String? toDate;
  String? image;

  Offer(
      {this.id,
        this.productId,
        this.price,
        this.formDate,
        this.toDate,
        this.image,
      });

  Offer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['productId'];
    price = json['price'];
    formDate = json['form_date'];
    toDate = json['to_date'];
    image = json['image'];
  }


}