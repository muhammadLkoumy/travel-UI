import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:travel_app/cubit/travel_cubit.dart';
import 'package:travel_app/cubit/travel_states.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/pages/details_page.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    _tabController = TabController(length: 3, vsync: this);

    var images = {
      "balloning.png": "Balloning",
      "hiking.png": "Hiking",
      "kayaking.png": "Kayaking",
      "snorkling.png": "Snorkling",
    };

    return BlocBuilder<TravelCubit, TravelStates>(builder: (context, state) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: ConditionalBuilder(
          condition: TravelCubit.get(context).places.isNotEmpty,
          builder: (context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // menu
                Container(
                  padding: const EdgeInsets.only(top: 50, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.menu,
                        size: 30,
                        color: Colors.black,
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        width: 50,
                        height: 50,
                        margin: const EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage("assets/images/me.png"),
                            fit: BoxFit.cover,
                          ),
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                // Discover text
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: AppLargeText(txt: "Discover"),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Tab Bar
                Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    labelPadding: const EdgeInsets.only(left: 20, right: 20),
                    controller: _tabController,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    //indicator: CircleTabIndicator(color: AppColors.mainColor, radius: 4),
                    tabs: const [
                      Tab(text: "Places"),
                      Tab(text: "Inspiration"),
                      Tab(text: "Emotions"),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  height: 300,
                  width: double.infinity,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      ListView.builder(
                        itemCount: TravelCubit.get(context).places.length,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                    child: DetailsPage(
                                      index: index,
                                    ),
                                    type: PageTransitionType.rightToLeft,
                                  ));
                            },
                            child: Container(
                              margin: const EdgeInsets.only(top: 20, right: 15),
                              height: 300,
                              width: 200,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "http://mark.bslmeiyu.com/uploads/" +
                                          TravelCubit.get(context)
                                              .places[index]
                                              .img
                                              .toString()),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      const Center(child: Text('There')),
                      const Center(child: Text('Bye')),
                    ],
                  ),
                ),
                // Explore more
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppLargeText(
                        txt: "Explore more",
                        size: 22,
                      ),
                      AppText(
                        txt: "See more",
                        color: AppColors.textColor1,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  height: 100,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 30),
                          child: Column(
                            children: [
                              Container(
                                //margin: const EdgeInsets.only(right: 20),
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/" +
                                        images.keys.elementAt(index)),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              AppText(
                                txt: images.values.elementAt(index),
                                color: AppColors.textColor2,
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            );
          },
          fallback: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    });
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;

  const CircleTabIndicator({
    required this.color,
    required this.radius,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _DrawCircleIndicator(color: color, radius: radius);
  }
}

class _DrawCircleIndicator extends BoxPainter {
  final Color color;
  final double radius;

  const _DrawCircleIndicator({
    required this.color,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;

    offset = const Offset(10, 0);

    final Offset circleOffset = Offset(configuration.size!.width + 10 / 2, 0);

    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
