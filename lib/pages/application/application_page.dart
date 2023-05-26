import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/entities/values/colors.dart';
import 'package:learning_app/pages/application/application_widget.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
        body: buildPage(_index),
        bottomNavigationBar: Container(
          width: 375.w,
          height: 58.h,
          decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.h),
              topRight: Radius.circular(20.h)
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 1,
                spreadRadius: 1,
                color: Colors.grey.withOpacity(0.1),
                
              )
            ],
            
          ),
          child: BottomNavigationBar(
            currentIndex: _index,
            onTap: (value) {
              setState(() {
                _index = value;
              });
            },
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: AppColors.primaryElement,
            unselectedItemColor: AppColors.primaryFourElementText,
            items: [
              BottomNavigationBarItem(
                label: "Home",
                icon: SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset('assets/icons/home.png'),
                ),
                activeIcon: SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset(
                    'assets/icons/home.png',
                    color: AppColors.primaryElement,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: "Search",
                icon: SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset('assets/icons/search2.png'),
                ),
                activeIcon: SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset(
                    'assets/icons/search2.png',
                    color: AppColors.primaryElement,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: "Course",
                icon: SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset('assets/icons/play-circle1.png'),
                ),
                activeIcon: SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset(
                    'assets/icons/play-circle1.png',
                    color: AppColors.primaryElement,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: "Chat",
                icon: SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset('assets/icons/message-circle.png'),
                ),
                activeIcon: SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset(
                    'assets/icons/message-circle.png',
                    color: AppColors.primaryElement,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: "Profile",
                icon: SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset('assets/icons/person2.png'),
                ),
                activeIcon: SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset(
                    'assets/icons/person2.png',
                    color: AppColors.primaryElement,
                  ),
                ),
              )
            ]),
      
        )
      )),
    );
  }
}
