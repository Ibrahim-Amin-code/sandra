// import 'package:flutter/material.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:sandra_app/generated/locale_keys.g.dart';
// import 'package:sandra_app/screens/cart/componnent/constant.dart';
// import 'package:sandra_app/screens/components/constants.dart';
//
// // ignore: use_key_in_widget_constructors
// class AddNewaddressScreen extends StatefulWidget {
//   @override
//   State<AddNewaddressScreen> createState() => _AddNewaddressScreenState();
// }
//
// class _AddNewaddressScreenState extends State<AddNewaddressScreen> {
//   final formKey = GlobalKey<FormState>();
//   TextEditingController addressTtile = TextEditingController();
//   TextEditingController fullName = TextEditingController();
//   TextEditingController email = TextEditingController();
//   TextEditingController detail = TextEditingController();
//   TextEditingController district = TextEditingController();
//   TextEditingController city = TextEditingController();
//   TextEditingController stereet = TextEditingController();
//   TextEditingController phoneNumber = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       primary: false,
//       shrinkWrap: true,
//       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//       children: [
//         Form(
//             key: formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 headerText(title: LocaleKeys.Address_Title.tr()),
//                 spaceH(10),
//                 customTextField(
//                     title: LocaleKeys.Address_Title.tr(),
//                     controller: addressTtile,
//                     type: TextInputType.text,
//                     secure: false),
//                 spaceH(10),
//                 headerText(title: LocaleKeys.Full_Name.tr()),
//                 spaceH(10),
//                 customTextField(
//                     title: LocaleKeys.Full_Name.tr(),
//                     controller: fullName,
//                     type: TextInputType.name,
//                     secure: false),
//                 spaceH(10),
//                 headerText(title: LocaleKeys.Email.tr()),
//                 spaceH(10),
//                 customTextField(
//                     title: LocaleKeys.Email.tr(),
//                     controller: email,
//                     type: TextInputType.emailAddress,
//                     secure: false),
//                 spaceH(10),
//                 headerText(title: LocaleKeys.Address_Location.tr()),
//                 spaceH(10),
//                 multilineTextField(
//                     title: LocaleKeys.Address_Location.tr(),
//                     controller: detail,
//                     type: TextInputType.text,
//                     secure: false),
//                 spaceH(10),
//                 headerText(title: LocaleKeys.District.tr()),
//                 spaceH(10),
//                 customTextField(
//                     title: LocaleKeys.District.tr(),
//                     controller: district,
//                     type: TextInputType.text,
//                     secure: false),
//                 spaceH(10),
//                 headerText(title: LocaleKeys.City.tr()),
//                 spaceH(10),
//                 customTextField(
//                     title: LocaleKeys.City.tr(),
//                     controller: city,
//                     type: TextInputType.text,
//                     secure: false),
//                 spaceH(10),
//                 headerText(title: LocaleKeys.Street_Name.tr()),
//                 spaceH(10),
//                 customTextField(
//                     title: LocaleKeys.Street_Name.tr(),
//                     controller: stereet,
//                     type: TextInputType.streetAddress,
//                     secure: false),
//                 spaceH(10),
//                 headerText(title: LocaleKeys.Phone.tr()),
//                 spaceH(10),
//                 customTextField(
//                     title: LocaleKeys.Phone.tr(),
//                     controller: phoneNumber,
//                     type: TextInputType.phone,
//                     secure: false),
//                 spaceH(30),
//                 placeOrderButton(
//                     context: context, title: LocaleKeys.Add_Address.tr(), press: () {})
//               ],
//             ))
//       ],
//     );
//   }
// }
