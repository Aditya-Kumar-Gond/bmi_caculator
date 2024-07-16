import 'dart:ui';
import 'BMIcal.dart';
import 'ActionCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'IconContent.dart';
import 'ReusableCard.dart';
import 'Constants.dart';
import 'ResultPage.dart';




int selectedHeight = 170;
int selectedWeight = 60;
int selectedAge = 18;


class  InputPage extends StatefulWidget {
  const InputPage({super.key});
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage>{

  Color maleCardColor = cardDefaultColor;
  Color femaleCardColor = inactiveCardColor;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        title: const Center(child: Text('BMI CALCULATOR',style: TextStyle(color: Colors.white),)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: GestureDetector(
                  onTap: (){
                    print("Male card tapped");
                    setState(() {
                      updateCardColor(1);
                    });
                  },
                  child: ReusableCard(
                    cardColor: maleCardColor,
                    cardChild: IconContent(
                      iconDescription: "MALE",
                      iconData: FontAwesomeIcons.mars,
                    ),
                  ),
                )),
                Expanded(child:  GestureDetector(
                  onTap: (){
                    print("Female card Tapped");
                    setState(() {
                      updateCardColor(2);
                    });
                  },
                  child: ReusableCard(
                    cardColor: femaleCardColor,
                    cardChild: IconContent(
                      iconData: FontAwesomeIcons.venus,
                      iconDescription: "FEMALE",
                    ),
                  ),
                )),
              ],
            ),
          ),
          Expanded(
              flex: 3,
              child: ReusableCard(
            cardColor: cardDefaultColor,
            cardChild:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Height',style: textStyle,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text('$selectedHeight',
                      style: largeTextStyle,),
                    Text(' cm',style: textStyle,),
                  ],
                ),
                Slider(value: selectedHeight.toDouble(),max: 251,min: 0,
                  onChanged: (double value) {
                    setState(() {
                    selectedHeight = value.toInt();
                    });
                  },activeColor: Colors.white,thumbColor: bottomCardColor,)
              ],
            ),
          )),
          Expanded(
            flex: 3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: ReusableCard(
                  cardColor: cardDefaultColor,
                  cardChild:  ActionCard(
                    toplabel: 'Weight',
                    number: selectedWeight,
                    Circulerchildren: [
                      CirculerCard(
                        icon: Icon(FontAwesomeIcons.minus),
                        ontapped: (){
                          setState(() {
                            selectedWeight--;
                          });
                        },
                      ),
                      CirculerCard(icon: Icon(FontAwesomeIcons.plus), ontapped: (){
                            setState(() {
                              selectedWeight++;
                            });
                          })
                    ],
                  ),
                )),
                Expanded(child: ReusableCard(
                  cardColor: cardDefaultColor,
                  cardChild: ActionCard(
                    toplabel: 'Age',
                    number: selectedAge,
                    Circulerchildren: [
                      CirculerCard(icon: Icon(FontAwesomeIcons.minus),
                          ontapped: (){
                            setState(() {
                              selectedAge--;
                            });
                          }),
                      CirculerCard(icon: Icon(FontAwesomeIcons.plus),
                          ontapped: (){
                            setState(() {
                              selectedAge++;
                            });
                          })
                    ],
                  ),
                )),
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    print('tapped calculated');
                    BMIcal cal = BMIcal(height: selectedHeight, weight: selectedWeight);
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                        return ResultPage(result: cal.getBMI(), textResult: cal.getTextResult(), interpretation: cal.getInterpretation(),);
                    }));
                  });
                },
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 10.0),
                  color: bottomCardColor,
                  child: const Center(child: Text('CALCULATE', style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400),)),
                ),
              )
          )
        ],
      )

    );
  }



  void updateCardColor(int i) {
    if(i == 1){
      maleCardColor = cardDefaultColor;
      femaleCardColor = inactiveCardColor;
      selectedHeight = 170;
      selectedWeight = 60;
    }else{
      maleCardColor = inactiveCardColor;
      femaleCardColor = cardDefaultColor;
      selectedHeight = 150;
      selectedWeight = 50;
    }
  }

}


class CirculerCard extends StatelessWidget {
  var ontapped;

  CirculerCard({
    super.key,
    required this.icon,
    required this.ontapped()
  });


  Icon icon;

  @override
  // Widget build(BuildContext context) {
  //   return GestureDetector(
  //     onTap: ontapped,
  //     child: Container(
  //       decoration: BoxDecoration(
  //           color: Color(0xFF222747),
  //           borderRadius: BorderRadius.circular(25)
  //       ),
  //       child: icon,
  //       width: 50,
  //       height: 50,
  //     ),
  //   );
  // }
  Widget build(BuildContext context) {
    return RawMaterialButton(
        onPressed: ontapped,
        child:  icon,
        enableFeedback: true,
        fillColor: Color(0xFF4c4f5c),
        constraints: BoxConstraints.tightFor(width: 56,height: 56),
        shape: CircleBorder(),
    );
  }
}

