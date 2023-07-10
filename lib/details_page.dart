import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_app_cubit/constants/colors.dart';
import 'package:trip_app_cubit/cubit/app_cubit.dart';
import 'package:trip_app_cubit/cubit/app_states.dart';
import 'package:trip_app_cubit/presentation/components/app_buttons.dart';
import 'package:trip_app_cubit/presentation/components/text_components.dart';

import 'presentation/components/responsive_button.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int selectedStars = 3;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit,AppStates>(
      builder: (context, state) {
        DetailState detail = state as DetailState;
      return Scaffold(
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          // Any Stack Should have a specific height and width
          child: Stack(
            children: [
              Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: 350,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage('http://mark.bslmeiyu.com/uploads/'+detail.place.img),
                          fit: BoxFit.cover),
                    ),
                  )),
              Positioned(
                  top: 70,
                  left: 20,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          AppCubit.get(context).goHome();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                        ),
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 280,
                      ),
                      IconButton(
                        onPressed: () {

                        },
                        icon: const Icon(
                          Icons.settings,
                        ),
                        color: Colors.white,
                      ),
                    ],
                  )),
              Positioned(
                  top: 320,
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                    // as we are splitting the screen
                    width: MediaQuery.of(context).size.width,
                    height: 450,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          topLeft: Radius.circular(25),
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Place name and Cost
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextBoldComp(
                                text: detail.place.name,
                                color: Colors.black.withOpacity(0.8)),
                            TextBoldComp(
                              text: '\$' + detail.place.price.toString(),
                              color: Color(purble),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // Location
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Color(purble),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            TextNormalComp(
                              text: detail.place.location,
                              color: Color(purble2),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // Rating stars & numbers
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(
                                  5,
                                      (index) => Icon(
                                    Icons.star,
                                    color: index < detail.place.stars
                                        ? Color(boldColor)
                                        : normalTexts,
                                  )),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            TextNormalComp(
                              size: 17,
                              text: '5.0',
                              color: normalTexts,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        TextBoldComp(
                            text: 'People',
                            color: Colors.black.withOpacity(0.8),
                            size: 20),
                        const SizedBox(height: 5),
                        TextNormalComp(
                          text: 'Number of people in your Group ',
                          color: normalTexts,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // Number of people in the trips ( Responsive )
                        Wrap(
                            children: List.generate(5, (index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  child: AppButton(
                                      text: (index + 1).toString(),
                                      size: 50,
                                      color: selectedIndex == index
                                          ? Colors.white
                                          : Colors.black,
                                      backgroundColor: selectedIndex == index
                                          ? Colors.black
                                          : buttonBackgroundColor,
                                      borderColor: selectedIndex == index
                                          ? Colors.black
                                          : buttonBackgroundColor),
                                ),
                              );
                            })),
                        const SizedBox(
                          height: 10,
                        ),
                        TextBoldComp(
                          text: 'Description',
                          color: Colors.black.withOpacity(0.8),
                          size: 20,
                        ),
                        TextNormalComp(
                          text:detail.place.description,
                          color: normalTexts,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  )),
              // Fav Button and Booking Button
              Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: [
                      AppButton(
                        size: 50,
                        color: normalTexts,
                        backgroundColor: Colors.white,
                        borderColor: normalTexts,
                        isIcon: true,
                        icon: Icons.favorite_border_outlined,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ResponseiveButton(
                        isResponse: true,
                      ),
                    ],
                  )),
            ],
          ),
        ),
      );
    },);
  }
}
