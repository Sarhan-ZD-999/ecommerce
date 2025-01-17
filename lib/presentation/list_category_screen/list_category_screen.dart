import 'controller/list_category_controller.dart';
import 'package:almohsen_ecommerce/core/app_export.dart';
import 'package:almohsen_ecommerce/widgets/app_bar/appbar_leading_image.dart';
import 'package:almohsen_ecommerce/widgets/app_bar/appbar_subtitle.dart';
import 'package:almohsen_ecommerce/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ListCategoryScreen extends GetWidget<ListCategoryController> {
  const ListCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(),
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 10.v),
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 5.v),
                        child: Column(children: [
                          _buildCategoryOption(
                              bikiniIcon: ImageConstant.imgArrowRight,
                              bikini: "lbl_shirt".tr,
                              onTapBikiniIcon: () {
                                onTapArrowRight();
                              }),
                          _buildCategoryOption(
                              bikiniIcon: ImageConstant.imgBikiniIcon,
                              bikini: "lbl_bikini".tr),
                          _buildCategoryOption(
                              bikiniIcon: ImageConstant.imgDressIcon,
                              bikini: "lbl_dress".tr),
                          _buildCategoryOption(
                              bikiniIcon: ImageConstant.imgManWorkEquipment,
                              bikini: "lbl_work_equipment".tr),
                          _buildCategoryOption(
                              bikiniIcon: ImageConstant.imgManPantsIcon,
                              bikini: "lbl_man_pants".tr),
                          _buildCategoryOption(
                              bikiniIcon: ImageConstant.imgManShoesIcon,
                              bikini: "lbl_man_shoes".tr),
                          _buildCategoryOption(
                              bikiniIcon: ImageConstant.imgManUnderwearIcon,
                              bikini: "lbl_man_underwear".tr),
                          _buildCategoryOption(
                              bikiniIcon: ImageConstant.imgManTShirtIcon,
                              bikini: "lbl_man_t_shirt".tr),
                          _buildCategoryOption(
                              bikiniIcon: ImageConstant.imgWomanBagIcon,
                              bikini: "lbl_woman_bag".tr),
                          _buildCategoryOption(
                              bikiniIcon: ImageConstant.imgWomanPantsIcon,
                              bikini: "lbl_woman_pants".tr),
                          _buildCategoryOption(
                              bikiniIcon: ImageConstant.imgHighHeelsIcon,
                              bikini: "lbl_high_heels".tr)
                        ]))))));
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
            text: "lbl_category".tr, margin: EdgeInsets.only(left: 12.h)));
  }

  /// Common widget
  Widget _buildCategoryOption({
    required String bikiniIcon,
    required String bikini,
    Function? onTapBikiniIcon,
  }) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.all(16.h),
        decoration: AppDecoration.fillOnPrimaryContainer,
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomImageView(
              imagePath: bikiniIcon,
              height: 24.adaptSize,
              width: 24.adaptSize,
              onTap: () {
                onTapBikiniIcon!.call();
              }),
          Padding(
              padding: EdgeInsets.only(
                  left: 16.h, top: 2.v, bottom: 3.v, right: 16.h),
              child: Text(bikini,
                  style: theme.textTheme.labelLarge!.copyWith(
                      color: theme.colorScheme.onPrimary.withOpacity(1))))
        ]));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }

  /// Navigates to the previous screen.
  onTapArrowRight() {
    Get.back();
  }
}
