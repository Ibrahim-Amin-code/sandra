class WishListModel {
  bool? status;
  String? msg;
  List<Data>? data;

  WishListModel({this.status, this.msg, this.data});

  WishListModel.fromJson(Map<String, dynamic> json) {
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
  int? categoryId;
  dynamic shopId;
  String? name;
  String? description;
  int? price;
  int? quantity;
  String? modalNumber;
  String? department;
  String? coverImg;
  dynamic slug;
  int? status;
  String? date;
  dynamic createdAt;
  dynamic updatedAt;
  List<ProductImage>? productImage;
  List<Colors>? colors;
  List<Sizes>? sizes;

  Data(
      {
        this.id,
        this.categoryId,
        this.shopId,
        this.name,
        this.description,
        this.price,
        this.quantity,
        this.modalNumber,
        this.department,
        this.coverImg,
        this.slug,
        this.status,
        this.date,
        this.createdAt,
        this.updatedAt,
        this.productImage,
        this.colors,
        this.sizes});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['categoryId'];
    shopId = json['shopId'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    quantity = json['quantity'];
    modalNumber = json['modal_number'];
    department = json['department'];
    coverImg = json['cover_img'];
    slug = json['slug'];
    status = json['status'];
    date = json['date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['product_image'] != null) {
      productImage = <ProductImage>[];
      json['product_image'].forEach((v) {
        productImage!.add(new ProductImage.fromJson(v));
      });
    }
    if (json['colors'] != null) {
      colors =  <Colors>[];
      json['colors'].forEach((v) {
        colors!.add(new Colors.fromJson(v));
      });
    }
    if (json['sizes'] != null) {
      sizes = <Sizes>[];
      json['sizes'].forEach((v) {
        sizes!.add(new Sizes.fromJson(v));
      });
    }

  }

}

class ProductImage {
  int? id;
  int? productId;
  String? image;
  dynamic createdAt;
  dynamic updatedAt;

  ProductImage(
      {this.id, this.productId, this.image, this.createdAt, this.updatedAt});

  ProductImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['productId'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['productId'] = this.productId;
  //   data['image'] = this.image;
  //   data['created_at'] = this.createdAt;
  //   data['updated_at'] = this.updatedAt;
  //   return data;
  // }
}

class Colors {
  int? id;
  int? productId;
  String? name;
  dynamic createdAt;
  dynamic updatedAt;

  Colors({this.id, this.productId, this.name, this.createdAt, this.updatedAt});

  Colors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['productId'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['id'] = this.id;
//   data['productId'] = this.productId;
//   data['name'] = this.name;
//   data['created_at'] = this.createdAt;
//   data['updated_at'] = this.updatedAt;
//   return data;
// }
}

class Sizes {
  int? id;
  int? productId;
  String? size;
  dynamic createdAt;
  dynamic updatedAt;

  Sizes({this.id, this.productId, this.size, this.createdAt, this.updatedAt});

  Sizes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['productId'];
    size = json['size'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['id'] = this.id;
//   data['productId'] = this.productId;
//   data['size'] = this.size;
//   data['created_at'] = this.createdAt;
//   data['updated_at'] = this.updatedAt;
//   return data;
// }
}