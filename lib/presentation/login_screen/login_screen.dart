import 'package:flutter/material.dart';
import 'package:moni5/core/app_export.dart';
import 'package:moni5/widgets/custom_elevated_button.dart';
import 'package:moni5/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController emailFieldController = TextEditingController();

  TextEditingController passwordFieldController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.only(
                                left: 14.h, top: 81.v, right: 14.h),
                            child: Column(children: [
                              Text("Login here",
                                  style: theme.textTheme.headlineLarge),
                              SizedBox(height: 24.v),
                              SizedBox(
                                  width: 226.h,
                                  child: Text(
                                      "Welcome back you’ve\nbeen missed!",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: CustomTextStyles
                                          .titleLargeBlack90001)),
                              SizedBox(height: 80.v),
                              _buildEmailField(context),
                              SizedBox(height: 29.v),
                              _buildPasswordField(context),
                              SizedBox(height: 31.v),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: Text("Forgot your password?",
                                      style: CustomTextStyles
                                          .titleSmallIndigo600)),
                              SizedBox(height: 28.v),
                              _buildSignInButton(context),
                              SizedBox(height: 30.v),
                              _buildCreateAccountButton(context),
                              SizedBox(height: 5.v)
                            ])))))));
  }

  /// Section Widget
  Widget _buildEmailField(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 8.h),
        child: CustomTextFormField(
            controller: emailFieldController,
            hintText: "Email",
            textInputType: TextInputType.emailAddress));
  }

  /// Section Widget
  Widget _buildPasswordField(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 8.h),
        child: CustomTextFormField(
            controller: passwordFieldController,
            hintText: "Password",
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.visiblePassword,
            obscureText: true));
  }

  /// Section Widget
  Widget _buildSignInButton(BuildContext context) {
    return CustomElevatedButton(
        text: "Sign in",
        margin: EdgeInsets.only(left: 8.h),
        onPressed: () {
          onTapSignInButton(context);
        });
  }

  /// Section Widget
  Widget _buildCreateAccountButton(BuildContext context) {
    return CustomElevatedButton(
        height: 41.v,
        text: "Create new account",
        margin: EdgeInsets.only(left: 8.h),
        buttonStyle: CustomButtonStyles.fillWhiteA,
        buttonTextStyle: CustomTextStyles.titleSmallGray800,
        onPressed: () {
          onTapCreateAccountButton(context);
        });
  }

  /// Navigates to the navbarScreen when the action is triggered.
  onTapSignInButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.navbarScreen);
  }

  /// Navigates to the registerScreen when the action is triggered.
  onTapCreateAccountButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.registerScreen);
  }
}
