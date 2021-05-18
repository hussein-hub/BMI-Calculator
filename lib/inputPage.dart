import 'package:flutter/material.dart';

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
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ResuableCard(
                    colorValue: Color(0xFF1D1E33),
                  ),
                ),
                Expanded(
                  child: ResuableCard(
                    colorValue: Color(0xFF1D1E33),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ResuableCard(
              colorValue: Color(0xFF1D1E33),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ResuableCard(
                    colorValue: Color(0xFF1D1E33),
                  ),
                ),
                Expanded(
                  child: ResuableCard(
                    colorValue: Color(0xFF1D1E33),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Center(
              child: Text(
                'Calculate',
                style: TextStyle(
                    fontSize: 20.0),
              ),
            ),
            margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
            width: MediaQuery.of(context).size.width * 0.50,
            height: MediaQuery.of(context).size.width * 0.155,
            decoration: BoxDecoration(
              color: Color(0xFFEB1555),
              borderRadius: BorderRadius.circular(50.0)
            ),
          ),
        ],
      )
      // floatingActionButton: Theme(
      //   data: ThemeData(accentColor: Colors.purple),
      //   child: FloatingActionButton(
      //     child: Icon(Icons.add),
      //   ),
      // ),
    );
  }
}


class ResuableCard extends StatelessWidget {
  ResuableCard({@required Color colorValue}) {
    this.colorValue = colorValue;
  }
  Color colorValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15.0, 15.0, 7.5, 7.5),
      decoration: BoxDecoration(
          color: colorValue,
          borderRadius: BorderRadius.circular(10.0)
      ),
    );
  }
}
