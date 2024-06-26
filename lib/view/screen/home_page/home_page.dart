import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/app/bloc/app_bloc.dart';
import 'package:flutter_base/app/bloc/app_state.dart';
import 'package:flutter_base/config/router/main_router.route.dart';
import 'package:flutter_base/core/core.dart';
import 'package:flutter_base/view/screen/home_page/cubit/home_page_cubit.dart';
import 'package:flutter_base/view/screen/home_page/cubit/home_page_state.dart';
import 'package:flutter_base/view/screen/home_page/widget/appbar_home_widget.dart';
import 'package:flutter_base/view/screen/home_page/widget/receiver_widget.dart';
import 'package:flutter_base/view/screen/home_page/widget/shift_home_widget.dart';
import 'package:flutter_base/view/screen/home_page/widget/suggest_new_shift_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageCubit()..getUrlArt(),
      child: const HomePageView(),
    );
  }
}

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          height: context.screenHeight,
          width: context.screenWidth,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: '#F5F5F5'.toColor,
              body: RefreshIndicator(
                color: Colors.grey.shade600,
                backgroundColor: Colors.white,
                onRefresh: () async {
                  // ignore: inference_failure_on_instance_creation
                  await Future.delayed(const Duration(seconds: 2));
                },
                child: Column(
                  children: [
                    const AppBarHomeWidget(),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListView(
                          physics: const ClampingScrollPhysics(),
                          children: [
                            const ReceiverWidget(),
                            const SizedBox(height: 16),
                            Container(
                              width: context.screenWidth,
                              height: context.screenWidth * 0.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.shade400,
                              ),
                            ),
                            const SizedBox(height: 16),
                            const ShiftHomeWidget(),
                            const SizedBox(height: 16),
                            const SuggestNewShiftWidget(),
                            const SizedBox(height: 16),
                            Container(
                              width: context.screenWidth,
                              height: context.screenWidth * 0.2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.shade400,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              width: context.screenWidth,
                              height: context.screenWidth * 0.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.shade400,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              width: context.screenWidth,
                              height: context.screenWidth * 0.2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.shade400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
