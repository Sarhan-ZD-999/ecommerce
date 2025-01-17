import '../product_detail_tab_container_screen/widgets/widget_item_widget.dart';
import 'controller/product_detail_tab_container_controller.dart';
import 'models/widget_item_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:almohsen_ecommerce/core/app_export.dart';
import 'package:almohsen_ecommerce/presentation/product_detail_page/product_detail_page.dart';
import 'package:almohsen_ecommerce/widgets/app_bar/appbar_leading_image.dart';
import 'package:almohsen_ecommerce/widgets/app_bar/appbar_subtitle.dart';
import 'package:almohsen_ecommerce/widgets/app_bar/appbar_trailing_image.dart';
import 'package:almohsen_ecommerce/widgets/app_bar/custom_app_bar.dart';
import 'package:almohsen_ecommerce/widgets/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailTabContainerScreen
    extends GetWidget<ProductDetailTabContainerController> {
  const ProductDetailTabContainerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(),
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 12.v),
                    child: Column(children: [
                      _buildProductOverview(),
                      SizedBox(height: 22.v),
                      _buildSelectSize(),
                      SizedBox(
                          height: 1170.v,
                          child: TabBarView(
                              controller: controller.tabviewController,
                              children: [
                                ProductDetailPage(),
                                ProductDetailPage(),
                                ProductDetailPage()
                              ]))
                    ])))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 16.h, top: 16.v, bottom: 15.v),
            onTap: () {
              onTapArrowLeft();
            }),
        title: AppbarSubtitle(
            text: "msg_nike_air_max_2702".tr,
            margin: EdgeInsets.only(left: 12.h)),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgNavExplore,
              margin: EdgeInsets.only(left: 16.h, top: 16.v, right: 15.h),
              onTap: () {
                onTapSearchIcon();
              }),
          AppbarTrailingImage(
              imagePath: ImageConstant.imgMoreIcon,
              margin: EdgeInsets.only(left: 16.h, top: 16.v, right: 31.h))
        ]);
  }

  /// Section Widget
  Widget _buildSettings() {
    return Column(children: [
      Obx(() => CarouselSlider.builder(
          options: CarouselOptions(
              height: 238.v,
              initialPage: 0,
              autoPlay: true,
              viewportFraction: 1.0,
              enableInfiniteScroll: false,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                controller.sliderIndex.value = index;
              }),
          itemCount: controller.productDetailTabContainerModelObj.value
              .widgetItemList.value.length,
          itemBuilder: (context, index, realIndex) {
            WidgetItemModel model = controller.productDetailTabContainerModelObj
                .value.widgetItemList.value[index];
            return WidgetItemWidget(model);
          })),
      SizedBox(height: 16.v),
      Obx(() => SizedBox(
          height: 8.v,
          child: AnimatedSmoothIndicator(
              activeIndex: controller.sliderIndex.value,
              count: controller.productDetailTabContainerModelObj.value
                  .widgetItemList.value.length,
              axisDirection: Axis.horizontal,
              effect: ScrollingDotsEffect(
                  spacing: 8,
                  activeDotColor: theme.colorScheme.primary.withOpacity(1),
                  dotColor: appTheme.blue50,
                  dotHeight: 8.v,
                  dotWidth: 8.h))))
    ]);
  }

  /// Section Widget
  Widget _buildProductOverview() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _buildSettings(),
      SizedBox(height: 15.v),
      Align(
          alignment: Alignment.center,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: SizedBox(
                            width: 275.h,
                            child: Text("msg_nike_air_zoom_pegasus".tr,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: CustomTextStyles.titleLargeOnPrimary
                                    .copyWith(height: 1.50)))),
                    CustomImageView(
                        imagePath: ImageConstant.imgLoveIcon,
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                        margin:
                            EdgeInsets.only(left: 44.h, top: 2.v, bottom: 33.v))
                  ]))),
      SizedBox(height: 8.v),
      Padding(
          padding: EdgeInsets.only(left: 16.h),
          child: CustomRatingBar(initialRating: 4, itemSize: 16)),
      SizedBox(height: 16.v),
      Padding(
          padding: EdgeInsets.only(left: 16.h),
          child: Text("lbl_299_43".tr, style: theme.textTheme.titleLarge))
    ]);
  }

  /// Section Widget
  Widget _buildSelectSize() {
    return Align(
        alignment: Alignment.centerRight,
        child: Padding(
            padding: EdgeInsets.only(left: 16.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("lbl_select_size".tr, style: theme.textTheme.titleSmall),
              SizedBox(height: 13.v),
              Container(
                  height: 48.v,
                  width: 368.h,
                  child: TabBar(
                      controller: controller.tabviewController,
                      isScrollable: true,
                      labelColor: theme.colorScheme.onPrimary.withOpacity(1),
                      labelStyle: TextStyle(
                          fontSize: 14.fSize,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700),
                      unselectedLabelColor:
                          theme.colorScheme.onPrimary.withOpacity(1),
                      unselectedLabelStyle: TextStyle(
                          fontSize: 14.fSize,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700),
                      indicator: BoxDecoration(
                          color: theme.colorScheme.onPrimaryContainer
                              .withOpacity(1),
                          borderRadius: BorderRadius.circular(24.h),
                          border: Border.all(
                              color: theme.colorScheme.primary.withOpacity(1),
                              width: 1.h)),
                      tabs: [
                        Tab(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                              Container(
                                  width: 48.adaptSize,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 19.h, vertical: 13.v),
                                  decoration: AppDecoration.outlineBlue
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.circleBorder24),
                                  child: Text("lbl_6".tr)),
                              Container(
                                  width: 48.adaptSize,
                                  margin: EdgeInsets.only(left: 16.h),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12.h, vertical: 13.v),
                                  decoration: AppDecoration.outlineBlue
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.circleBorder24),
                                  child: Text("lbl_6_5".tr))
                            ])),
                        Tab(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                              Container(
                                  width: 48.adaptSize,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.h, vertical: 13.v),
                                  decoration: AppDecoration.outlinePrimary
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.circleBorder24),
                                  child: Text("lbl_7".tr)),
                              Container(
                                  width: 48.adaptSize,
                                  margin: EdgeInsets.only(left: 16.h),
                                  padding: EdgeInsets.all(13.h),
                                  decoration: AppDecoration.outlineBlue
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.circleBorder24),
                                  child: Text("lbl_7_5".tr))
                            ])),
                        Tab(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                              Container(
                                  width: 48.adaptSize,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 19.h, vertical: 13.v),
                                  decoration: AppDecoration.outlineBlue
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.circleBorder24),
                                  child: Text("lbl_8".tr)),
                              Container(
                                  width: 48.adaptSize,
                                  margin: EdgeInsets.only(left: 16.h),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12.h, vertical: 13.v),
                                  decoration: AppDecoration.outlineBlue
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.circleBorder24),
                                  child: Text("lbl_8_5".tr))
                            ]))
                      ]))
            ])));
  }

  /// Common widget
  Widget _buildSeven({
    required String seven,
    required String seventyFive,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
          width: 48.adaptSize,
          padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 13.v),
          decoration: AppDecoration.outlinePrimary
              .copyWith(borderRadius: BorderRadiusStyle.circleBorder24),
          child: Text(seven,
              style: theme.textTheme.titleSmall!.copyWith(
                  color: theme.colorScheme.onPrimary.withOpacity(1)))),
      Container(
          width: 48.adaptSize,
          margin: EdgeInsets.only(left: 16.h),
          padding: EdgeInsets.all(13.h),
          decoration: AppDecoration.outlineBlue
              .copyWith(borderRadius: BorderRadiusStyle.circleBorder24),
          child: Text(seventyFive,
              style: theme.textTheme.titleSmall!
                  .copyWith(color: theme.colorScheme.onPrimary.withOpacity(1))))
    ]);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }

  /// Navigates to the searchScreen when the action is triggered.
  onTapSearchIcon() {
    Get.toNamed(
      AppRoutes.searchScreen,
    );
  }
}
