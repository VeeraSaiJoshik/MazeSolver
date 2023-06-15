import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          Expanded(child: Container()), 
          
          Container(
            height: height * 0.076,
            width: width * 0.83,
            decoration: const BoxDecoration(
              color: Color(0xff171921), 
              borderRadius: BorderRadius.all(
                Radius.circular(10)
              )
            ),
          ),
          SizedBox(
            height: height * 0.1 * 0.1,
          )
        ],
      ),
    );
  }
}