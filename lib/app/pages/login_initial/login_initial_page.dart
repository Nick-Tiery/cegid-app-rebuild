import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'package:cegid_app/generated/l10n.dart';
import 'package:cegid_app/app/widgets/button_generic.dart';
import 'package:cegid_app/app/widgets/text_form_field_generic.dart';
import 'package:cegid_app/app/resources/app_styles.dart';
import 'package:cegid_app/app/widgets/will_pop_scope_generic.dart';
import 'package:cegid_app/app/resources/app_colors.dart';
import 'package:cegid_app/app/resources/app_constants.dart';
import 'package:cegid_app/app/resources/app_images.dart';


class LoginInitialPage extends StatefulWidget {
  const LoginInitialPage({Key? key}) : super(key: key);

  @override
  State<LoginInitialPage> createState() => _LoginInitialPageState();
}

class _LoginInitialPageState extends State<LoginInitialPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final FocusNode _focusNodeUser = FocusNode();
  final FocusNode _focusNodePass = FocusNode();
  final FocusNode _focusNodeCif = FocusNode();

  late NavigatorState _navigator;

  @override
    void initState() {
      super.initState();
      _navigator = Navigator.of(context);
    }

  @override
  Widget build(BuildContext context) {
    return WillPopScopeGeneric(
        onWillPop: false,
        action: () {},
        child: GestureDetector(
          onTap: _unFocus,
          child: Scaffold(
            backgroundColor: AppColors.white,
            resizeToAvoidBottomInset: true,
            body: SafeArea(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40.0.h,
                      ),
                      Hero(
                        tag: AppConstants.tagLogo,
                        child: Image.asset(
                          AppImages.logo,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 50.0.h,
                      ),
                      TextFormFieldGeneric(
                        fillColor: AppColors.greyLight.withOpacity(0.3),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text,
                        iconPrefix: Icons.home_filled,
                        hintText: S.current.login_cif,
                        iconColor: AppColors.grey,
                        focusNode: _focusNodeCif,
                        borderRadius: 5.0.r,
                        haveSuffix: false,
                        sizeIcon: 20.0.w,
                        padding: 30.0.w,
                        isFilled: true,
                      ),
                      SizedBox(
                        height: 20.0.h,
                      ),
                      TextFormFieldGeneric(
                        fillColor: AppColors.greyLight.withOpacity(0.3),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text,
                        iconPrefix: Icons.person_rounded,
                        hintText: S.current.login_user,
                        iconColor: AppColors.grey,
                        focusNode: _focusNodeUser,
                        borderRadius: 5.0.r,
                        haveSuffix: false,
                        sizeIcon: 20.0.w,
                        padding: 30.0.w,
                        isFilled: true,
                      ),
                      SizedBox(
                        height: 20.0.h,
                      ),
                      TextFormFieldGeneric(
                        fillColor: AppColors.greyLight.withOpacity(0.3),
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.text,
                        iconSuffix: Icons.remove_red_eye,
                        hintText: S.current.login_pass,
                        iconPrefix: Icons.lock_rounded,
                        iconColor: AppColors.grey,
                        focusNode: _focusNodePass,
                        borderRadius: 5.0.r,
                        haveSuffix: true,
                        sizeIcon: 20.0.w,
                        padding: 30.0.w,
                        isFilled: true,
                      ),
                      SizedBox(
                        height: 50.0.h,
                      ),
                      ButtonGeneric(
                        text: S.current.login_button.toUpperCase(),
                        textStyle: AppStyles.appStyleButton,
                        width: double.infinity,
                        color: AppColors.blue,
                        borderRadius: 5.0.r,
                        padding: 50.0.w,
                        height: 50.0.h,
                      ),
                      SizedBox(
                        height: 30.0.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    
  }

  void _unFocus() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  void _onEditingCompleteCif() {
    FocusScope.of(context).requestFocus(_focusNodeUser);
  }

  void _onEditingCompleteUser() {
    FocusScope.of(context).requestFocus(_focusNodePass);
  }


}