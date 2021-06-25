import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ReusableCard.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'GenderWidget.dart';
import 'constants.dart';
import 'resultPage.dart';
import 'bottomButton.dart';
import 'package:page_transition/page_transition.dart';
import 'calculatorBrain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(fontFamily: 'Monospace'),
        ),
      ),
      body: MainPageUI(),
      drawer: Drawer(
        child: Container(
          color: kInactiveCardColor,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: kInactiveCardColor,
                  ),
                  accountName: Center(
                    child: Text(
                      "BMI CALCULATOR",
                      style: TextStyle(color: Colors.white, fontSize: 20.0, fontFamily: 'Monospace'),
                    ),
                  ),
                  accountEmail: Center(child: Text("dummyEmail@gmail.com", style: TextStyle(fontFamily: 'Monospace'),)),
                  // currentAccountPicture: CircleAvatar(
                  //   backgroundColor:
                  //       Theme.of(context).platform == TargetPlatform.iOS
                  //           ? kInactiveCardColor
                  //           : Color(0xFF2F3153),
                  //   child: Text(
                  //     "HM",
                  //     style: TextStyle(
                  //       fontSize: 40,
                  //       fontFamily: 'Monospace',
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ),
                ),
              ),
              // ListTile(
              //     title: Text('Home',
              //         style: TextStyle(
              //           color: Colors.white,
              //           fontFamily: 'Monospace',
              //           fontSize: 18,
              //         )),
              //     contentPadding: EdgeInsets.fromLTRB(20, 5, 0, 5),
              //     trailing: Icon(
              //       Icons.arrow_right,
              //       color: Colors.white,
              //     ),
              //     onTap: () {
              //       Navigator.of(context).pop();
              //     }),
            ],
          ),
        ),
      ),
    );
  }
}

class MainPageUI extends StatefulWidget {
  @override
  _MainPageUIState createState() => _MainPageUIState();
}

