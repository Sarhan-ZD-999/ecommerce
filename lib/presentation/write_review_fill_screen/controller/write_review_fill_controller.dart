import 'package:almohsen_ecommerce/core/app_export.dart';
import 'package:almohsen_ecommerce/presentation/write_review_fill_screen/models/write_review_fill_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the WriteReviewFillScreen.
///
/// This class manages the state of the WriteReviewFillScreen, including the
/// current writeReviewFillModelObj
class WriteReviewFillController extends GetxController {
  TextEditingController addReviewController = TextEditingController();

  Rx<WriteReviewFillModel> writeReviewFillModelObj = WriteReviewFillModel().obs;

  @override
  void onClose() {
    super.onClose();
    addReviewController.dispose();
  }
}
