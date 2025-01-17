import 'controller/change_password_controller.dart';
import 'package:almohsen_ecommerce/core/app_export.dart';
import 'package:almohsen_ecommerce/core/utils/validation_functions.dart';
import 'package:almohsen_ecommerce/widgets/app_bar/appbar_leading_image.dart';
import 'package:almohsen_ecommerce/widgets/app_bar/appbar_subtitle.dart';
import 'package:almohsen_ecommerce/widgets/app_bar/custom_app_bar.dart';
import 'package:almohsen_ecommerce/widgets/custom_elevated_button.dart';
import 'package:almohsen_ecommerce/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class ChangePasswordScreen extends GetWidget<ChangePasswordController> {
  ChangePasswordScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(),
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.h, vertical: 26.v),
                            child: Column(children: [
                              _buildOldPassword(),
                              SizedBox(height: 23.v),
                              _buildNewPassword(),
                              SizedBox(height: 24.v),
                              _buildConfirmPassword(),
                              SizedBox(height: 5.v)
                            ]))))),
            bottomNavigationBar: _buildSave()));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(
                left: 16.h, top: 14.v, bottom: 17.v, right: 16.h),
            onTap: () {
              onTapArrowLeft();
            }),
        title: AppbarSubtitle(
            text: "lbl_change_password".tr,
            margin: EdgeInsets.only(left: 12.h)));
  }

  /// Section Widget
  Widget _buildOldPassword() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_old_password".tr, style: theme.textTheme.titleSmall),
      SizedBox(height: 12.v),
      CustomTextFormField(
          controller: controller.passwordController,
          hintText: "msg".tr,
          hintStyle: CustomTextStyles.labelLargeBluegray300,
          textInputType: TextInputType.visiblePassword,
          prefix: Container(
              margin: EdgeInsets.fromLTRB(16.h, 12.v, 10.h, 12.v),
              child: CustomImageView(
                  imagePath: ImageConstant.imgLocation,
                  height: 24.adaptSize,
                  width: 24.adaptSize)),
          prefixConstraints: BoxConstraints(maxHeight: 48.v),
          validator: (value) {
            if (value == null || (!isValidPassword(value, isRequired: true))) {
              return "err_msg_please_enter_valid_password".tr;
            }
            return null;
          },
          obscureText: true,
          contentPadding: EdgeInsets.only(top: 15.v, right: 30.h, bottom: 15.v),
          borderDecoration: TextFormFieldStyleHelper.outlineBlueTL5,
          filled: false)
    ]);
  }

  /// Section Widget
  Widget _buildNewPassword() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_new_password".tr, style: theme.textTheme.titleSmall),
      SizedBox(height: 12.v),
      CustomTextFormField(
          controller: controller.newpasswordController,
          hintText: "msg".tr,
          hintStyle: CustomTextStyles.labelLargeBluegray300,
          textInputType: TextInputType.visiblePassword,
          prefix: Container(
              margin: EdgeInsets.fromLTRB(16.h, 12.v, 10.h, 12.v),
              child: CustomImageView(
                  imagePath: ImageConstant.imgLocation,
                  height: 24.adaptSize,
                  width: 24.adaptSize)),
          prefixConstraints: BoxConstraints(maxHeight: 48.v),
          validator: (value) {
            if (value == null || (!isValidPassword(value, isRequired: true))) {
              return "err_msg_please_enter_valid_password".tr;
            }
            return null;
          },
          obscureText: true,
          contentPadding: EdgeInsets.only(top: 15.v, right: 30.h, bottom: 15.v),
          borderDecoration: TextFormFieldStyleHelper.outlineBlueTL5,
          filled: false)
    ]);
  }

  /// Section Widget
  Widget _buildConfirmPassword() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("msg_new_password_again".tr, style: theme.textTheme.titleSmall),
      SizedBox(height: 11.v),
      CustomTextFormField(
          controller: controller.newpasswordController1,
          hintText: "msg".tr,
          hintStyle: CustomTextStyles.labelLargeBluegray300,
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.visiblePassword,
          prefix: Container(
              margin: EdgeInsets.fromLTRB(16.h, 12.v, 10.h, 12.v),
              child: CustomImageView(
                  imagePath: ImageConstant.imgLocation,
                  height: 24.adaptSize,
                  width: 24.adaptSize)),
          prefixConstraints: BoxConstraints(maxHeight: 48.v),
          validator: (value) {
            if (value == null || (!isValidPassword(value, isRequired: true))) {
              return "err_msg_please_enter_valid_password".tr;
            }
            return null;
          },
          obscureText: true,
          contentPadding: EdgeInsets.only(top: 15.v, right: 30.h, bottom: 15.v),
          borderDecoration: TextFormFieldStyleHelper.outlineBlueTL5,
          filled: false)
    ]);
  }

  /// Section Widget
  Widget _buildSave() {
    return CustomElevatedButton(
        text: "lbl_save".tr,
        margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 50.v));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
