import 'package:flutter/material.dart';
import 'package:moni5/core/app_export.dart';
import 'package:moni5/widgets/custom_elevated_button.dart';
import 'package:moni5/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class TransaksiScreen extends StatelessWidget {
  TransaksiScreen({Key? key}) : super(key: key);

  TextEditingController inputController = TextEditingController();

  TextEditingController inputController1 = TextEditingController();

  TextEditingController inputController2 = TextEditingController();

  TextEditingController inputController3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 17.h),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 13.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.only(left: 2.h, right: 86.h),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 1.v),
                                        child: Text("Tambah Transaksi",
                                            style:
                                                theme.textTheme.headlineSmall)),
                                    CustomImageView(
                                        imagePath:
                                            ImageConstant.imgTicketAltFill,
                                        height: 30.adaptSize,
                                        width: 30.adaptSize,
                                        margin: EdgeInsets.only(
                                            left: 15.h, top: 7.v))
                                  ]))),
                      SizedBox(height: 28.v),
                      _buildTransactionRow(context),
                      SizedBox(height: 21.v),
                      _buildDescriptionColumn(context),
                      SizedBox(height: 22.v),
                      _buildDateColumn(context),
                      SizedBox(height: 32.v),
                      _buildAmountColumn(context)
                    ])),
            bottomNavigationBar: _buildSaveButton(context)));
  }

  /// Section Widget
  Widget _buildTransactionRow(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 2.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 8.h),
              child:
                  Text("Nama Transaksi", style: theme.textTheme.titleMedium)),
          CustomTextFormField(controller: inputController)
        ]));
  }

  /// Section Widget
  Widget _buildDescriptionColumn(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 2.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 6.h),
              child: Text("Deskripsi", style: theme.textTheme.titleMedium)),
          CustomTextFormField(controller: inputController1)
        ]));
  }

  /// Section Widget
  Widget _buildDateColumn(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 2.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 8.h),
              child: Text("Tanggal", style: theme.textTheme.titleMedium)),
          CustomTextFormField(controller: inputController2)
        ]));
  }

  /// Section Widget
  Widget _buildAmountColumn(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 2.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 8.h),
              child: Text("Nominal", style: theme.textTheme.titleMedium)),
          CustomTextFormField(
              controller: inputController3,
              textInputAction: TextInputAction.done)
        ]));
  }

  /// Section Widget
  Widget _buildSaveButton(BuildContext context) {
    return CustomElevatedButton(
        text: "Simpan",
        margin: EdgeInsets.only(left: 19.h, right: 17.h, bottom: 41.v),
        onPressed: () {
          onTapSaveButton(context);
        });
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapSaveButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loginScreen);
  }
}
