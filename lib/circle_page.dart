import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'color_pick.dart';

class CirclePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CirclePageState();
  }
}

class CirclePageState extends State<CirclePage> {
  Color currentColor = Color(0xff0000ff);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("色盘选择器"),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          ColorPickView(
            size: Size(200, 200),
            selectColor: currentColor,
            selectRadius: 10,
            padding: 10,
            selectRingColor: Colors.black,
            selectColorCallBack: (color) {
              setState(() {
                currentColor = color;
              });
            },
          ),
          Container(
            height: 200,
            width: 300,
            child: Column(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  color: currentColor,
                ),
                Expanded(

                    child: Slider(
                  min: 0,
                  max: 255,
                  activeColor: Colors.red,
                  inactiveColor: Colors.red,
                  value: currentColor.red.toDouble(),
                  onChanged: (double value) {
                    setState(() {
                      currentColor = currentColor.withRed(value.round());
                    });
                  },
                )),
                Expanded(
                    child: Slider(
                  min: 0,
                  max: 255,
                  activeColor: Colors.green,
                  inactiveColor: Colors.green,
                  value: currentColor.green.toDouble(),
                  onChanged: (double value) {
                    setState(() {
                      currentColor = currentColor.withGreen(value.round());
                    });
                  },
                )),
                Expanded(
                    child: Slider(
                  min: 0,
                  max: 255,
                  activeColor: Colors.blue,
                  inactiveColor: Colors.blue,
                  value: currentColor.blue.toDouble(),
                  onChanged: (double value) {
                    setState(() {
                      currentColor = currentColor.withBlue(value.round());
                      print("blue>>>> $currentColor");
                    });
                  },
                )),
                Expanded(
                    child: Slider(
                  min: 0,
                  max: 360,
                  activeColor: Colors.deepPurple,
                  inactiveColor:Colors.deepPurple,
                  value:HSVColor.fromColor( currentColor).hue,
                  onChanged: (double value) {
                    setState(() {
                      print("Hue value>>>> $value");
                      HSVColor hsv = HSVColor.fromColor(currentColor);
                      print("Hue hsv>>>> $hsv");
                      HSVColor hsvs = hsv.withHue(value);
                      print("Hue hsvs>>>> $hsvs");
                      currentColor = hsvs.toColor();
                      print("Hue>>>> $currentColor");
                    });
                  },
                )),
                Expanded(
                    child: Slider(
                  min: 0,
                  max: 100,
                  activeColor: Colors.black,
                  inactiveColor:Colors.black,
                  value:HSVColor.fromColor( currentColor).saturation * 100,
                  onChanged: (double value) {
                    setState(() {
                      print("Saturation value>>>> $value");
                      HSVColor hsv = HSVColor.fromColor(currentColor);
                      print("Saturation hsv>>>> $hsv");
                      HSVColor hsvs = hsv.withSaturation(value/100);
                      print("Saturation hsvs>>>> $hsvs");
                      currentColor = hsvs.toColor();
                      print("Saturation>>>> $currentColor");
                    });
                  },
                )),

              ],
            ),
          )
        ],
      )),
    );
  }
}
