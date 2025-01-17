import '../dashboard_page/widgets/arrowright_item_widget.dart';
import '../dashboard_page/widgets/flashsale_item_widget.dart';
import '../dashboard_page/widgets/megasale_item_widget.dart';
import '../dashboard_page/widgets/offerbanner_item_widget.dart';
import '../dashboard_page/widgets/products_item_widget.dart';
import 'controller/dashboard_controller.dart';
import 'models/arrowright_item_model.dart';
import 'models/dashboard_model.dart';
import 'models/flashsale_item_model.dart';
import 'models/megasale_item_model.dart';
import 'models/offerbanner_item_model.dart';
import 'models/products_item_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:almohsen_ecommerce/core/app_export.dart';
import 'package:almohsen_ecommerce/widgets/app_bar/appbar_leading_image.dart';
import 'package:almohsen_ecommerce/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:almohsen_ecommerce/widgets/app_bar/appbar_trailing_image.dart';
import 'package:almohsen_ecommerce/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore_for_file: must_be_immutable
class DashboardPage extends StatelessWidget {
  DashboardPage({Key? key}) : super(key: key);

  DashboardController controller =
      Get.put(DashboardController(DashboardModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            // Add a height constraint here
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 27.v, left: 16.h, bottom: 5.v),
                child: Column(
                  children: [
                    _buildOfferBannerTitle(),
                    SizedBox(height: 25.v),
                    _buildCategories(),
                    SizedBox(height: 37.v),
                    _buildFlashSale1(),
                    SizedBox(height: 23.v),
                    _buildMegaSale1(),
                    SizedBox(height: 29.v),
                    CustomImageView(
                      imagePath: ImageConstant.imgRecomendedProduct,
                      height: 206.v,
                      width: 343.h,
                      radius: BorderRadius.circular(5.h),
                      alignment: Alignment.centerLeft,
                    ),
                    SizedBox(height: 16.v),
                    _buildProducts(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 48.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgRewind,
            margin: EdgeInsets.only(
                left: 32.h, top: 20.v, bottom: 20.v, right: 16.h)),
        title: AppbarSubtitleOne(
            text: "lbl_search_product".tr,
            margin: EdgeInsets.only(left: 8.h, right: 8.h),
            onTap: () {
              onTapSearchProduct();
            }),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgLoveIcon,
              margin: EdgeInsets.only(left: 16.h, top: 16.v, right: 16.h),
              onTap: () {
                onTapLoveIcon();
              }),
          Container(
              height: 24.adaptSize,
              width: 24.adaptSize,
              margin: EdgeInsets.only(left: 16.h, top: 16.v, right: 32.h),
              child: Stack(alignment: Alignment.topRight, children: [
                CustomImageView(
                    imagePath: ImageConstant.imgNotificationIcon,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                    alignment: Alignment.center,
                    onTap: () {
                      onTapImgNotificationIcon();
                    }),
                CustomImageView(
                    imagePath: ImageConstant.imgClosePink300,
                    height: 8.adaptSize,
                    width: 8.adaptSize,
                    alignment: Alignment.topRight,
                    margin:
                        EdgeInsets.only(left: 14.h, right: 2.h, bottom: 16.v))
              ]))
        ]);
  }

  /// Section Widget
  Widget _buildOfferBannerTitle() {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
            padding: EdgeInsets.only(right: 16.h),
            child: Obx(() => CarouselSlider.builder(
                options: CarouselOptions(
                    height: 206.v,
                    initialPage: 0,
                    autoPlay: true,
                    viewportFraction: 1.0,
                    enableInfiniteScroll: false,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason) {
                      controller.sliderIndex.value = index;
                    }),
                itemCount: controller
                    .dashboardModelObj.value.offerbannerItemList.value.length,
                itemBuilder: (context, index, realIndex) {
                  OfferbannerItemModel model = controller
                      .dashboardModelObj.value.offerbannerItemList.value[index];
                  return OfferbannerItemWidget(model);
                }))),
        SizedBox(height: 16.v),
        Obx(() => Container(
            height: 8.v,
            margin: EdgeInsets.only(left: 135.h, right: 135.h),
            child: AnimatedSmoothIndicator(
                activeIndex: controller.sliderIndex.value,
                count: controller
                    .dashboardModelObj.value.offerbannerItemList.value.length,
                axisDirection: Axis.horizontal,
                effect: ScrollingDotsEffect(
                    spacing: 8,
                    activeDotColor: theme.colorScheme.primary.withOpacity(1),
                    dotColor: appTheme.blue50,
                    dotHeight: 8.v,
                    dotWidth: 8.h))))
      ]),
    );
  }

  /// Section Widget
  Widget _buildCategories() {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
            padding: EdgeInsets.only(right: 16.h),
            child: _buildHeader(
                title: "lbl_category".tr,
                seeMoreLink: "lbl_more_category".tr,
                onTapTitle: () {
                  onTapTxtMoreCategoryLink();
                },
                onTapSeeMoreLink: () {
                  onTapTxtMoreCategoryLink();
                })),
        SizedBox(height: 10.v),
        SizedBox(
            height: 94.v,
            child: Obx(() => ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return SizedBox(width: 12.h);
                },
                itemCount: controller
                    .dashboardModelObj.value.arrowrightItemList.value.length,
                itemBuilder: (context, index) {
                  ArrowrightItemModel model = controller
                      .dashboardModelObj.value.arrowrightItemList.value[index];
                  return ArrowrightItemWidget(model);
                })))
      ]),
    );
  }

  /// Section Widget
  Widget _buildFlashSale() {
    return SizedBox(
        height: 238.v,
        child: Obx(() => ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return SizedBox(width: 16.h);
            },
            itemCount: controller
                .dashboardModelObj.value.flashsaleItemList.value.length,
            itemBuilder: (context, index) {
              FlashsaleItemModel model = controller
                  .dashboardModelObj.value.flashsaleItemList.value[index];
              return FlashsaleItemWidget(model);
            })));
  }

  /// Section Widget
  Widget _buildFlashSale1() {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
            padding: EdgeInsets.only(right: 16.h),
            child: _buildHeader(
                title: "lbl_flash_sale".tr,
                seeMoreLink: "lbl_see_more".tr,
                onTapSeeMoreLink: () {
                  onTapFlashSaleHeader();
                },
                onTapTitle: () {
                  onTapFlashSaleHeader();
                })),
        SizedBox(height: 12.v),
        _buildFlashSale()
      ]),
    );
  }

  /// Section Widget
  Widget _buildMegaSale() {
    return SizedBox(
        height: 238.v,
        child: Obx(() => ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return SizedBox(width: 16.h);
            },
            itemCount: controller
                .dashboardModelObj.value.megasaleItemList.value.length,
            itemBuilder: (context, index) {
              MegasaleItemModel model = controller
                  .dashboardModelObj.value.megasaleItemList.value[index];
              return MegasaleItemWidget(model);
            })));
  }

  /// Section Widget
  Widget _buildMegaSale1() {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
            padding: EdgeInsets.only(right: 16.h),
            child: _buildHeader(
                title: "lbl_mega_sale".tr, seeMoreLink: "lbl_see_more".tr)),
        SizedBox(height: 10.v),
        _buildMegaSale()
      ]),
    );
  }

  /// Section Widget
  Widget _buildProducts() {
    return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
            padding: EdgeInsets.only(right: 16.h),
            child: Obx(() => GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 283.v,
                    crossAxisCount: 2,
                    mainAxisSpacing: 13.h,
                    crossAxisSpacing: 13.h),
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller
                    .dashboardModelObj.value.productsItemList.value.length,
                itemBuilder: (context, index) {
                  ProductsItemModel model = controller
                      .dashboardModelObj.value.productsItemList.value[index];
                  return ProductsItemWidget(model);
                }))));
  }

  /// Common widget
  Widget _buildHeader({
    required String title,
    required String seeMoreLink,
    Function? onTapTitle,
    Function? onTapSeeMoreLink,
    Color? color,
  }) {
    return Container(
      color: color ?? Colors.white,
      width: double.infinity, // Set width to take available space
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              onTapTitle!.call();
            },
            child: Text(
              title,
              style: theme.textTheme.titleSmall!.copyWith(
                color: theme.colorScheme.onPrimary.withOpacity(1),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              onTapSeeMoreLink!.call();
            },
            child: Text(
              seeMoreLink,
              style: CustomTextStyles.titleSmallPrimary.copyWith(
                color: theme.colorScheme.primary.withOpacity(1),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Navigates to the searchScreen when the action is triggered.
  onTapSearchProduct() {
    Get.toNamed(
      AppRoutes.searchScreen,
    );
  }

  /// Navigates to the favoriteProductScreen when the action is triggered.
  onTapLoveIcon() {
    Get.toNamed(
      AppRoutes.favoriteProductScreen,
    );
  }

  /// Navigates to the notificationScreen when the action is triggered.
  onTapImgNotificationIcon() {
    Get.toNamed(
      AppRoutes.notificationScreen,
    );
  }

  /// Navigates to the listCategoryScreen when the action is triggered.
  onTapTxtMoreCategoryLink() {
    Get.toNamed(
      AppRoutes.listCategoryScreen,
    );
  }

  /// Navigates to the superFlashSaleScreen when the action is triggered.
  onTapFlashSaleHeader() {
    Get.toNamed(
      AppRoutes.superFlashSaleScreen,
    );
  }
}
