import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_app_cubit/constants/colors.dart';
import 'package:trip_app_cubit/cubit/app_cubit.dart';
import 'package:trip_app_cubit/cubit/app_states.dart';
import 'package:trip_app_cubit/presentation/components/text_components.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var image={
    'balloning.png':'Balloning',
    'hiking.jpg':'Hiking',
    'kayaking.png':'Kayaking',
    'Snokrling.png':'Snokrling'
  };

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: BlocBuilder<AppCubit,AppStates> (
        builder: (context, state) {
          if(state is LoadedState){
            var info =state.places;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// menu Text
                Container(
                  padding: const EdgeInsets.only(top: 70, left: 20),
                  child: Row(
                    children: [
                      Icon(Icons.menu, size: 30, color: Color(purble)),
                      Expanded(child: Container()),
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(purble)),
                        width: 50,
                        height: 50,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),

                /// Discover Text
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: TextBoldComp(
                    text: 'Discover',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),

                /// Tab Bar
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      labelPadding: const EdgeInsets.only(left: 20, right: 20),
                      controller: _tabController,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: _CircelTabIndicator(color: Color(purble), radius: 4),
                      tabs: const [
                        Tab(
                          text: 'Places',
                        ),
                        Tab(
                          text: 'Inspirations',
                        ),
                        Tab(
                          text: 'Emotions',
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  height: 300,
                  width: double.infinity,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      ListView.builder(
                        itemCount: info.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap:(){
                              AppCubit.get(context).detailPage(info[index]);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 15, top: 10),
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                image:  DecorationImage(
                                    invertColors: false,
                                    fit: BoxFit.cover,
                                    image: NetworkImage('http://mark.bslmeiyu.com/uploads/'+info[index].img)),
                              ),
                            ),
                          );
                        },
                      ),
                      const Tab(text: 'Inspirations'),
                      const Tab(text: 'Emotions'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextBoldComp(
                        text: 'Explore More',
                        size: 22,
                      ),
                      TextNormalComp(
                        text: 'See All',
                        color: Color(purble),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: ListView.builder(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 40),
                            child: Column(
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    image:  DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          'assets/images/'+image.keys.elementAt(index),
                                        )),
                                  ),
                                ),
                                const SizedBox(
                                  height:20,
                                ),
                                Container(
                                  child: TextNormalComp(text: image.values.elementAt(index),color: Colors.black87),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ),
              ],
            );
          }
          else{
            return Container();
          }
        },
      ),
    );
  }
}

/// Methods for the Indicator
class _CircelTabIndicator extends Decoration {
  final Color color;
  double radius;

  _CircelTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePaint(color: color, radius: radius);
  }
}

class _CirclePaint extends BoxPainter {
  final Color color;
  double radius;

  _CirclePaint({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;

    final Offset _circleOffset = Offset(

        /// for making the circle has a specific width and height
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);

    canvas.drawCircle(offset + _circleOffset, radius, _paint);
  }
}
