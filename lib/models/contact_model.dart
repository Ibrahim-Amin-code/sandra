class ContactModel {
  bool? status;
  String? msg;
  Data? data;

  ContactModel({this.status, this.msg, this.data});

  ContactModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }


}

class Data {
 late int id;
 late String logo;
 late String titleAr;
 late String titleEn;
 late String phone;
 late String email;
 late String addressAr;
 late String addressEn;
 late String longitude;
 late String latitude;
 late String descriptionAr;
  late String descriptionEn;
 late String privacyAr;
 late String privacyEn;
 late String termsAr;
 late String agreementsAr;
 late String agreementsEn;
 late String termsEn;
 late String returnAr;
 late String returnEn;
 late int version;
 late String favicon;
 late dynamic createdAt;
 late String updatedAt;

  Data(
      {
       required this.id,
        required  this.logo,
        required this.titleAr,
        required this.titleEn,
        required this.phone,
        required this.email,
        required this.addressAr,
        required  this.addressEn,
        required  this.longitude,
        required  this.latitude,
        required  this.descriptionAr,
          required this.descriptionEn,
        required  this.privacyAr,
        required this.privacyEn,
        required this.termsAr,
        required this.agreementsAr,
        required this.agreementsEn,
        required this.termsEn,
        required this.returnAr,
        required this.returnEn,
        required  this.version,
        required  this.favicon,
        required this.createdAt,
        required this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logo = json['logo'];
    titleAr = json['title_ar'];
    titleEn = json['title_en'];
    phone = json['phone'];
    email = json['email'];
    addressAr = json['address_ar'];
    addressEn = json['address_en'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    descriptionAr = json['description_ar'];
    descriptionEn = json['description_en'];
    privacyAr = json['privacy_ar'];
    privacyEn = json['privacy_en'];
    termsAr = json['terms_ar'];
    agreementsAr = json['agreements_ar'];
    agreementsEn = json['agreements_en'];
    termsEn = json['terms_en'];
    returnAr = json['return_ar'];
    returnEn = json['return_en'];
    version = json['version'];
    favicon = json['favicon'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }


}