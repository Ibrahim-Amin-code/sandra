class SearchModel {
  bool? status;
  String? msg;
  List<Data>? data;

  SearchModel({this.status, this.msg, this.data});

  SearchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['status'] = this.status;
  //   data['msg'] = this.msg;
  //   if (this.data != null) {
  //     data['data'] = this.data.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

class Data {
 late int id;
 late int categoryId;
 late dynamic shopId;
 late String name;
 late String description;
 late dynamic price;
 late int quantity;
 late String modalNumber;
 late String department;
 late String coverImg;
 late dynamic slug;
 late int status;
 late dynamic createdAt;
 late dynamic updatedAt;
 late List<ProductImage> productImage;
 late  List<Colors> colors;
 late List<Sizes> sizes;

  Data(
      {
       required this.id,
       required this.categoryId,
        this.shopId,
       required this.name,
       required this.description,
        this.price,
        required this.quantity,
        required this.modalNumber,
        required this.department,
        required this.coverImg,
        this.slug,
        required this.status,
        this.createdAt,
        this.updatedAt,
        required this.productImage,
        required this.colors,
        required this.sizes});

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
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['product_image'] != null) {
      productImage = <ProductImage>[];
      json['product_image'].forEach((v) {
        productImage.add(new ProductImage.fromJson(v));
      });
    }
    if (json['colors'] != null) {
      colors = <Colors>[];
      json['colors'].forEach((v) {
        colors.add(new Colors.fromJson(v));
      });
    }
    if (json['sizes'] != null) {
      sizes = <Sizes>[];
      json['sizes'].forEach((v) {
        sizes.add(new Sizes.fromJson(v));
      });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['categoryId'] = this.categoryId;
  //   data['shopId'] = this.shopId;
  //   data['name'] = this.name;
  //   data['description'] = this.description;
  //   data['price'] = this.price;
  //   data['quantity'] = this.quantity;
  //   data['modal_number'] = this.modalNumber;
  //   data['department'] = this.department;
  //   data['cover_img'] = this.coverImg;
  //   data['slug'] = this.slug;
  //   data['status'] = this.status;
  //   data['created_at'] = this.createdAt;
  //   data['updated_at'] = this.updatedAt;
  //   if (this.productImage != null) {
  //     data['product_image'] = this.productImage.map((v) => v.toJson()).toList();
  //   }
  //   if (this.colors != null) {
  //     data['colors'] = this.colors.map((v) => v.toJson()).toList();
  //   }
  //   if (this.sizes != null) {
  //     data['sizes'] = this.sizes.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

class ProductImage {
  int? id;
  int? productId;
  String? image;
  dynamic createdAt;
  dynamic updatedAt;

  ProductImage(
      { this.id, this.productId, this.image, this.createdAt, this.updatedAt});

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