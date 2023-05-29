import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/pages/homepage/widgets/home_page_widgets.dart';

import '../../common/entities/values/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            homePageText("Hello,",
                color: AppColors.primaryThirdElementText, top: 20),
            homePageText("Rohit Arora,", color: AppColors.primaryText, top: 5),
            SizedBox(height: 20.h,),
            searchView(),
            menuView()
          ],
        ),
      ),
    );
  }
}