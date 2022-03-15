// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sandra_app/generated/locale_keys.g.dart';
import 'package:sandra_app/screens/components/constants.dart';
import 'package:sandra_app/screens/home/home_cubit/home_cubit.dart';
import 'package:sandra_app/screens/home/home_cubit/states.dart';
import 'package:sandra_app/screens/layout/layout_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';

class ContactUsScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#F5F6F8'),
      appBar: AppBar(
        titleSpacing: 5,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          LocaleKeys.Contact_Us.tr(),
          style: TextStyle(
              fontFamily: 'OpenSans',
              color: Colors.white,
              fontSize: 17.sp,
              fontWeight: FontWeight.w600),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10),
          child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
        ),
        backgroundColor: HexColor('#ffcdd2'),
      ),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is ContactUsSuccessState) {
            Fluttertoast.showToast(
                msg: HomeCubit.get(context).contact['msg'].toString(),
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LayoutScreen(index: 4)),
                (route) => false);
          }
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text(
                    LocaleKeys.Title_Contact.tr(),
                    style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                        color: HexColor('#333333'),
                        fontFamily: 'OpenSans'),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  LocaleKeys.Full_Name.tr(),
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w600,
                    color: HexColor('#333333'),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                contactTextfield(
                  hint: '',
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return LocaleKeys.PleaseEnter.tr();
                    }
                  },
                  controller: nameController,
                  textInputType: TextInputType.text,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  LocaleKeys.Subject.tr(),
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w600,
                    color: HexColor('#333333'),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                contactTextfield(
                  hint: '',
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return LocaleKeys.PleaseEnter.tr();
                    }
                  },
                  controller: subjectController,
                  textInputType: TextInputType.text,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  LocaleKeys.Phone.tr(),
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w600,
                    color: HexColor('#333333'),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                contactTextfield(
                  hint: '',
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return LocaleKeys.PleaseEnter.tr();
                    }
                  },
                  controller: phoneController,
                  textInputType: TextInputType.phone,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  LocaleKeys.Email.tr(),
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w600,
                    color: HexColor('#333333'),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                contactTextfield(
                  hint: '',
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return LocaleKeys.PleaseEnter.tr();
                    }
                  },
                  controller: emailController,
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  LocaleKeys.COMMENT.tr(),
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w600,
                    color: HexColor('#333333'),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                contactTextfield(
                    hint: '',
                    validator: (value) {
                      if (value!.isNotEmpty) {
                        return null;
                      } else {
                        return 'This Field Required';
                      }
                    },
                    controller: messageController,
                    textInputType: TextInputType.text,
                    maxLines: 4),
                SizedBox(
                  height: 3.h,
                ),
                InkWell(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      HomeCubit.get(context).contactUs(
                        name: nameController.text.toString(),
                        subject: subjectController.text.toString(),
                        phone: phoneController.text.toString(),
                        email: emailController.text.toString(),
                        message: messageController.text.toString(),
                      );
                    }
                  },
                  child: Container(
                    height: 6.h,
                    decoration: BoxDecoration(
                      color: HexColor('E3319D'),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Center(
                      child: Text(
                        LocaleKeys.Send.tr(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        // child: ,
      ),
    );
  }

  contactTextfield({
    FormFieldValidator<String>? validator,
    TextEditingController? controller,
    TextInputType? textInputType,
    String? hint,
    int? maxLines,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: textInputType,
      maxLines: maxLines,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: HexColor("#7E7E7E")),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: HexColor("#707070A6")))),
    );
  }
}
