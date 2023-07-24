import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:cegid_app/app/resources/app_colors.dart';
import 'package:cegid_app/app/widgets/icon_generic.dart';


//ignore: must_be_immutable
class TextFormFieldGeneric extends StatelessWidget {

  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final _isObscure = true.obs;
  final IconData? iconSuffix;
  final double borderRadius;
  final IconData iconPrefix;
  final FocusNode focusNode;
  final bool haveSuffix;
  final double sizeIcon;
  final String hintText;
  final Color fillColor;
  final Color iconColor;
  final double padding;
  final bool isFilled;

  TextFormFieldGeneric({
    super.key,
    required this.textInputAction,
    required this.textInputType,
    required this.borderRadius,
    required this.haveSuffix,
    required this.iconPrefix,
    required this.focusNode,
    required this.fillColor,
    required this.iconColor,
    required this.hintText,
    required this.isFilled,
    required this.sizeIcon,
    required this.padding,
    this.iconSuffix,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Obx(
        () => TextFormField(
          textInputAction: textInputAction,
          obscureText:
              iconSuffix != null ? _isObscure.value : !_isObscure.value,
          keyboardType: textInputType,
          focusNode: focusNode,
          decoration: InputDecoration(
            prefixIcon: IconGeneric(
              highlightColor: AppColors.transparent,
              onPressedCallback: () {},
              padding: EdgeInsets.zero,
              color: iconColor,
              size: sizeIcon,
              icon: Icon(
                iconPrefix,
              ),
            ),
            suffixIcon: haveSuffix
                ? IconGeneric(
                    highlightColor: AppColors.grey.withOpacity(0.1),
                    onPressedCallback: _changeObscure,
                    padding: EdgeInsets.zero,
                    size: sizeIcon,
                    color: iconColor,
                    icon: Icon(
                      iconSuffix,
                    ),
                  )
                : null,
            fillColor: fillColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide.none,
            ),
            hintText: hintText,
            filled: isFilled,
          ),
        ),
      ),
    );
  }

  void _changeObscure() {
    _isObscure.value ? _isObscure(false) : _isObscure(true);
  }
}
