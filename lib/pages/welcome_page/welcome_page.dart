import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:travel_app/cubit/travel_cubit.dart';
import 'package:travel_app/cubit/travel_states.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/pages/home_page.dart';
import 'package:travel_app/widgets/responsive_button.dart';

import '../../widgets/app_large_text.dart';
import '../../widgets/app_text.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({Key? key}) : super(key: key);

  final List images = [
    'assets/images/welcome-one.png',
    'assets/images/welcome-two.png',
    'assets/images/welcome-three.png',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TravelCubit, TravelStates>(builder: (context, state) {
      return Scaffold(
        body: PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(images[index]),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.only(top: 100, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppLargeText(txt: 'Trips'),
                          AppText(txt: 'Mountain', size: 30),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 240,
                            child: AppText(
                              size: 14,
                              color: AppColors.textColor2,
                              txt:
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the",
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          InkWell(
                            onTap: (){
                              TravelCubit.get(context).getData();
                            },
                            child: InkWell(
                              onTap: (){
                                Navigator.push(context, PageTransition(child: const HomePage(), type: PageTransitionType.rightToLeft));
                              },
                              child: ResponsiveButton(
                                width: 120,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: List.generate(3, (dotsIndex) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 2),
                            height: dotsIndex == index ?25:8,
                            width: 8,
                            decoration: BoxDecoration(
                              color: dotsIndex == index ? AppColors.mainColor : AppColors.mainColor.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              );
            }),
      );
    });
  }
}
