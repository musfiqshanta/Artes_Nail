import 'package:flutter/material.dart';

import '../utils/dimention.dart';
import '../utils/styles.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? buttonText;
  final bool? transparent;
  final EdgeInsets? margin;
  final double? height;
  final double? width;
  final double? fontSize;
  final double? radius;
  final IconData? icon;
  final Color? color;
  CustomButton(
      {this.onPressed,
      @required this.buttonText,
      this.transparent = false,
      this.margin,
      this.width,
      this.height,
      this.fontSize,
      this.radius = 5,
      this.icon,
      this.color});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle _flatButtonStyle = TextButton.styleFrom(
      backgroundColor: onPressed == null
          ? Theme.of(context).disabledColor
          : transparent!
              ? Colors.transparent
              : Colors.pink,
      //    minimumSize: Size(width != null ? width : Dimensions.WEB_MAX_WIDTH, height != null ? height : 50),
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius!),
      ),
    );

    return Center(
        child: SizedBox(
            width: width != null ? width : Dimensions.WEB_MAX_WIDTH,
            child: Padding(
              padding: margin == null ? EdgeInsets.all(0) : margin!,
              child: TextButton(
                onPressed: onPressed,
                style: _flatButtonStyle,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  icon == null
                      ? Padding(
                          padding: EdgeInsets.only(
                              right: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          child: Icon(icon,
                              color: transparent! ? Colors.pink : Colors.pink),
                        )
                      : SizedBox(),
                  Text(buttonText ?? '',
                      textAlign: TextAlign.center,
                      style: robotoBold.copyWith(
                        color: transparent! ? Colors.pink : Colors.white,
                        fontSize: fontSize != null
                            ? fontSize
                            : Dimensions.fontSizeLarge,
                      )),
                ]),
              ),
            )));
  }
}
