import 'package:flutter/material.dart';
import 'package:moni5/core/app_export.dart';
import 'package:moni5/widgets/custom_elevated_button.dart';

class AwalScreen extends StatelessWidget {
  const AwalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.whiteA700.withOpacity(0.47),
            body: Container(
                width: double.maxFinite,
                padding:
                    EdgeInsets.symmetric(horizontal: 21.h, vertical: 116.v),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 59.v),
                      CustomImageView(
                          imagePath: ImageConstant.imgMoni1,
                          height: 145.v,
                          width: 148.h),
                      Spacer(),
                      Text("Moni", style: theme.textTheme.displaySmall),
                      SizedBox(height: 9.v),
                      Text("catatan keuangan otomatis",
                          style: CustomTextStyles.bodyMediumRegular14),
                      SizedBox(height: 72.v),
                      _buildActionButtons(context)
                    ]))));
  }

  /// Section Widget
Widget _buildActionButtons(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(right: 1.h),
    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(
        child: CustomElevatedButton(
          text: "User",
          margin: EdgeInsets.only(right: 15.h),
          onPressed: () {
            onTapUser(context);
          },
        ),
      ),
      Expanded(
        child: CustomElevatedButton(
          text: "Admin",
          margin: EdgeInsets.only(left: 15.h),
          buttonStyle: CustomButtonStyles.fillWhiteA,
          buttonTextStyle: CustomTextStyles.titleLargeBlack900,
          onPressed: () {
            onTapAdmin(context);
          },
        ),
      ),
    ]),
  );
}


  /// Navigates to the loginScreen when the action is triggered.
  onTapUser(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loginScreen);
  }
  onTapAdmin(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.adminpage);
  }
}