class _MainPageUIState extends State<MainPageUI> {
  Gender selectedGender;
  int height = 180;
  int weight = 70;
  int age = 30;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      // updateColor(Gender.female);
                      selectedGender = Gender.male;
                    });
                  },
                  colorValue: selectedGender == Gender.male
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: GenderWidget(
                    icon: FontAwesomeIcons.mars,
                    gender: 'MALE',
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      // updateColor(Gender.female);
                      selectedGender = Gender.female;
                    });
                  },
                  colorValue: selectedGender == Gender.female
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: GenderWidget(
                    icon: FontAwesomeIcons.venus,
                    gender: 'FEMALE',
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ReusableCard(
            colorValue: kActiveCardColor,
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
                    Text(
                      height.toString(),
                      style: kNumberTextStyle,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 6.0),
                      child: Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      trackHeight: 2.0,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x22EB1555),
                      activeTrackColor: Colors.white,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 11.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 22.0)),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 240.0,
                    divisions: 120,
                    onChanged: (double Value) {
                      setState(() {
                        height = Value.round();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  colorValue: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onLongPress: () {
                              setState(() {
                                if ((weight - 10) > 0) {
                                  weight = weight - 10;
                                } else {
                                  Alert(
                                    context: context,
                                    style: AlertStyle(
                                      backgroundColor: Colors.white,
                                    ),
                                    type: AlertType.warning,
                                    title: "Error",
                                    desc: "Weight can't be Negative",
                                    buttons: [
                                      DialogButton(
                                        child: Text(
                                          "OK",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        onPressed: () => Navigator.pop(context),
                                        gradient: LinearGradient(colors: [
                                          Color.fromRGBO(29, 30, 51, 1.0),
                                          Color.fromRGBO(17, 19, 40, 1.0)
                                        ]),
                                      ),
                                      DialogButton(
                                        child: Text(
                                          "Reset",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            weight = 70;
                                          });
                                          Navigator.pop(context);
                                        },
                                        gradient: LinearGradient(colors: [
                                          Color.fromRGBO(29, 30, 51, 1.0),
                                          Color.fromRGBO(17, 19, 40, 1.0)
                                        ]),
                                      )
                                    ],
                                  ).show();
                                }
                              });
                            },
                            child: RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  if ((weight - 1) > 0) {
                                    weight--;
                                  } else {
                                    Alert(
                                      context: context,
                                      style: AlertStyle(
                                        backgroundColor: Colors.white,
                                      ),
                                      type: AlertType.warning,
                                      title: "Error",
                                      desc: "Weight can't be Negative",
                                      buttons: [
                                        DialogButton(
                                          child: Text(
                                            "OK",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          gradient: LinearGradient(colors: [
                                            Color.fromRGBO(29, 30, 51, 1.0),
                                            Color.fromRGBO(17, 19, 40, 1.0)
                                          ]),
                                        ),
                                        DialogButton(
                                          child: Text(
                                            "Reset",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              weight = 70;
                                            });
                                            Navigator.pop(context);
                                          },
                                          gradient: LinearGradient(colors: [
                                            Color.fromRGBO(29, 30, 51, 1.0),
                                            Color.fromRGBO(17, 19, 40, 1.0)
                                          ]),
                                        )
                                      ],
                                    ).show();
                                  }
                                });
                              },
                            ),
                          ),
                          SizedBox(width: 10.0),
                          GestureDetector(
                            onLongPress: () {
                              setState(() {
                                weight = weight + 10;
                              });
                            },
                            child: RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colorValue: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AGE',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onLongPress: () {
                              setState(() {
                                if ((age - 10) > 0) {
                                  age = age - 10;
                                } else {
                                  Alert(
                                    context: context,
                                    style: AlertStyle(
                                      backgroundColor: Colors.white,
                                    ),
                                    type: AlertType.warning,
                                    title: "Error",
                                    desc: "Age can't be Negative",
                                    buttons: [
                                      DialogButton(
                                        child: Text(
                                          "OK",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        onPressed: () => Navigator.pop(context),
                                        gradient: LinearGradient(colors: [
                                          Color.fromRGBO(29, 30, 51, 1.0),
                                          Color.fromRGBO(17, 19, 40, 1.0)
                                        ]),
                                      ),
                                      DialogButton(
                                        child: Text(
                                          "Reset",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            age = 30;
                                          });
                                          Navigator.pop(context);
                                        },
                                        gradient: LinearGradient(colors: [
                                          Color.fromRGBO(29, 30, 51, 1.0),
                                          Color.fromRGBO(17, 19, 40, 1.0)
                                        ]),
                                      )
                                    ],
                                  ).show();
                                }
                              });
                            },
                            child: RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  if ((age - 1) > 0) {
                                    age--;
                                  } else {
                                    Alert(
                                      context: context,
                                      style: AlertStyle(
                                        backgroundColor: Colors.white,
                                      ),
                                      type: AlertType.warning,
                                      title: "Error",
                                      desc: "Age can't be Negative",
                                      buttons: [
                                        DialogButton(
                                          child: Text(
                                            "OK",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          gradient: LinearGradient(colors: [
                                            Color.fromRGBO(29, 30, 51, 1.0),
                                            Color.fromRGBO(17, 19, 40, 1.0)
                                          ]),
                                        ),
                                        DialogButton(
                                          child: Text(
                                            "Reset",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              age = 30;
                                            });
                                            Navigator.pop(context);
                                          },
                                          gradient: LinearGradient(colors: [
                                            Color.fromRGBO(29, 30, 51, 1.0),
                                            Color.fromRGBO(17, 19, 40, 1.0)
                                          ]),
                                        )
                                      ],
                                    ).show();
                                  }
                                });
                              },
                            ),
                          ),
                          SizedBox(width: 10.0),
                          GestureDetector(
                            onLongPress: () {
                              setState(() {
                                age = age + 10;
                              });
                            },
                            child: RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        BottomButton(
          buttonTitle: 'Calculate',
          onTap: () {

            CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

            // calc.
            Navigator.push(
              context,
              PageTransition(
                child: ResultPage(
                  result: calc.calculateBMI(),
                  resultText: calc.getResult(),
                  feedbackMessage: calc.getFeedback(),
                ),
                type: PageTransitionType.rightToLeftWithFade,
              ),
              // MaterialPageRoute(
              //   builder: (context) {
              //     return ResultPage();
              //   },
              // ),
            );
          },
        ),
      ],
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onPress});

  final IconData icon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPress,
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
