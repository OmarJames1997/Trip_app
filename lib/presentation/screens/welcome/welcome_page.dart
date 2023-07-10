import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trip_app_cubit/constants/colors.dart';
import 'package:trip_app_cubit/cubit/app_cubit.dart';
import 'package:trip_app_cubit/presentation/components/responsive_button.dart';
import 'package:trip_app_cubit/presentation/components/text_components.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  /// List for Every variable to replace in the page view
  List images = [
    'welcome_1.jpeg',
    'welcome_2.jpeg',
    'welcome_3.jpg',
  ];
  List text = ['Travel', 'Anywhere', 'You want'];
  List subTexts = [
    'Discover the ancient wonders of Luxor, where history comes alive through magnificent temples and captivating archaeological sites',
    'Experience the lifeblood of Egypt as you embark on a journey along the majestic Nile River, immersing yourself in breathtaking landscapes and timeless cultural heritage.',
    'Uncover the natural beauty and spiritual tranquility of Sinai, a captivating land where pristine beaches, rugged mountains, and ancient landmarks converge to create a unique oasis of serenity.'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (
            // The _ Refers to the Current Context
            _,
            index,
          ) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/' + images[index]),
                    opacity: 50
              )),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextBoldComp(text: 'Trips', color: Color(purble)),
                        TextNormalComp(
                          text: text[index],
                          color: Colors.black,
                          size: 20,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Container(
                          width: 250,
                          child: TextNormalComp(
                            text: subTexts[index],
                            color: Colors.black,
                            size: 15,
                          ),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        GestureDetector(
                          onTap: (){
                            AppCubit.get(context).getData();
                          },
                          child: Container(
                            width: 100,
                            child: Row(
                              children: [
                                ResponseiveButton(
                                  width: 90,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: List.generate(
                          3,
                          (indexDots) => Container(
                                margin: const EdgeInsets.only(bottom: 3),
                                width: 8,
                                height: index == indexDots ? 25 : 8,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: index == indexDots
                                        ? Color(purble)
                                        : Color(purble).withOpacity(0.5)),
                              )),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
