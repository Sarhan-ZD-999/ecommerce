import 'controller/profile_controller.dart';
import 'package:almohsen_ecommerce/core/app_export.dart';
import 'package:almohsen_ecommerce/widgets/app_bar/appbar_leading_image.dart';
import 'package:almohsen_ecommerce/widgets/app_bar/appbar_subtitle.dart';
import 'package:almohsen_ecommerce/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends GetWidget<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 36.v),
                child: Column(children: [
                  _buildProfile(),
                  SizedBox(height: 32.v),
                  _buildProfileDetailOption(
                      dateIcon: ImageConstant.imgGenderIcon,
                      birthday: "lbl_gender".tr,
                      date: "lbl_male".tr),
                  _buildProfileDetailOption(
                      dateIcon: ImageConstant.imgDateIcon,
                      birthday: "lbl_birthday".tr,
                      date: "lbl_12_12_2000".tr),
                  _buildProfileDetailOption(
                      dateIcon: ImageConstant.imgMessageIcon,
                      birthday: "lbl_email".tr,
                      date: "msg_rex4dom_gmail_com".tr),
                  _buildProfileDetailOption(
                      dateIcon: ImageConstant.imgCreditCardIcon,
                      birthday: "lbl_phone_number".tr,
                      date: "lbl_307_555_0133".tr),
                  SizedBox(height: 5.v),
                  _buildProfileDetailOption(
                      dateIcon: ImageConstant.imgTrophy,
                      birthday: "lbl_change_password".tr,
                      date: "msg".tr,
                      onTapProfileDetailOption: () {
                        onTapProfileDetailOption();
                      })
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(
                left: 16.h, top: 16.v, bottom: 15.v, right: 16.h),
            onTap: () {
              onTapArrowLeft();
            }),
        title: AppbarSubtitle(
            text: "lbl_profile".tr, margin: EdgeInsets.only(left: 12.h)));
  }

  /// Section Widget
  Widget _buildProfile() {
    return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
            padding: EdgeInsets.only(left: 16.h, right: 16.h),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomImageView(
                  imagePath: ImageConstant.imgProfilePicture72x72,
                  height: 72.adaptSize,
                  width: 72.adaptSize,
                  radius: BorderRadius.circular(36.h)),
              Padding(
                  padding: EdgeInsets.only(left: 16.h, top: 9.v, bottom: 14.v),
                  child: Column(children: [
                    Text("lbl_dominic_ovo".tr,
                        style: theme.textTheme.titleSmall),
                    SizedBox(height: 8.v),
                    Text("lbl_dominic_ovo2".tr,
                        style: theme.textTheme.bodySmall)
                  ]))
            ])));
  }

  /// Common widget
  Widget _buildProfileDetailOption({
    required String dateIcon,
    required String birthday,
    required String date,
    Function? onTapProfileDetailOption,
  }) {
    return GestureDetector(
        onTap: () {
          onTapProfileDetailOption!.call();
        },
        child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 15.v),
            decoration: AppDecoration.fillOnPrimaryContainer,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              CustomImageView(
                  imagePath: dateIcon,
                  height: 24.adaptSize,
                  width: 24.adaptSize),
              Padding(
                  padding: EdgeInsets.only(
                      left: 16.h, top: 3.v, bottom: 2.v, right: 16.h),
                  child: Text(birthday,
                      style: theme.textTheme.labelLarge!.copyWith(
                          color: theme.colorScheme.onPrimary.withOpacity(1)))),
              Spacer(),
              Padding(
                  padding: EdgeInsets.only(top: 2.v, bottom: 3.v),
                  child: Text(date,
                      style: theme.textTheme.bodySmall!
                          .copyWith(color: appTheme.blueGray300))),
              CustomImageView(
                  imagePath: ImageConstant.imgRightIcon,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  margin: EdgeInsets.only(left: 16.h))
            ])));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }

  /// Navigates to the changePasswordScreen when the action is triggered.
  onTapProfileDetailOption() {
    Get.toNamed(
      AppRoutes.changePasswordScreen,
    );
  }
}
