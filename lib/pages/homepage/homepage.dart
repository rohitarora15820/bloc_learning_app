import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/pages/homepage/bloc/home_page_blocs.dart';
import 'package:learning_app/pages/homepage/bloc/home_page_states.dart';
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
        body: BlocBuilder<HomePageBlocs, HomePageStates>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: homePageText("Hello,",
                        color: AppColors.primaryThirdElementText, top: 20),
                  ),
                  SliverToBoxAdapter(
                    child: homePageText("Rohit Arora,",
                        color: AppColors.primaryText, top: 5),
                  ),
                  SliverPadding(padding: EdgeInsets.only(top: 20.h)),
                  SliverToBoxAdapter(
                    child: searchView(),
                  ),
                  SliverToBoxAdapter(
                    child: slidersView(context, state),
                  ),
                  SliverToBoxAdapter(
                    child: menuView(),
                  ),
                  SliverPadding(
                      padding:
                          EdgeInsets.symmetric(vertical: 18.h, horizontal: 0.w),
                      sliver: SliverGrid(
                          delegate: SliverChildBuilderDelegate(childCount: 4,
                              (context, index) {
                            return GestureDetector(
                              onTap: (){},
                              child: courseGrid()
                            );
                          }),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 15,
                                  crossAxisSpacing: 15,
                                  childAspectRatio: 1.6
                                  ))),
                ],
              ),
            );
          },
        ));
  }
}
