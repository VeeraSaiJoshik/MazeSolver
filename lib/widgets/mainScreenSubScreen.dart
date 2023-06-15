import 'package:flutter/material.dart';
import 'package:mindmystery/pages/homePage.dart';


class MainScreenSubScreen extends StatefulWidget {
  Widget child;
  double height;
  double width;
  DifferentPages currentPage;
  DifferentPages childPage;
  bool previousWidgetFadedout;
  bool animationInProgress;
  Function onEndFunction;
  MainScreenSubScreen(this.child, this.height, this.width, this.currentPage, this.childPage, this.previousWidgetFadedout, this.animationInProgress, this.onEndFunction);
  State<MainScreenSubScreen> createState() => _MainScreenSubScreenState();
}

class _MainScreenSubScreenState extends State<MainScreenSubScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: widget.animationInProgress ? widget.childPage == widget.currentPage && widget.previousWidgetFadedout? 1 : 0 : widget.childPage == widget.currentPage?1:0,
      onEnd: (){
        widget.onEndFunction(widget.childPage);
      },
      duration: Duration(milliseconds: 100),
      child: Container(
        height: widget.height, 
        width: widget.width,
        child: widget.child,
      ),
    );
  }
}