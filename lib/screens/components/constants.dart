import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:sandra_app/screens/components/size_config.dart';

customCachedNetworkImage({
  required String url,
  required context,
  required BoxFit fit,
}) {
  try {
    // ignore: unnecessary_null_comparison
    if (url == null || url == "") {
      return Container(
        child: Icon(
          Icons.error_outline,
          color: HexColor("#AB0D03"),
        ),
      );
    } else {
      return Container(
        color: Colors.transparent,
        width: MediaQuery.of(context).size.width,
        child: (Uri.parse(url).isAbsolute)
            ? CachedNetworkImage(
                imageUrl: url,
                fit: fit,
                placeholder: (context, url) => Container(),
                errorWidget: (context, url, error) {
                  return Icon(Icons.error_outline, color: HexColor("#AB0D03"));
                })
            : Icon(Icons.error_outline, color: HexColor("#AB0D03")),
      );
    }
  } catch (e) {
    print(e.toString());
  }
}

String parseHtmlString(String htmlString) {
  final document = parse(htmlString);
  final String parsedString = parse(document.body!.text).documentElement!.text;
  return parsedString;
}

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontFamily: 'OpenSans',
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

spaceH(double height) {
  return SizedBox(height: height);
}

spaceW(double width) {
  return SizedBox(width: width);
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

multilineTextField(
    {required String title,
    required TextEditingController controller,
    required TextInputType type,
    required bool secure}) {
  return TextFormField(
    keyboardType: type,
    controller: controller,
    obscureText: secure,
    maxLines: 5,
    decoration: InputDecoration(
        fillColor: Colors.white,
        hintText: title,
        hintStyle: headingStyle.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: HexColor("#C9C9C9")),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: HexColor("#7070704D")))),
  );
}
