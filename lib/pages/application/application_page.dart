import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/entities/values/colors.dart';
import 'package:learning_app/pages/application/application_widget.dart';
import 'package:learning_app/pages/application/bloc/app_bloc.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc,AppState>(builder: (context, state) {
      return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
        body: buildPage(state.index),
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
            currentIndex: state.index,
            onTap: (value) {
             

            context.read<AppBloc>().add(TriggerAppEvent(value));
            },
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: AppColors.primaryElement,
            unselectedItemColor: AppColors.primaryFourElementText,
            items: bottomTabs),
      
        )
      )),
    );
      
    },);
  }
}
