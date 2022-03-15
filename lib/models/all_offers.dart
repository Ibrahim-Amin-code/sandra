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
  String? categoryId;
  String? shopId;
  Names? names;
  Names? descriptions;
  String? price;
  String? quantity;
  String? modalNumber;
  String? coverImg;
  Names? slug;
  String? status;
  List<String>? size;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? description;
  List<ProductImage>? productImage;
  Offer? offer;

  Data(
      {this.id,
        this.categoryId,
        this.shopId,
        this.names,
        this.descriptions,
        this.price,
        this.quantity,
        this.modalNumber,
        this.coverImg,
        this.slug,
        this.status,
        this.size,
        this.createdAt,
        this.updatedAt,
        this.name,
        this.description,
        this.productImage,
        this.offer});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['categoryId'];
    shopId = json['shopId'];
    names = json['names'] != null ? new Names.fromJson(json['names']) : null;
    descriptions = json['descriptions'] != null
        ? new Names.fromJson(json['descriptions'])
        : null;
    price = json['price'];
    quantity = json['quantity'];
    modalNumber = json['modal_number'];
    coverImg = json['cover_img'];
    slug = json['slug'] != null ? new Names.fromJson(json['slug']) : null;
    status = json['status'];
    size = json['size'].cast<String>();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    description = json['description'];
    if (json['product_image'] != null) {
      productImage = <ProductImage>[];
      json['product_image'].forEach((v) {
        productImage!.add(new ProductImage.fromJson(v));
      });
    }
    offer = json['offer'] != null ? new Offer.fromJson(json['offer']) : null;
  }

}

class Names {
  String? ar;
  String? en;

  Names({this.ar, this.en});

  Names.fromJson(Map<String, dynamic> json) {
    ar = json['ar'];
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ar'] = this.ar;
    data['en'] = this.en;
    return data;
  }
}

class ProductImage {
  int? id;
  String? productId;
  String? image;
  String? createdAt;
  String? updatedAt;

  ProductImage(
      {this.id, this.productId, this.image, this.createdAt, this.updatedAt});

  ProductImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['productId'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

}

class Offer {
  int? id;
  String? productId;
  String? price;
  String? formDate;
  String? toDate;
  String? image;
  String? createdAt;
  String? updatedAt;

  Offer(
      {this.id,
        this.productId,
        this.price,
        this.formDate,
        this.toDate,
        this.image,
        this.createdAt,
        this.updatedAt});

  Offer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['productId'];
    price = json['price'];
    formDate = json['form_date'];
    toDate = json['to_date'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

}