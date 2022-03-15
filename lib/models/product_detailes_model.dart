class ProductDetailsModel {
  bool? status;
  String? msg;
  Data? data;

  ProductDetailsModel({this.status, this.msg, this.data});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

}

class Data {
  int? id;
  String? price;
  String? quantity;
  String? modalNumber;
  // String? department;
  String? coverImg;
  List<String>? size;
  List<String>? color;
  String? name;
  String? description;
  List<ProductImage>? productImage;

  Data(
      {this.id,
        this.price,
        this.quantity,
        this.modalNumber,
        // this.department,
        this.coverImg,
        this.size,
        this.color,
        this.name,
        this.description,
        this.productImage});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    quantity = json['quantity'];
    modalNumber = json['modal_number'];
    // department = json['department'];
    coverImg = json['cover_img'];
    size = json['size'].cast<String>();
    color = json['color'].cast<String>();
    name = json['name'];
    description = json['description'];
    if (json['product_image'] != null) {
      productImage = <ProductImage>[];
      json['product_image'].forEach((v) {
        productImage!.add(new ProductImage.fromJson(v));
      });
    }
  }

}

class ProductImage {
  int? id;
  String? productId;
  String? image;

  ProductImage(
      {this.id, this.productId, this.image,});

  ProductImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['productId'];
    image = json['image'];
  }

}