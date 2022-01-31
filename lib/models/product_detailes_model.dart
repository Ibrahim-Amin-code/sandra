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

}

class Data {
  late int id;
  // late int categoryId;
  // late int shopId;
  // late int vendorId;
  late String name;
  late String description;
  late int price;
  late int quantity;
  late String modalNumber;
  late String department;
  late String coverImg;
  // late String slug;
  // late int status;
  // late String date;
  late List<String> size;
  late List<String> color;
  late List<ProductImage> productImage;

  Data(
      {
       required this.id,
        // required  this.categoryId,
        // required this.shopId,
        // required   this.vendorId,
        required  this.name,
        required  this.description,
        required  this.price,
        required  this.quantity,
        required  this.modalNumber,
        required  this.department,
        required  this.coverImg,
        // required  this.slug,
        // required  this.status,
        // required  this.date,
        required  this.size,
        required  this.color,
      required  this.productImage});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    // categoryId = json['categoryId'];
    // shopId = json['shopId'];
    // vendorId = json['vendorId'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    quantity = json['quantity'];
    modalNumber = json['modal_number'];
    department = json['department'];
    coverImg = json['cover_img'];
    // slug = json['slug'];
    // status = json['status'];
    // date = json['date'];
    size = json['size'].cast<String>();
    color = json['color'].cast<String>();
    if (json['product_image'] != null) {
      productImage = <ProductImage>[];
      json['product_image'].forEach((v) {
        productImage.add(new ProductImage.fromJson(v));
      });
    }
  }


}

class ProductImage {
  int? id;
  int? productId;
  String? image;

  ProductImage(
      {this.id, this.productId, this.image, });

  ProductImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['productId'];
    image = json['image'];
    }


}