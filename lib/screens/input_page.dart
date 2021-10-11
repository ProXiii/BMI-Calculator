import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

// class Gender{
//
//   GenderCard genderCard;
//
//   Gender({this.genderCard});
//
// }

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;

  int height = 180;
  int weight = 50;
  int age = 14;

  // Color maleCardColor = inactiveCardColor;
  // Color femaleCardColor = inactiveCardColor;

  // void updateColor(int gender){
  //   //male card was pressed
  //   if (gender == 1 ){
  //     if (maleCArdColor == inactiveColor){
  //       maleCardColor = activeCardColor;
  //       femaleCardColor = inactiveCardColor;
  //     } else {
  //       maleCardColor = inactiveCardColor;
  //     }
  //   if (gender == 2 ){
  //     if (femaleCArdColor == inactiveColor){
  //       femaleCardColor = activeCardColor;
  //       maleCardColor = inactiveCardColor;
  //     } else {
  //      femaleCardColor = inactiveCardColor;
  //      }
  //     }
  //   }
  // }

  // void updateColor(Gender selectedGender){
  //   if(selectedGender == Gender.Male){
  //     if(maleCardColor == inactiveCardColor){
  //       maleCardColor = activeCardColor;
  //       femaleCardColor = inactiveCardColor;
  //     } else{
  //       maleCardColor = inactiveCardColor;
  //     }
  //   }
  //   if(selectedGender == Gender.Female){
  //     if(femaleCardColor == inactiveCardColor){
  //       femaleCardColor = activeCardColor;
  //       maleCardColor = inactiveCardColor;
  //     } else {
  //       femaleCardColor = inactiveCardColor;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0a0E21),
        centerTitle: true,
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  //      child: GestureDetector(
                  //        onTap: (){
                  //        setState(() {
                  // updateColor(Gender.Male).
                  // selectedGender = Gender.Male;
                  // });
                  // }, CREATED onPress as a FUNCTION VARIABLE TO THE REUSABLE CARD AS FUNCTION AS FIRST ORDER OBJECTS
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor, // past colour: maleCardColor
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                  // Container(
                  //   margin: EdgeInsets.all(15.0),
                  //   decoration: BoxDecoration(
                  //       color: Color(0xFF1D1E33),
                  //       borderRadius: BorderRadius.circular(10.0)
                  //   ),
                  // color: Color(0xFF1D1E33),
                  // width: 170.0,
                  // height: 200.0,
                  // ),
                ),
                Expanded(
                  child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      colour: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor, //past colour: femaleCardColor
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      )),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: kLabelNumStyle),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Color(0xFFEB1555),
                        inactiveTrackColor: Color(0xFF8D8E98),
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      // activeColor: Colors.white,
                      // inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kLabelNumStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // FloatingActionButton(
                            //   backgroundColor: Color(0xFF4C4F5E),
                            //   child: Icon(
                            //    Icons.minimize,
                            //     color: Colors.white,
                            //   ),
                            // ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            // FloatingActionButton(
                            //   backgroundColor: Color(0xFF4C4F5E),
                            //   child: Icon(
                            //     Icons.add,
                            //     color: Colors.white,
                            //   ),
                            // )
                          ],
                        )
                      ],
                    ),
                  ),
                  // Container(
                  //   margin: EdgeInsets.all(15.0),
                  //   decoration: BoxDecoration(
                  //       color: Color(0xFF1D1E33),
                  //       borderRadius: BorderRadius.circular(10.0)
                  //   ),
                  // color: Color(0xFF1D1E33),
                  // width: 170.0,
                  // height: 200.0,
                  // ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kLabelNumStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(
                                  () {
                                    age--;
                                  },
                                );
                              },
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(
                                  () {
                                    age++;
                                  },
                                );
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  // Container(
                  //   margin: EdgeInsets.all(15.0),
                  //   decoration: BoxDecoration(
                  //       color: Color(0xFF1D1E33),
                  //       borderRadius: BorderRadius.circular(10.0)
                  //   ),
                  // color: Color(0xFF1D1E33),
                  // width: 170.0,
                  // height: 200.0,
                  // ),
                )
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE YOUR BMI',
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(weight: weight, height: height);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),

                // OR THIS ONE< ITS THE SAME BUT MUCH PREFER UP
                // MaterialPageRoute(
                //   builder: (context) {
                //     return ResultsPage();
                //   },
                // )
              );
            },
          )
        ],
      ),
    );
  }
}

// floatingActionButton: Theme(
//   data: ThemeData.light(),
//   child: FloatingActionButton(
//     backgroundColor: Color(0xFF7e0d00),
//     child: Icon(Icons.add),
//   ),
// ),

// child: Slider(
// value: height.toDouble(),
// min: 120.0,
// max: 220.0,
// // activeColor: Colors.white,
// // inactiveColor: Color(0xFF8D8E98),
// onChanged: (double newValue){
// setState(() {
// height = newValue.round();
// });
