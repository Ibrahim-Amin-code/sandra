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
  // int? categoryId;
  // dynamic shopId;
  String? name;
  // String? description;
  var price;
  var quantity;
  // String? modalNumber;
  // String? department;
  String? coverImg;
  // String? slug;/
  // int? status;
  // String? date;
  // List<String>? size;
  // List<String>? color;
  // String? createdAt;
  // dynamic updatedAt;
  // List<ProductImage>? productImage;

  Data(
      {this.id,
        // this.categoryId,
        // this.shopId,
        this.name,
        // this.description,
        this.price,
        this.quantity,
        // this.modalNumber,
        // this.department,
        this.coverImg,
        // this.slug,
        // this.status,
        // this.date,
        // this.size,/
        // this.color,
        // this.createdAt,
        // this.updatedAt,
        // this.productImage
      });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    // categoryId = json['categoryId'];
    // shopId = json['shopId'];
    name = json['name'];
    // description = json['description'];
    price = json['price'];
    quantity = json['quantity'];
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
      // productImage = <ProductImage>[];
      // json['product_image'].forEach((v) {
        // productImage!.add(new ProductImage.fromJson(v));
      // });
    }
  }



// class ProductImage {
//   int? id;
//   int? productId;
//   String? image;
//   // dynamic createdAt;
//   // dynamic updatedAt;
//
//   ProductImage(
//       {this.id, this.productId, this.image, });
//
//   ProductImage.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     productId = json['productId'];
//     image = json['image'];
//     // createdAt = json['created_at'];
//     // updatedAt = json['updated_at'];
//   }
// }