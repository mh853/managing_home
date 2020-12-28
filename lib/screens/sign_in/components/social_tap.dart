import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SocialTap extends StatelessWidget {
  const SocialTap({
    Key key,
    this.text,
    this.press,
    this.image,
  }) : super(key: key);
  final String text;
  final String image;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      splashColor: kPrimaryColor,
      onPressed: press,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
      highlightElevation: 0,
      borderSide: BorderSide(color: kSecondaryColor),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Image(image: AssetImage(image), height: 25.0),
            ),
            Expanded(
              flex: 11,
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(16),
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
