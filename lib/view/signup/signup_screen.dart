import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:innovative/utils/assets_manager.dart';
import 'package:innovative/utils/color_manager.dart';
import 'package:innovative/utils/extension.dart';
import 'package:innovative/utils/routes_manager.dart';
import 'package:innovative/utils/strings_manager.dart';
import 'package:innovative/utils/values_manager.dart';
import 'package:innovative/widget/app_icon.dart';
import 'package:innovative/widget/custome_button.dart';
import 'package:innovative/widget/text_form_field.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sizer/sizer.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  bool isEmailValid = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: SizedBox(
            width: AppSize.sizeWidth(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: AppSize.s10.h),
                const AppLogoIcon(),
                textspan(
                  text1: AppStrings.welcomeBackto,
                  text2: AppStrings.carePro,
                  context: context,
                  onTap: () {},
                ),
                Text(
                  AppStrings.joinMillionsDoctorsForFree,
                  style: TextStyle(
                      color: ColorManager.grey, fontSize: AppSize.s10.sp),
                ),
                SizedBox(height: 4.h),
                title(AppStrings.emailAddress, context),
                CustomeTextFormField(
                  hintText: AppStrings.hintEmailAddress,
                  controller: _emailController,
                  suffixIcon: isEmailValid
                      ? Image.asset(ImageAssets.checkiconImage)
                      : null,
                  onChanged: (String? v) {
                    setState(() {
                      if (v!.isValidEmail) {
                        isEmailValid = true;
                      } else {
                        isEmailValid = false;
                      }
                    });
                  },
                  validator: (String? v) {
                    if (v!.isValidEmail) {
                      return null;
                    } else {
                      return AppStrings.enterEmailAddress;
                    }
                  },
                ),
                SizedBox(height: 3.h),
                title(AppStrings.mobilePhone, context),
                selectCountryField(context),
                SizedBox(height: 2.h),
                title(AppStrings.password, context),
                CustomeTextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  hintText: AppStrings.password,
                  validator: (String? v) {
                    if (v!.isValidPassword) {
                      return null;
                    } else {
                      return AppStrings.passwordvalidator;
                    }
                  },
                ),
                SizedBox(height: 3.h),
                privacyPolicyText(),
                SizedBox(height: 3.h),
                button(
                    text: AppStrings.signUp,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(
                            context, Routes.appointmentsScheduleRoute);
                      }
                    }),
                or(),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppSize.sizeWidth(context) * 0.06),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      appleiconbutton(onTap: () {
                        Navigator.pushNamed(
                            context, Routes.appointmentsScheduleRoute);
                      }),
                      facebookGoogleBtn(onPhoneTap: () {
                        Navigator.pushNamed(
                            context, Routes.appointmentsScheduleRoute);
                      }, onEmailTap: () {
                        Navigator.pushNamed(
                            context, Routes.appointmentsScheduleRoute);
                      }),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget appleiconbutton({Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: AppSize.s50,
        decoration: BoxDecoration(
          color: ColorManager.black,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  ImageAssets.appleicon,
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                AppStrings.continueWith,
                style: TextStyle(color: ColorManager.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget facebookGoogleBtn({Function()? onPhoneTap, Function()? onEmailTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: onPhoneTap,
            child: Container(
              height: AppSize.s50,
              width: AppSize.s50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorManager.primary,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  ImageAssets.googleIcon,
                ),
              ),
            ),
          ),
          SizedBox(width: AppSize.s8.w),
          InkWell(
              onTap: onEmailTap,
              child: Container(
                height: AppSize.s50,
                width: AppSize.s50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorManager.darkblue,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.p12),
                  child: Image.asset(
                    ImageAssets.facebookicon,
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget or() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 1.0,
            width: 30.0.w,
            color: ColorManager.black,
          ),
          SizedBox(width: 2.w),
          const Text(AppStrings.OrContinue),
          SizedBox(width: 2.w),
          Container(
            height: 1.0,
            width: 30.0.w,
            color: ColorManager.black,
          ),
        ],
      ),
    );
  }

  Widget button({Function()? onTap, String? text, Color? color}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppSize.sizeWidth(context) * 0.06, vertical: 10.0),
      child: CustomeButton(
          text: text ?? "",
          style: TextStyle(color: ColorManager.white),
          onTap: onTap),
    );
  }

  Widget privacyPolicyText() {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: AppSize.sizeWidth(context) * 0.06),
      //width: Appsize.sizeWidth(context) * 0.7,
      child: RichText(
        text: TextSpan(
            text: AppStrings.byclickingSign,
            style: const TextStyle(
              color: Colors.black,
            ),
            children: <TextSpan>[
              TextSpan(
                  text: AppStrings.termofUse,
                  style: TextStyle(
                    color: ColorManager.primary,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {}),
              TextSpan(
                  text: ' & ',
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {}),
              TextSpan(
                  text: AppStrings.privacyPolicy,
                  style: TextStyle(color: ColorManager.primary),
                  recognizer: TapGestureRecognizer()..onTap = () {})
            ]),
      ),
    );
  }

  Widget title(String text, BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.only(
            left: AppSize.sizeWidth(context) * 0.06, bottom: 5.0),
        child: Text(
          text,
          textAlign: TextAlign.left,
          style: TextStyle(color: ColorManager.blue, fontSize: AppSize.s10.sp),
        ),
      ),
    );
  }

  Widget selectCountryField(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: AppSize.sizeWidth(context) * 0.07),
      child: IntlPhoneField(
        decoration: InputDecoration(
          hintStyle: TextStyle(color: ColorManager.grey, fontSize: 12.sp),
          hintText: AppStrings.phoneNumber,
          contentPadding: const EdgeInsets.fromLTRB(14, 14.0, 14.0, 14.0),
          filled: true,
          fillColor: ColorManager.white,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: ColorManager.black, width: 1.5)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                  color: ColorManager.black.withOpacity(0.2), width: 1.5)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: ColorManager.primary, width: 1.5)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: ColorManager.primary, width: 1.5)),
        ),
        initialCountryCode: 'US',
        onChanged: (phone) {
          print(phone.completeNumber);
        },
      ),
    );
  }

  Widget textspan(
      {String? text1,
      String? text2,
      BuildContext? context,
      Function()? onTap}) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p14, vertical: AppPadding.p10),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: text1,
          style: TextStyle(color: ColorManager.black, fontSize: AppSize.s16.sp),
          children: <TextSpan>[
            TextSpan(
                text: text2,
                style: TextStyle(
                    color: ColorManager.primary, fontSize: AppSize.s16.sp),
                recognizer: TapGestureRecognizer()..onTap = onTap)
          ],
        ),
      ),
    );
  }
}
