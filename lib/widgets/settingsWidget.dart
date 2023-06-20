import 'package:flutter/material.dart';

class SettingsWidget extends StatefulWidget {
  String icon;
  String text;
  bool hasSwitch;
  SettingsWidget(this.icon, this.text, this.hasSwitch);

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.07,
      width: width * 0.87,
      decoration: const BoxDecoration(
        color: Color(0xff34394B), 
        borderRadius: BorderRadius.all(
          Radius.circular(12)
        )
      ),
      child: Row(
        children: [
          Container(
            height: height * 0.028,
            width: height * 0.028,
            margin: EdgeInsets.only(
              left: width * 0.06
            ),
            child: Image.asset(
              widget.icon, 
              fit: BoxFit.fitHeight,
            ),
          ), 
          Container(
            width: width * 0.05,
          ), 
          SizedBox(
            height: height * 0.028,
            child: FittedBox(
              fit: BoxFit.fitHeight, 
              child: Text(
                widget.text, 
                style: const TextStyle(
                  fontFamily: "ArgentumSans", 
                  color: Colors.white, 
                ),
              ),
            ),
          ), 
          Expanded(child: SizedBox()), 
          if(widget.hasSwitch == false)...[
            SizedBox(
              height: 3/4 * height * 0.028,
              child: Image.asset("assets/images/settings/explore.png", fit: BoxFit.fitHeight,),
            ),
            SizedBox(
              width: width * 0.065,
            )
          ]
        ],
      ),
    );
  }
}