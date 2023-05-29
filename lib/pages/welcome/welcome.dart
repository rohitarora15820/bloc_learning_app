import 'dart:developer';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/entities/values/constants.dart';
import 'package:learning_app/global.dart';

import 'package:learning_app/pages/welcome/bloc/welcome_events.dart';
import 'package:learning_app/pages/welcome/bloc/welcomee_bloc.dart';

import '../../common/entities/values/colors.dart';
import 'bloc/welcome_states.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(body: BlocBuilder<WelcomeBloc, WelcomeState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(top: 34.h),
            width: 375.w,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView(
                  controller: pageController,
                  onPageChanged: (value) {
                    state.page = value;
                    BlocProvider.of<WelcomeBloc>(context).add(WelcomEvent());
                  },
                  children: [
                    _page(
                        1,
                        context,
                        "First See Learning",
                        "Forget about a for of paper all knowledge in one learning",
                        "assets/images/reading.png",
                        "Next",
                        pageController),
                    _page(
                        2,
                        context,
                        "Connect Wit Everyone",
                        "Always keep in touch with your tutor & friend. Let's get connected",
                        "assets/images/boy.png",
                        "Next",
                        pageController),
                    _page(
                        3,
                        context,
                        "Always Facinated Learning",
                        "Anywhere, anytime.The time is at our discrtion so study whenever you want",
                        "assets/images/man.png",
                        "Get Started",
                        pageController),
                  ],
                ),
                Positioned(
                  bottom: 100.h,
                  child: DotsIndicator(
                    position: state.page,
                    dotsCount: 3,
                    mainAxisAlignment: MainAxisAlignment.center,
                    decorator: DotsDecorator(
                        activeColor: AppColors.primaryElement,
                        color: AppColors.primaryThirdElementText,
                        size: const Size.square(8.0),
                        activeSize: const Size(18, 8),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
              ],
            ),
          );
        },
      )),
    );
  }
}

Widget _page(int index, BuildContext context, String title, String subtitle,
    String imagePath, String buttonName, PageController controller) {
  return Column(
    children: [
      SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          )),
      SizedBox(
        child: Text(
          title,
          style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 24.sp,
              fontWeight: FontWeight.normal),
        ),
      ),
      Container(
        width: 375.w,
        padding: EdgeInsets.only(left: 30.w, right: 30.w),
        child: Text(
          subtitle,
          style: TextStyle(
              color: AppColors.primarySecondaryElementText,
              fontSize: 14.sp,
              fontWeight: FontWeight.normal),
        ),
      ),
      GestureDetector(
        onTap: () {
          if (index < 3) {
            //animate
            controller.animateToPage(index,
                duration: const Duration(milliseconds: 1000),
                curve: Curves.easeIn);
          } else {
            //jump to new page
            Global.storageServices.setBool(AppContatnts.STORAGE_DEVICE_FIRST_OPEN, true);
            log(Global.storageServices.getDeviceFirstOpen().toString());

            Navigator.of(context).pushNamedAndRemoveUntil("/sign_in", (route) => false);
          }
        },
        child: Container(
          margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
          width: 325.w,
          height: 50.h,
          decoration: BoxDecoration(
              color: AppColors.primaryElement,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 1))
              ],
              borderRadius: BorderRadius.all(Radius.circular(15.w))),
          child: Center(
            child: Text(buttonName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal)),
          ),
        ),
      )
    ],
  );
}
