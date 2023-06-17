import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mindmystery/models/carouselSliderItem.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final List<CarouselSliderItem> items = [
  CarouselSliderItem(
    iconPath: "assets/images/home/carousel/wave.png",
    title: 'Welcome',
    description:
        'Welcome to MindMystery! Immerse yourself in a world of mysterious crime and solve thrilling cases with the help of AI. Are you ready to showcase your detective skills?',
    subtitle: 'Morpheus',
    buttonText: 'How to play?',
    action: () {},
    isButtonVisible: false,
    buttonColor: Colors.white,
    gradientColors: const [
      Color.fromARGB(255, 23, 25, 33),
      Color.fromARGB(255, 16, 17, 22)
    ],
  ),
  CarouselSliderItem(
    iconPath: "assets/images/home/carousel/list.png",
    title: 'Guideline',
    description:
        'Please read the guidelines for a fair and enjoyable gameplay experience in the thrilling world of MindMystery.',
    subtitle: 'To Help You',
    buttonText: 'Open Guideline',
    action: () {},
    isButtonVisible: true,
    buttonColor: const Color.fromARGB(255, 18, 16, 22),
    gradientColors: const [
      Color.fromARGB(255, 27, 23, 33),
      Color.fromARGB(255, 18, 16, 22)
    ],
  ),
  CarouselSliderItem(
    title: 'Join Discord',
    description:
        'Join our Discord community for thrilling investigations and connect with fellow detectives.',
    subtitle: 'Community',
    iconPath: "assets/images/home/carousel/discord.png",
    buttonText: 'Join Discord',
    action: () {},
    isButtonVisible: true,
    buttonColor: const Color.fromARGB(255, 22, 16, 20),
    gradientColors: const [
      Color.fromARGB(255, 33, 23, 29),
      Color.fromARGB(255, 22, 16, 20)
    ],
  ),
];

class _HomePageState extends State<HomePage> {
  CarouselController allCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Column(
        children: [
          Expanded(child: Container()),
          Stack(
              alignment: Alignment.centerRight,
              clipBehavior: Clip.none,
              children: <Widget>[
                CarouselSlider(
                    carouselController: allCarouselController,
                    items: items.map((item) {
                      return Builder(builder: (BuildContext context) {
                        return Container(
                          height: null,
                          //decoration: const BoxDecoration(color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: null,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            item.gradientColors[0],
                                            item.gradientColors[1]
                                          ],
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                item.title,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'JustSans',
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: width * 0.1 * 0.1,
                                              ),
                                              Image(
                                                width: 30,
                                                height: 30,
                                                image: Image(
                                                        image: AssetImage(
                                                            item.iconPath))
                                                    .image,
                                              )
                                            ],
                                          ),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              item.subtitle,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'JustSans',
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 15.0),
                                            child: Text(
                                              item.description,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'JustSans',
                                                  fontSize: 20,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                          ),
                                          if (item.isButtonVisible) ...[
                                            SizedBox(
                                              height: height * 0.1 * 0.1,
                                            ),
                                            Align(
                                              alignment: Alignment.bottomLeft,
                                              child: ElevatedButton(
                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty
                                                        .resolveWith((states) =>
                                                            RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10))),
                                                    backgroundColor:
                                                        MaterialStateColor
                                                            .resolveWith(
                                                                (states) => item
                                                                    .buttonColor)),
                                                onPressed: item.action,
                                                child: Text(
                                                  item.buttonText,
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: 'JustSans',
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            )
                                          ],
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                    }).toList(),
                    options: CarouselOptions(
                        scrollDirection: Axis.horizontal,
                        aspectRatio: 1.0,
                        viewportFraction: 0.8,
                        enlargeCenterPage: false,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        onPageChanged: (index, reason) {
                          allCarouselController.animateToPage(index);
                        },
                        enableInfiniteScroll: false)),
                Positioned(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        RotatedBox(
                          quarterTurns: 2,
                          child: IconButton.filled(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith(
                                          (states) => const Color.fromARGB(
                                                255,
                                                23,
                                                25,
                                                33,
                                              ))),
                              onPressed: () =>
                                  allCarouselController.previousPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.linear),
                              icon: ImageIcon(
                                const Image(
                                        image: AssetImage(
                                            "assets/images/home/arrows/right.png"))
                                    .image,
                              )),
                        ),
                        Expanded(child: Container()),
                        IconButton.filled(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty
                                    .resolveWith((states) =>
                                        const Color.fromARGB(255, 23, 25, 33))),
                            onPressed: () => allCarouselController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.linear),
                            icon: ImageIcon(
                              const Image(
                                      image: AssetImage(
                                          "assets/images/home/arrows/right.png"))
                                  .image,
                            )),
                      ],
                    ),
                  ),
                )
              ]),
          Expanded(child: Container()),
          Center(
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 52, 57, 75),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              ),
              onPressed: () {},
              child: const Text(
                'Play',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'JustSans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(child: Container()),
          Container(
              height: height * 0.076,
              width: width * 0.83,
              decoration: const BoxDecoration(
                  color: Color(0xff171921),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Expanded(
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Newest Update: ',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'JustSans',
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text:
                                      'AI communication skills improvement - Bug fixes',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'JustSans',
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal)),
                            ],
                          )),
                    )
                  ],
                ),
              )),
          SizedBox(
            height: height * 0.1 * 0.1,
          )
        ],
      ),
    );
  }
}
