import 'controller/notification_feed_controller.dart';
import 'package:almohsen_ecommerce/core/app_export.dart';
import 'package:almohsen_ecommerce/widgets/app_bar/appbar_leading_image.dart';
import 'package:almohsen_ecommerce/widgets/app_bar/appbar_subtitle.dart';
import 'package:almohsen_ecommerce/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class NotificationFeedScreen extends GetWidget<NotificationFeedController> {
  const NotificationFeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 11.v),
                child: Column(children: [
                  _buildFeedItem(
                      productImage: ImageConstant.imgProductImage,
                      bestProduct: "lbl_new_product".tr,
                      nikeAirZoomPegasus: "msg_nike_air_zoom_pegasus2".tr,
                      time: "msg_june_3_2015_5_06".tr),
                  _buildFeedItem(
                      productImage: ImageConstant.imgImageProduct,
                      bestProduct: "lbl_best_product".tr,
                      nikeAirZoomPegasus: "msg_nike_air_zoom_pegasus2".tr,
                      time: "msg_june_3_2015_5_06".tr),
                  SizedBox(height: 5.v),
                  _buildFeedItem(
                      productImage: ImageConstant.imgProductImage1,
                      bestProduct: "lbl_new_product".tr,
                      nikeAirZoomPegasus: "msg_nike_air_zoom_pegasus2".tr,
                      time: "msg_june_3_2015_5_06".tr)
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(
                left: 16.h, top: 15.v, bottom: 16.v, right: 16.h),
            onTap: () {
              onTapArrowLeft();
            }),
        title: AppbarSubtitle(
            text: "lbl_feed".tr, margin: EdgeInsets.only(left: 12.h)));
  }

  /// Common widget
  Widget _buildFeedItem({
    required String productImage,
    required String bestProduct,
    required String nikeAirZoomPegasus,
    required String time,
  }) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.all(16.h),
        decoration: AppDecoration.fillOnPrimaryContainer,
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomImageView(
              imagePath: productImage,
              height: 48.adaptSize,
              width: 48.adaptSize,
              radius: BorderRadius.circular(5.h),
              margin: EdgeInsets.only(bottom: 40.v)),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(left: 12.h),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(bestProduct,
                            style: theme.textTheme.titleSmall!.copyWith(
                                color: theme.colorScheme.onPrimary
                                    .withOpacity(1))),
                        SizedBox(height: 6.v),
                        SizedBox(
                            width: 269.h,
                            child: Text(nikeAirZoomPegasus,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.bodySmall!.copyWith(
                                    color: appTheme.blueGray300,
                                    height: 1.80))),
                        SizedBox(height: 1.v),
                        Text(time,
                            style: CustomTextStyles.bodySmallOnPrimary10
                                .copyWith(
                                    color: theme.colorScheme.onPrimary
                                        .withOpacity(1)))
                      ])))
        ]));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
