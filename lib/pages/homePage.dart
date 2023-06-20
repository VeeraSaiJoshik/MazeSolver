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
  double leftOpacity = 0;
  double rightOpacity = 1;
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          Expanded(child: Container()),
          Stack(
              alignment: Alignment.centerRight,
              clipBehavior: Clip.none,
              children: <Widget>[
                CarouselSlider(
                  carouselController: allCarouselController,
                  options: CarouselOptions(
                      enlargeCenterPage: true,
                      height: height * 0.48,
                      enableInfiniteScroll: false,
                      viewportFraction: 0.75,
                      onPageChanged: (index, d) {
                        setState(() {
                          currentPageIndex = index;
                        });
                        if (index == 0) {
                          setState(() {
                            leftOpacity = 0;
                            rightOpacity = 1;
                          });
                        } else if (index == 1) {
                          setState(() {
                            leftOpacity = 1;
                            rightOpacity = 1;
                          });
                        } else {
                          setState(() {
                            leftOpacity = 1;
                            rightOpacity = 0;
                          });
                        }
                      },
                      aspectRatio: 2.0,
                      initialPage: 0,
                      animateToClosest: true,
                      scrollPhysics: const BouncingScrollPhysics()),
                  items: items.map((item) {
                    return Builder(builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        height: height * 0.48,
                        margin: EdgeInsets.symmetric(horizontal: width * 0.01),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                height: null,
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
                                  padding: EdgeInsets.only(
                                    left: width * 0.08,
                                    right: width * 0.07,
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: height * 0.04,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            height: height * 0.05,
                                            width: item.title == "Join Discord"
                                                ? width * 0.48
                                                : null,
                                            child: FittedBox(
                                              fit: item.title == "Join Discord"
                                                  ? BoxFit.fitWidth
                                                  : BoxFit.fitHeight,
                                              child: Text(
                                                item.title,
                                                textAlign: TextAlign.left,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'JustSans',
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          item.title == "Join Discord"
                                              ? Expanded(child: Container())
                                              : Container(width: width * 0.02),
                                          Image(
                                            width: height * 0.035,
                                            height: height * 0.035,
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
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'ArgentumSans',
                                              fontSize: MediaQuery.of(context)
                                                      .textScaleFactor *
                                                  20,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.02,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 15.0),
                                        child: Text(
                                          item.description,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'JustSans',
                                              fontSize: MediaQuery.of(context)
                                                      .textScaleFactor *
                                                  18,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                      if (item.isButtonVisible) ...[
                                        Expanded(child: Container()),
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
                                                        .resolveWith((states) =>
                                                            item.buttonColor)),
                                            onPressed: item.action,
                                            child: Text(
                                              item.buttonText,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'JustSans',
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: height * 0.04,
                                        )
                                      ],
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    });
                  }).toList(),
                ),
                Positioned(
                  child: Padding(
                    padding: EdgeInsets.all(width * 0.05),
                    child: Row(
                      children: [
                        AnimatedOpacity(
                          opacity: leftOpacity,
                          duration: const Duration(milliseconds: 150),
                          child: InkWell(
                            onTap: () {
                              if (currentPageIndex != 0) {
                                allCarouselController.previousPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut);
                              }
                            },
                            child: Ink(
                              color: Colors.blue,
                              height: height * 0.06,
                              width: height * 0.06,
                              child: RotatedBox(
                                quarterTurns: 2,
                                child: Container(
                                  height: height * 0.06,
                                  width: height * 0.06,
                                  decoration: BoxDecoration(
                                      color: currentPageIndex == 0
                                          ? const Color(0xff171921)
                                          : currentPageIndex == 1
                                              ? const Color(0xff1B1721)
                                              : const Color(0xff21171D),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Color.fromARGB(64, 0, 0, 0),
                                            blurRadius: 5)
                                      ],
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Padding(
                                      padding: EdgeInsets.all(height * 0.017),
                                      child: FittedBox(
                                          fit: BoxFit.cover,
                                          child: Image.asset(
                                              "assets/images/home/arrows/right.png"))),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(child: Container()),
                        AnimatedOpacity(
                          opacity: rightOpacity,
                          duration: const Duration(milliseconds: 150),
                          child: InkWell(
                            onTap: () {
                              if (currentPageIndex != 2) {
                                allCarouselController.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut);
                              }
                            },
                            child: RotatedBox(
                              quarterTurns: 0,
                              child: Container(
                                height: height * 0.06,
                                width: height * 0.06,
                                decoration: BoxDecoration(
                                    color: currentPageIndex == 0
                                        ? const Color(0xff171921)
                                        : currentPageIndex == 1
                                            ? const Color(0xff1B1721)
                                            : const Color(0xff21171D),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Color.fromARGB(64, 0, 0, 0),
                                          blurRadius: 5)
                                    ],
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15))),
                                child: Padding(
                                    padding: EdgeInsets.all(height * 0.017),
                                    child: FittedBox(
                                        fit: BoxFit.cover,
                                        child: Image.asset(
                                            "assets/images/home/arrows/right.png"))),
                              ),
                            ),
                          ),
                        ),
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
          SizedBox(
            height: height * 0.02,
          ),
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
        ],
      ),
    );
  }
}
