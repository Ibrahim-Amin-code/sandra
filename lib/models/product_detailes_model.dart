class ProductDetailsModel {
  bool? status;
  String? msg;
 late Data data;

  ProductDetailsModel({this.status, this.msg, required this.data});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = (json['data'] != null ? new Data.fromJson(json['data']) : null)!;
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['status'] = this.status;
  //   data['msg'] = this.msg;
  //   if (this.data != null) {
  //     data['data'] = this.data!.toJson();
  //   }
  //   return data;
  // }
}

class Data {
  late int id;
  late int categoryId;
  late int shopId;
  late int vendorId;
  late String name;
  late String description;
  late int price;
  late int quantity;
  late String modalNumber;
  late String department;
  late String coverImg;
  late String slug;
  late int status;
  late String date;
  late List<String> size;
  late List<String> color;
  // late String createdAt;
  // late dynamic updatedAt;
 late List<ProductImage> productImage;

  Data(
      {
       required this.id,
        required  this.categoryId,
        required this.shopId,
        required   this.vendorId,
        required  this.name,
        required  this.description,
        required  this.price,
        required  this.quantity,
        required  this.modalNumber,
        required  this.department,
        required  this.coverImg,
        required  this.slug,
        required  this.status,
        required  this.date,
        required  this.size,
        required  this.color,
        // required this.createdAt,
        // required  this.updatedAt,
      required  this.productImage});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['categoryId'];
    shopId = json['shopId'];
    vendorId = json['vendorId'];
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
    size = json['size'].cast<String>();
    color = json['color'].cast<String>();
    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
    if (json['product_image'] != null) {
      productImage = <ProductImage>[];
      json['product_image'].forEach((v) {
        productImage.add(new ProductImage.fromJson(v));
      });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['categoryId'] = this.categoryId;
  //   data['shopId'] = this.shopId;
  //   data['vendorId'] = this.vendorId;
  //   data['name'] = this.name;
  //   data['description'] = this.description;
  //   data['price'] = this.price;
  //   data['quantity'] = this.quantity;
  //   data['modal_number'] = this.modalNumber;
  //   data['department'] = this.department;
  //   data['cover_img'] = this.coverImg;
  //   data['slug'] = this.slug;
  //   data['status'] = this.status;
  //   data['date'] = this.date;
  //   data['size'] = this.size;
  //   data['color'] = this.color;
  //   data['created_at'] = this.createdAt;
  //   data['updated_at'] = this.updatedAt;
  //   if (this.productImage != null) {
  //     data['product_image'] =
  //         this.productImage!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

class ProductImage {
  int? id;
  int? productId;
  String? image;
  // dynamic createdAt;
  // dynamic updatedAt;

  ProductImage(
      {this.id, this.productId, this.image, });

  ProductImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['productId'];
    image = json['image'];
    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
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