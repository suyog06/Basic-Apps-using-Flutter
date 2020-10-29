import 'package:flutter/cupertino.dart';
import'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_child.dart';
import 'reusable_container.dart';
import 'constants.dart';
import 'results_page.dart';
import 'calculator_brain.dart';

enum Gender{
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height = 200;
  int weight = 50;
  int age = 12;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableContainer(
                onPress: (){
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                cardChild: ReusableChild(
                  changeIcon: FontAwesomeIcons.mars,
                  changeText: 'MALE',
                ),
                col: selectedGender == Gender.male ? kColorOfCards : kInactiveCardColor,
              ),
              ),
              Expanded(child: ReusableContainer(
                onPress: (){
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                cardChild: ReusableChild(
                  changeIcon: FontAwesomeIcons.venus,
                  changeText: 'FEMALE',
                ),
                col: selectedGender == Gender.female ? kColorOfCards : kInactiveCardColor,
              ),
              ),
            ],
          ),
          ),
          Expanded(
            child: ReusableContainer(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kLabelNumberStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      overlayColor: Color(0x29EB1555),
                      thumbColor: Color(0xFFEB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 0.0,
                        max: 300.0,
                        onChanged: (double newValue){
                          setState(() {
                            height = newValue.round();
                          });
                        }
                    ),
                  ),
                ],
              ),
              col: kColorOfCards,
            ),
          ),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableContainer(
                  col: kColorOfCards,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kLabelNumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget> [
                          RoundIconButton(
                            icon: Icons.remove,
                            onPressed: (){
                              setState(() {
                                weight = weight - 1;
                              });
                            },
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          RoundIconButton(
                            icon: Icons.add,
                            onPressed: (){
                              setState(() {
                                weight = weight + 1;
                              });
                            },
                          ),
                        ]
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableContainer(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kLabelNumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                              icon: Icons.remove,
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              }),
                          SizedBox(
                            width: 12,
                          ),
                          RoundIconButton(
                              icon: Icons.add,
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              })
                        ],
                      )
                    ],
                  ),
                  col: kColorOfCards,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: (){
            CalculatorBrain calc = CalculatorBrain(height : height, weight: weight);
            Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(
              bmiResult: calc.calculateBMI(),
              resultText: calc.getResult(),
              interpretation: calc.getInterpretation(),
            )));
          },
          child: Container(
            child: Center(
              child: Text(
                'CALCULATE',
                style: kLargeButtonTextStyle,
              ),
            ),
            height: kBottomContainerHeight,
            padding: EdgeInsets.only(bottom: 15.0),
            margin: EdgeInsets.only(top: 10.0),
            color: kBottomContainerColor,
            width: double.infinity,
          ),
        )
      ],
    )
  );
}
}


class RoundIconButton extends StatelessWidget {

  final IconData icon;
  final Function onPressed;
  RoundIconButton({@required this.icon, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}








