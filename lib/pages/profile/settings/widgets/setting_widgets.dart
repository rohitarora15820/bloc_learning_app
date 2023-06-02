import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/entities/values/colors.dart';

AppBar buildSettingAppBar() {
  return AppBar(
    title:  Container(
      child: Text("Settings",style: TextStyle(color: AppColors.primaryText,
      fontWeight: FontWeight.bold,
      fontSize: 16.sp
      ),),
    ),
  );
}


Widget settingButton(BuildContext context,Function()? function){
  return   GestureDetector(
                onTap: (){
                  showDialog(context: context, builder: (context) {
                    return AlertDialog(
                      title: Text("Confirm Logout"),
                      content: Text("Are you sure you want to log out?"),
                      actions: [
                        TextButton(onPressed: ()=>Navigator.of(context).pop(), child: Text("Cancel"),),
                       TextButton(onPressed:function, child: Text("Confirm"),),
                      ],
                    );
                  },);
                },
                child: Container(
                  height: 100.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/icons/Logout.png"))
                  ),
                ),
              );
            

}
