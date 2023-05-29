import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/entities/values/colors.dart';

AppBar buildAppBar(String type) {
  return AppBar(
    bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: AppColors.primarySecondaryBackground,
          height: 1.0,
        )),
    elevation: 0,
    centerTitle: true,
    title: Text(
      type,
      style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal),
    ),
  );
}

//need context for accessing bloc
Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
      margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
      padding: EdgeInsets.only(left: 50.w,right: 50.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          resuableIcons('google'),
          resuableIcons('apple'),
          resuableIcons('facebook')
        ],
      ));
}

Widget resuableIcons(String iconName) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      width: 40.w,
      height: 40.w,
      child: Image.asset('assets/icons/$iconName.png'),
    ),
  );
}

Widget resuableText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(
          color: Colors.grey.withOpacity(0.5),
          fontWeight: FontWeight.bold,
          fontSize: 14.sp),
    ),
  );
}

Widget buidTextField(String text, String textType, String iconName,void Function(String value)? ftn) {
  return Container(
      width: 325.w,
      height: 50.h,
      margin: EdgeInsets.only(bottom: 20.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.w)),
          border: Border.all(color: AppColors.primaryFourElementText)),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 17.w),
            width: 16.w,
            height: 16.w,
            child: Image.asset('assets/icons/$iconName.png'),
          ),
          SizedBox(
            width: 270.w,
            height: 50.h,
            child: TextField(
              onChanged:(value) =>  ftn!(value),
              autocorrect: false,
              obscureText: textType == "password" ? true : false,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  hintText: text,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  hintStyle: const TextStyle(color: AppColors.primarySecondaryElementText)),
              style: TextStyle(
                  color:AppColors.primaryText,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.normal,
                  fontSize: 14.sp),
            ),
          )
        ],
      ));
}

Widget forgotPassword() {
  return Container(
    margin: EdgeInsets.only(left: 25.w),
    width: 260.w,
    height: 44.h,
    child: GestureDetector(
      onTap: () {},
      child: Text(
        "Forgot Password?",
        style: TextStyle(
            decoration: TextDecoration.underline,
            decorationColor: AppColors.primaryText,
            fontSize: 12.sp,
            color:AppColors.primaryText),
      ),
    ),
  );
}

Widget buildLoginAndRegisterbtn(String btnName, String btnType,void Function()? ftn) {
  return GestureDetector(
    onTap:  ftn,
    child: Container(
      margin: EdgeInsets.only(
          left: 25.w, right: 25.w, top: btnType == "login" ? 40.h : 20.h),
      width: 325.w,
      height: 50.h,
      decoration: BoxDecoration(
          color: btnType == "login"
              ? AppColors.primaryElement
              : AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(15.w),
          border: Border.all(
              color: btnType == "login"
                  ? Colors.transparent
                  : AppColors.primaryFourElementText),
          boxShadow: [
            BoxShadow(
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 1),
                color: Colors.grey.withOpacity(0.1))
          ]),
      child: Center(
        child: Text(
          btnName,
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
              color: btnType == "login"
                  ? AppColors.primaryBackground
                  : AppColors.primaryText),
        ),
      ),
    ),
  );
}
