import '../product_detail_page/widgets/blue_item_widget.dart';
import '../product_detail_page/widgets/products1_item_widget.dart';
import '../product_detail_page/widgets/recomended_item_widget.dart';
import 'controller/product_detail_controller.dart';
import 'models/blue_item_model.dart';
import 'models/product_detail_model.dart';
import 'models/products1_item_model.dart';
import 'models/recomended_item_model.dart';
import 'package:almohsen_ecommerce/core/app_export.dart';
import 'package:almohsen_ecommerce/widgets/custom_elevated_button.dart';
import 'package:almohsen_ecommerce/widgets/custom_rating_bar.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class ProductDetailPage extends StatelessWidget {
  ProductDetailPage({Key? key}) : super(key: key);

  ProductDetailController controller =
      Get.put(ProductDetailController(ProductDetailModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    child: Column(children: [
                  SizedBox(height: 23.v),
                  Padding(
                      padding: EdgeInsets.only(left: 16.h, right: 16.h),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildSelectColor(),
                            SizedBox(height: 25.v),
                            _buildSpecifications(),
                            SizedBox(height: 21.v),
                            _buildReview(),
                            SizedBox(height: 23.v),
                            _buildYouMightAlsoLike(),
                            SizedBox(height: 21.v),
                            CustomElevatedButton(
                                text: "lbl_add_to_cart".tr,
                                margin: EdgeInsets.only(right: 16.h))
                          ]))
                ])))));
  }

  /// Section Widget
  Widget _buildSelectColor() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_select_color".tr, style: theme.textTheme.titleSmall),
      SizedBox(height: 12.v),
      SizedBox(
          height: 48.v,
          child: Obx(() => ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return SizedBox(width: 16.h);
              },
              itemCount: controller
                  .productDetailModelObj.value.blueItemList.value.length,
              itemBuilder: (context, index) {
                BlueItemModel model = controller
                    .productDetailModelObj.value.blueItemList.value[index];
                return BlueItemWidget(model);
              })))
    ]);
  }

  /// Section Widget
  Widget _buildSpecifications() {
    return Padding(
        padding: EdgeInsets.only(right: 16.h),
        child: Column(children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text("lbl_specification".tr,
                  style: theme.textTheme.titleSmall)),
          SizedBox(height: 12.v),
          _buildStyle(
              style: "lbl_shown".tr, styleCode: "msg_laser_blue_anth".tr),
          SizedBox(height: 14.v),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _buildStyle(style: "lbl_style".tr, styleCode: "lbl_cd0113_400".tr),
            SizedBox(height: 19.v),
            Container(
                width: 320.h,
                margin: EdgeInsets.only(right: 23.h),
                child: Text("msg_the_nike_air_max".tr,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall!.copyWith(height: 1.80)))
          ])
        ]));
  }

  /// Section Widget
  Widget _buildReview() {
    return Padding(
        padding: EdgeInsets.only(right: 16.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _buildStyle(
              style: "lbl_review_product".tr,
              styleCode: "lbl_see_more".tr,
              onTapStyleCode: () {
                onTapTxtSeeMoreLink();
              }),
          SizedBox(height: 8.v),
          Row(children: [
            CustomRatingBar(initialRating: 4, itemSize: 16),
            Padding(
                padding: EdgeInsets.only(left: 8.h, right: 8.h),
                child: Text("lbl_4_5".tr,
                    style: CustomTextStyles.labelMediumBluegray300)),
            Padding(
                padding: EdgeInsets.only(left: 4.h),
                child: Text("lbl_5_review".tr,
                    style: CustomTextStyles.bodySmall10))
          ]),
          SizedBox(height: 16.v),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CustomImageView(
                imagePath: ImageConstant.imgProfilePicture,
                height: 48.adaptSize,
                width: 48.adaptSize,
                radius: BorderRadius.circular(24.h)),
            Padding(
                padding: EdgeInsets.only(left: 16.h, top: 2.v, bottom: 4.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("lbl_james_lawson".tr,
                          style: theme.textTheme.titleSmall),
                      SizedBox(height: 4.v),
                      CustomRatingBar(initialRating: 4, itemSize: 16)
                    ]))
          ]),
          SizedBox(height: 18.v),
          SizedBox(
              width: 339.h,
              child: Text("msg_air_max_are_always".tr,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodySmall!.copyWith(height: 1.80))),
          SizedBox(height: 13.v),
          SizedBox(
              height: 72.v,
              child: Obx(() => ListView.separated(
                  padding: EdgeInsets.only(right: 103.h),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 12.h);
                  },
                  itemCount: controller.productDetailModelObj.value
                      .products1ItemList.value.length,
                  itemBuilder: (context, index) {
                    Products1ItemModel model = controller.productDetailModelObj
                        .value.products1ItemList.value[index];
                    return Products1ItemWidget(model);
                  }))),
          SizedBox(height: 16.v),
          Text("msg_december_10_2016".tr, style: CustomTextStyles.bodySmall10)
        ]));
  }

  /// Section Widget
  Widget _buildYouMightAlsoLike() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("msg_you_might_also_like".tr, style: CustomTextStyles.titleSmall_1),
      SizedBox(height: 11.v),
      SizedBox(
          height: 238.v,
          child: Obx(() => ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return SizedBox(width: 16.h);
              },
              itemCount: controller
                  .productDetailModelObj.value.recomendedItemList.value.length,
              itemBuilder: (context, index) {
                RecomendedItemModel model = controller.productDetailModelObj
                    .value.recomendedItemList.value[index];
                return RecomendedItemWidget(model);
              })))
    ]);
  }

  /// Common widget
  Widget _buildStyle({
    required String style,
    required String styleCode,
    Function? onTapStyleCode,
  }) {
    return Row(children: [
      Padding(
          padding: EdgeInsets.only(top: 1.v),
          child: Text(style,
              style: CustomTextStyles.bodySmallOnPrimary.copyWith(
                  color: theme.colorScheme.onPrimary.withOpacity(1)))),
      GestureDetector(onTap: () {
        onTapStyleCode!.call();
      }),
      Padding(
          padding: EdgeInsets.only(left: 234.h, right: 234.h),
          child: Text(styleCode,
              style: theme.textTheme.bodySmall!
                  .copyWith(color: appTheme.blueGray300)))
    ]);
  }

  /// Navigates to the reviewProductScreen when the action is triggered.
  onTapTxtSeeMoreLink() {
    Get.toNamed(
      AppRoutes.reviewProductScreen,
    );
  }
}
