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
  // int? categoryId;
  // int? shopId;
  // int? vendorId;
  String? name;
  // String? description;
  int? price;
  // int? quantity;
  // String? modalNumber;
  // String? department;
  String? coverImg;
  // String? slug;
  // int? status;
  // String? date;
  // List<String>? size;
  // List<String>? color;
  // String? createdAt;
  // Null? updatedAt;
  // List<ProductImage>? productImage;
  Offer? offer;

  Data(
      {this.id,
        // this.categoryId,
        // this.shopId,
        // this.vendorId,
        this.name,
        // this.description,
        this.price,
        // this.quantity,
        // this.modalNumber,
        // this.department,
        this.coverImg,
        // this.slug,
        // this.status,
        // this.date,
        // this.size,
        // this.color,
        // this.createdAt,
        // this.updatedAt,
        // this.productImage,
        this.offer});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    // categoryId = json['categoryId'];
    // shopId = json['shopId'];
    // vendorId = json['vendorId'];
    name = json['name'];
    // description = json['description'];
    price = json['price'];
    // quantity = json['quantity'];
    // modalNumber = json['modal_number'];
    // department = json['department'];
    coverImg = json['cover_img'];
    // slug = json['slug'];
    // status = json['status'];
    // date = json['date'];
    // size = json['size'].cast<String>();
    // color = json['color'].cast<String>();
    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
    // if (json['product_image'] != null) {
    //   productImage = <ProductImage>[];
    //   json['product_image'].forEach((v) {
    //     productImage!.add(new ProductImage.fromJson(v));
    //   });
    // }
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
  // String? createdAt;
  // String? updatedAt;

  Offer(
      {this.id,
        this.productId,
        this.price,
        this.formDate,
        this.toDate,
        this.image,
//        this.createdAt,
//         this.updatedAt
      });

  Offer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['productId'];
    price = json['price'];
    formDate = json['form_date'];
    toDate = json['to_date'];
    image = json['image'];
    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['productId'] = this.productId;
  //   data['price'] = this.price;
  //   data['form_date'] = this.formDate;
  //   data['to_date'] = this.toDate;
  //   data['image'] = this.image;
  //   data['created_at'] = this.createdAt;
  //   data['updated_at'] = this.updatedAt;
  //   return data;
  // }
}