import 'package:flutter/material.dart';

import 'Constants.dart';
import 'ReusableCard.dart';

class ResultPage extends StatelessWidget {
  ResultPage({super.key,required this.result,required this.textResult,required this.interpretation});
  String result;
  String textResult;
  String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 40,),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text('Your Result',style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),),
          ),
          Expanded(
              flex: 7,
              child: ReusableCard(
                cardColor: cardDefaultColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(height: 20,),
                    Text(textResult,style: TextStyle(color: Colors.green,fontSize: 22),),
                    Text(result,style: const TextStyle(fontSize: 100, fontWeight: FontWeight.bold),),
                 //   SizedBox(height: 20,),
                    const Column(
                      children: [
                        Text('Normal BMI range:',style: textStyleMed,),
                        Text('18.5 - 25 kg/m2',style: textStyleWhiteMed,),
                      ],
                    ),

                   SizedBox(height: 40,),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(interpretation,textAlign: TextAlign.center,style: textStyleWhiteMed,),
                    ),
                    SizedBox(height: 40,),
                    SizedBox(height: 40,)
                  ],
                ),
              )),
          Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 10.0),
                  color: bottomCardColor,
                  child: const Center(child: Text('RE-CALCULATE YOUR BMI', style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),)),
                ),
              )
          )
        ],
      ),
    );
  }
}
