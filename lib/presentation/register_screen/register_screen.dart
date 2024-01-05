import 'package:flutter/material.dart';
import 'package:moni5/core/app_export.dart';
import 'package:moni5/widgets/custom_elevated_button.dart';
import 'package:moni5/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  TextEditingController emailFieldController = TextEditingController();

  TextEditingController passwordFieldController = TextEditingController();

  TextEditingController confirmPasswordFieldController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Center(
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(horizontal: 15.h),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Create Account",
                                      style: theme.textTheme.headlineLarge),
                                  SizedBox(height: 62.v),
                                  _buildEmailField(context),
                                  SizedBox(height: 26.v),
                                  _buildPasswordField(context),
                                  SizedBox(height: 26.v),
                                  _buildConfirmPasswordField(context),
                                  SizedBox(height: 53.v),
                                  _buildSignUpButton(context),
                                  SizedBox(height: 30.v),
                                  _buildAlreadyHaveAnAccountButton(context),
                                  SizedBox(height: 5.v)
                                ])))))));
  }

  /// Section Widget
  Widget _buildEmailField(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 6.h),
        child: CustomTextFormField(
            controller: emailFieldController,
            hintText: "Email",
            textInputType: TextInputType.emailAddress));
  }

  /// Section Widget
  Widget _buildPasswordField(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 6.h),
        child: CustomTextFormField(
            controller: passwordFieldController,
            hintText: "Password",
            textInputType: TextInputType.visiblePassword,
            obscureText: true));
  }

  /// Section Widget
  Widget _buildConfirmPasswordField(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 6.h),
        child: CustomTextFormField(
            controller: confirmPasswordFieldController,
            hintText: "Confirm Password",
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.visiblePassword,
            obscureText: true));
  }

  /// Section Widget
  Widget _buildSignUpButton(BuildContext context) {
    return CustomElevatedButton(
        text: "Sign up",
        margin: EdgeInsets.only(right: 6.h),
        onPressed: () {
          onTapSignUpButton(context);
        });
  }

  /// Section Widget
  Widget _buildAlreadyHaveAnAccountButton(BuildContext context) {
    return CustomElevatedButton(
        height: 41.v,
        text: "Already have an account",
        margin: EdgeInsets.only(right: 6.h),
        buttonStyle: CustomButtonStyles.fillWhiteA,
        buttonTextStyle: CustomTextStyles.titleSmallGray800,
        onPressed: () {
          onTapAlreadyHaveAnAccountButton(context);
        });
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapSignUpButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loginScreen);
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapAlreadyHaveAnAccountButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loginScreen);
  }
}
