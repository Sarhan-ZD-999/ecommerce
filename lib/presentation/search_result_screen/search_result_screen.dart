import '../search_result_screen/widgets/searchresult_item_widget.dart';
import 'controller/search_result_controller.dart';
import 'models/searchresult_item_model.dart';
import 'package:almohsen_ecommerce/core/app_export.dart';
import 'package:almohsen_ecommerce/widgets/app_bar/appbar_title_image.dart';
import 'package:almohsen_ecommerce/widgets/app_bar/appbar_title_searchview_two.dart';
import 'package:almohsen_ecommerce/widgets/app_bar/custom_app_bar.dart';
import 'package:almohsen_ecommerce/widgets/custom_drop_down.dart';
import 'package:flutter/material.dart';

class SearchResultScreen extends GetWidget<SearchResultController> {
  const SearchResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 15.v),
                child: Column(children: [
                  _buildResultCounter(),
                  SizedBox(height: 16.v),
                  _buildSearchResult()
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        height: 79.v,
        centerTitle: true,
        title: Column(children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              child: Row(children: [
                AppbarTitleSearchviewTwo(
                    hintText: "lbl_nike_air_max".tr,
                    controller: controller.searchController),
                AppbarTitleImage(
                    imagePath: ImageConstant.imgShortIcon,
                    margin: EdgeInsets.only(
                        left: 16.h, top: 9.v, bottom: 9.v, right: 16.h),
                    onTap: () {
                      onTapShortIcon();
                    }),
                AppbarTitleImage(
                    imagePath: ImageConstant.imgFilter,
                    margin: EdgeInsets.only(left: 16.h, top: 9.v, bottom: 9.v))
              ])),
          SizedBox(height: 18.v),
          SizedBox(width: double.maxFinite, child: Divider())
        ]),
        styleType: Style.bgFill_1);
  }

  /// Section Widget
  Widget _buildResultCounter() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Opacity(
              opacity: 0.5,
              child: Padding(
                  padding: EdgeInsets.only(top: 1.v, bottom: 4.v),
                  child: Text("lbl_145_result".tr,
                      style: CustomTextStyles.labelLargeOnPrimary))),
          CustomDropDown(
              width: 103.h,
              icon: Container(
                  margin: EdgeInsets.only(left: 8.h, right: 8.h),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgDownIcon,
                      height: 24.adaptSize,
                      width: 24.adaptSize)),
              hintText: "lbl_man_shoes".tr,
              items:
                  controller.searchResultModelObj.value.dropdownItemList!.value,
              onChanged: (value) {
                controller.onSelected(value);
              })
        ]);
  }

  /// Section Widget
  Widget _buildSearchResult() {
    return Expanded(
        child: Obx(() => GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 283.v,
                crossAxisCount: 2,
                mainAxisSpacing: 13.h,
                crossAxisSpacing: 13.h),
            physics: BouncingScrollPhysics(),
            itemCount: controller
                .searchResultModelObj.value.searchresultItemList.value.length,
            itemBuilder: (context, index) {
              SearchresultItemModel model = controller
                  .searchResultModelObj.value.searchresultItemList.value[index];
              return SearchresultItemWidget(model);
            })));
  }

  /// Navigates to the sortByScreen when the action is triggered.
  onTapShortIcon() {
    Get.toNamed(
      AppRoutes.sortByScreen,
    );
  }
}
