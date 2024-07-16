class BMIcal{

  BMIcal({required int height,required int weight}){
    //formula for BMI = Weight/(Height)^2
    double heightCal = height*height.toDouble()/10000;
    double weightCal = weight.toDouble();

    _bmi = weightCal/heightCal;
    //print('BMI is $bmi');
  }
  double _bmi=0;
  String getBMI(){
    return _bmi.toStringAsFixed(1);
  }

  String getTextResult(){
    if(_bmi>=25){
      return 'Overweight';
    }else if(_bmi>=18.5){
      return 'Normal';
    }else{
      return 'Underweight';
    }
  }

  String getInterpretation(){
    if(_bmi>=25){
      return 'You have a higher than normal body weight. Try to exercise more.';
    }else if(_bmi>=18.5){
      return 'You have a normal body weight. Good job!';
    }else{
      return 'Your have a lower than body weight. You can eat a bit more.';
    }
  }


}