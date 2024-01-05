import 'package:flutter/material.dart';
import 'package:moni5/core/app_export.dart';
import 'package:moni5/presentation/anggaran_screen/anggaran_screen.dart';
import 'package:moni5/widgets/custom_floating_text_field.dart';
import 'package:moni5/presentation/tujuan_screen/tujuan_screen.dart';

// ignore_for_file: must_be_immutable
class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  TextEditingController totalBalanceController = TextEditingController();

  TextEditingController remainingBudgetController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                width: double.maxFinite,
                decoration: AppDecoration.fillWhiteA700,
                child: SingleChildScrollView(
                    child: SizedBox(
                        height: 808.v,
                        width: double.maxFinite,
                        child:
                            Stack(alignment: Alignment.bottomCenter, children: [
                          _buildWelcomeRow(context),
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 17.h, vertical: 24.v),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder20),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                                "Pengeluaran Januari 2023",
                                                style: CustomTextStyles
                                                    .bodyMediumRegular)),
                                        SizedBox(height: 2.v),
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text("Rp0",
                                                style: theme
                                                    .textTheme.displayMedium)),
                                        SizedBox(height: 22.v),
                                        _buildBudgetRow(context),
                                        SizedBox(height: 38.v),
                                        _buildFinancialGoalColumn(context),
                                        SizedBox(height: 21.v),
                                        _buildSeventyThree(context),
                                        SizedBox(height: 21.v)
                                      ])))
                        ]))))));
  }

  /// Section Widget
  Widget _buildWelcomeRow(BuildContext context) {
    return Align(
        alignment: Alignment.topCenter,
        child: Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(bottom: 686.v),
            padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 41.v),
            decoration: AppDecoration.fillOnError,
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomImageView(
                  imagePath: ImageConstant.imgUserFill,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  margin: EdgeInsets.only(bottom: 16.v)),
              Padding(
                  padding: EdgeInsets.only(left: 3.h, top: 5.v, bottom: 14.v),
                  child: Text("Selamat datang, Fauzan",
                      style: CustomTextStyles.bodyMediumWhiteA700))
            ])));
  }

  /// Section Widget
  Widget _buildBudgetRow(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 5.h, right: 6.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(right: 19.h),
                  child: CustomFloatingTextField(
                      controller: totalBalanceController,
                      labelText: "Total saldo",
                      labelStyle: theme.textTheme.titleSmall!,
                      hintText: "Total saldo",
                      prefix: Container(
                          margin: EdgeInsets.only(left: 12.h, right: 8.h),
                          child: CustomImageView(
                              imagePath: ImageConstant.imgWalletfill,
                              height: 24.adaptSize,
                              width: 24.adaptSize)),
                      prefixConstraints: BoxConstraints(maxHeight: 47.v)))),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(left: 19.h),
                  child: CustomFloatingTextField(
                      controller: remainingBudgetController,
                      labelText: "Sisa Anggaran",
                      labelStyle: theme.textTheme.titleSmall!,
                      hintText: "Sisa Anggaran",
                      textInputAction: TextInputAction.done,
                      prefix: Container(
                          margin: EdgeInsets.only(left: 10.h, right: 7.h),
                          child: CustomImageView(
                              imagePath: ImageConstant.imgNotebookfill,
                              height: 29.v,
                              width: 27.h)),
                      prefixConstraints: BoxConstraints(maxHeight: 47.v))))
        ]));
  }

  /// Section Widget
  Widget _buildFinancialGoalColumn(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 6.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 5.h),
              child: Text("Anggaran", style: theme.textTheme.labelLarge)),
          SizedBox(height: 2.v),
          Container(
              margin: EdgeInsets.only(left: 5.h),
              padding: EdgeInsets.symmetric(horizontal: 68.h, vertical: 10.v),
              decoration: AppDecoration.fillGray
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
            child: GestureDetector(
            onTap: () {
              // Navigasi ke tujuan.dart
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AnggaranScreen()),
              );
              },
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(height: 10.v),
                    CustomImageView(
                        imagePath: ImageConstant.imgGroup,
                        height: 26.v,
                        width: 27.h,
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.only(right: 84.h)),
                    SizedBox(height: 6.v),
                    Text("Kamu belum memiliki anggaran",
                        style: theme.textTheme.bodyMedium),
                    SizedBox(height: 9.v),
                    _buildCreateGoalStack(context, dynamicText: "Atur Sekarang",
                        onTapCreateGoalStack: () {
                      onTapEighteen(context);
                    })
                  ]))
        )]));
  }

  /// Section Widget
  Widget _buildSeventyThree(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 6.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
          Padding(
              padding: EdgeInsets.only(left: 5.h),
              child:
                  Text("Tujuan Keuangan", 
                  style: theme.textTheme.labelLarge)),
          SizedBox(height: 3.v),
          Container(
              margin: EdgeInsets.only(left: 5.h),
              padding: EdgeInsets.symmetric(horizontal: 34.h, vertical: 10.v),
              decoration: AppDecoration.fillGray
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
          child: GestureDetector(
            onTap: () {
              // Navigasi ke tujuan.dart
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TujuanScreen()),
              );
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 3.v),
                CustomImageView(
                  imagePath: ImageConstant .imgGiftLightDuotoneLinePrimarycontainer,
                  height: 34.v,
                  width: 35.h,
                ),
                Text(
                  "Hanya 30 detik, buat tujuan keuangan dari >50  template yang sudah tersedia",
                  style: theme.textTheme.bodySmall,
                ),
                    _buildCreateGoalStack(context, dynamicText: "Buat Sekarang",
                        onTapCreateGoalStack: () {
                      onTapCreateGoalStack(context);
                    })
                  ]))
        )]));
  }

  /// Common widget
  Widget _buildCreateGoalStack(
    BuildContext context, {
    required String dynamicText,
    Function? onTapCreateGoalStack,
  }) {
    return GestureDetector(
        onTap: () {
          onTapCreateGoalStack!.call();
        },
        child: Container(
            height: 41.v,
            width: 177.h,
            decoration: AppDecoration.outlineBlack,
            child: Stack(alignment: Alignment.center, children: [
              Align(
                  alignment: Alignment.center,
                  child: Container(
                      margin: EdgeInsets.only(left: 1.h),
                      padding:
                          EdgeInsets.symmetric(horizontal: 32.h, vertical: 8.v),
                      decoration: AppDecoration.fillWhiteA700.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder20),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 1.v),
                            Text(dynamicText,
                                style: CustomTextStyles.titleSmallCyan400
                                    .copyWith(color: appTheme.cyan400))
                          ]))),
              CustomImageView(
                  imagePath: ImageConstant.imgVector60,
                  height: 40.v,
                  width: 177.h,
                  alignment: Alignment.center)
            ])));
  }

  /// Navigates to the anggaranScreen when the action is triggered.
  onTapEighteen(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.anggaranScreen);
  }

  /// Navigates to the tujuanScreen when the action is triggered.
  onTapCreateGoalStack(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.tujuanScreen);
  }
}
