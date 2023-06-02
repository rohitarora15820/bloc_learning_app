import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/entities/values/constants.dart';
import 'package:learning_app/common/routes/name.dart';
import 'package:learning_app/global.dart';
import 'package:learning_app/pages/profile/settings/widgets/setting_widgets.dart';

import 'bloc/setting_bloc.dart';



class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  void removeUserDataAndLogout (){
 Global.storageServices.remove(AppContatnts.STORAGE_USER_TOKEN_KEY);
                        Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.SIGN_IN, (route) => false);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildSettingAppBar(),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingBloc,SettingState>(builder: (context, state) {
          return Container(
          child: Column(
            children: [
            settingButton(context, removeUserDataAndLogout)
            ],
          ),
        );
          
        },)
      ),
    );
  }
}