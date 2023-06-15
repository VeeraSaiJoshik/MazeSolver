import 'package:flutter/material.dart';
import 'package:mindmystery/pages/homePage.dart';
import 'package:mindmystery/widgets/mainScreenSubScreen.dart';

enum DifferentPages { home, play, account, settings }

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => NavigationPageState();
}

class NavigationPageState extends State<NavigationPage> {
  @override
  late DifferentPages currentPage;
  void initState() {
    currentPage = DifferentPages.home;
    super.initState();
  }
  bool previousElementAnimationComplete = false;
  bool isAnimating = false;
  void onEnd(DifferentPages callingPageType){
    setState(() {
      if(callingPageType == currentPage){
        previousElementAnimationComplete = false;
      }else{
        previousElementAnimationComplete = true;
        isAnimating = false;
      }
    });
  }
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: height,
            width: width,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              const Color.fromARGB(255, 23, 25, 33),
              Color(0xFF000410),
              Color(0xFF000410),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          ),
          Positioned(
            left: 0,
            bottom: height * 0.1 * 1.35,
            child: Container(
              height: height - height * 0.1 * 1.35,
              width: width, 
              child: Stack(
                children: [
                  MainScreenSubScreen(HomePage(),height - height * 0.1 * 1.35,width, currentPage, DifferentPages.home, previousElementAnimationComplete,isAnimating, onEnd),
                  MainScreenSubScreen(Center(child: Text("Play Page", style: TextStyle(color: Colors.white),)),height - height * 0.1 * 1.35,width, currentPage, DifferentPages.play, previousElementAnimationComplete,isAnimating, onEnd),
                  MainScreenSubScreen(Center(child: Text("Account Page", style: TextStyle(color: Colors.white),)),height - height * 0.1 * 1.35,width, currentPage, DifferentPages.account, previousElementAnimationComplete,isAnimating, onEnd),
                  MainScreenSubScreen(Center(child: Text("Setting Page", style: TextStyle(color: Colors.white),)),height - height * 0.1 * 1.35,width, currentPage, DifferentPages.settings, previousElementAnimationComplete,isAnimating, onEnd),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
                height: height * 0.1,
                width: width,
                child: Stack(
                  children: [
                    Positioned(
                      left: width * 0.116,
                      height: height * 0.1 * 0.55,
                      child: Container(
                        width: width - width * (0.116 * 2),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                if(currentPage != DifferentPages.home){
                                  setState(() {
                                    currentPage = DifferentPages.home;
                                    isAnimating = true;
                                  });
                                }
                              },
                              child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 350),
                                  height: height * 0.1 * 0.55,
                                  width: height * 0.1 * 0.55 / 38 * 36,
                                  decoration: BoxDecoration(
                                      color: currentPage == DifferentPages.home
                                          ? Color(0xFF171920)
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(7)),
                                  child: Container(
                                    padding: EdgeInsets.all(height * 0.014),
                                    child: FittedBox(
                                      fit: BoxFit.cover,
                                      child: Stack(
                                        children: [
                                          AnimatedOpacity(
                                            opacity: currentPage ==
                                                    DifferentPages.home
                                                ? 1
                                                : 0,
                                            duration:
                                                Duration(milliseconds: 350),
                                            child: Image.asset(
                                                "assets/images/home/navigationLight/home.png"),
                                          ),
                                          AnimatedOpacity(
                                            opacity: currentPage ==
                                                    DifferentPages.home
                                                ? 0
                                                : 1,
                                            duration:
                                                Duration(milliseconds: 350),
                                            child: Image.asset(
                                                "assets/images/home/navigationDark/home.png"),
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                            ),
                            Expanded(child: Container()),
                            InkWell(
                              onTap: () {
                               if(currentPage != DifferentPages.play){
                                  setState(() {
                                    currentPage = DifferentPages.play;
                                    isAnimating = true;
                                  });
                                }
                              },
                              child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 350),
                                  height: height * 0.1 * 0.55,
                                  width: height * 0.1 * 0.55 / 38 * 36,
                                  decoration: BoxDecoration(
                                      color: currentPage == DifferentPages.play
                                          ? Color(0xFF171920)
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(7)),
                                  child: Container(
                                    padding: EdgeInsets.all(height * 0.014),
                                    child: FittedBox(
                                      fit: BoxFit.cover,
                                      child: Stack(
                                        children: [
                                          AnimatedOpacity(
                                            opacity: currentPage ==
                                                    DifferentPages.play
                                                ? 1
                                                : 0,
                                            duration:
                                                Duration(milliseconds: 350),
                                            child: Image.asset(
                                                "assets/images/home/navigationLight/compass.png"),
                                          ),
                                          AnimatedOpacity(
                                            opacity: currentPage ==
                                                    DifferentPages.play
                                                ? 0
                                                : 1,
                                            duration:
                                                Duration(milliseconds: 350),
                                            child: Image.asset(
                                                "assets/images/home/navigationDark/compass.png"),
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                            ),
                            Expanded(child: Container()),
                            InkWell(
                              onTap: () {
                                if(currentPage != DifferentPages.account){
                                  setState(() {
                                    currentPage = DifferentPages.account;
                                    isAnimating = true;
                                  });
                                }
                              },
                              child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 350),
                                  height: height * 0.1 * 0.55,
                                  width: height * 0.1 * 0.55 / 38 * 36,
                                  decoration: BoxDecoration(
                                      color:
                                          currentPage == DifferentPages.account
                                              ? Color(0xFF171920)
                                              : Colors.transparent,
                                      borderRadius: BorderRadius.circular(7)),
                                  child: Container(
                                    padding: EdgeInsets.all(height * 0.013),
                                    child: FittedBox(
                                      fit: BoxFit.cover,
                                      child: Stack(
                                        children: [
                                          AnimatedOpacity(
                                            opacity: currentPage ==
                                                    DifferentPages.account
                                                ? 1
                                                : 0,
                                            duration:
                                                Duration(milliseconds: 350),
                                            child: Image.asset(
                                                "assets/images/home/navigationLight/people.png"),
                                          ),
                                          AnimatedOpacity(
                                            opacity: currentPage ==
                                                    DifferentPages.account
                                                ? 0
                                                : 1,
                                            duration:
                                                Duration(milliseconds: 350),
                                            child: Image.asset(
                                                "assets/images/home/navigationDark/people.png"),
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                            ),
                            Expanded(child: Container()),
                            InkWell(
                              onTap: () {
                                if(currentPage != DifferentPages.settings){
                                  setState(() {
                                    currentPage = DifferentPages.settings;
                                    isAnimating = true;
                                  });
                                }
                              },
                              child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 350),
                                  height: height * 0.1 * 0.55,
                                  width: height * 0.1 * 0.55 / 38 * 36,
                                  decoration: BoxDecoration(
                                      color:
                                          currentPage == DifferentPages.settings
                                              ? Color(0xFF171920)
                                              : Colors.transparent,
                                      borderRadius: BorderRadius.circular(7)),
                                  child: Container(
                                    padding: EdgeInsets.all(height * 0.0145),
                                    child: FittedBox(
                                      fit: BoxFit.cover,
                                      child: Stack(
                                        children: [
                                          AnimatedOpacity(
                                            opacity: currentPage ==
                                                    DifferentPages.settings
                                                ? 1
                                                : 0,
                                            duration:
                                                Duration(milliseconds: 350),
                                            child: Image.asset(
                                                "assets/images/home/navigationLight/settings.png"),
                                          ),
                                          AnimatedOpacity(
                                            opacity: currentPage ==
                                                    DifferentPages.settings
                                                ? 0
                                                : 1,
                                            duration:
                                                Duration(milliseconds: 350),
                                            child: Image.asset(
                                                "assets/images/home/navigationDark/settings.png"),
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
//313548