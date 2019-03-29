import 'package:flutter/material.dart';

class GameSetup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GameSetupState();
  }
}

class _GameSetupState extends State<GameSetup> {
  var _boardSizeOptions = ["Small (40)", "Medium (55)", "Large (70)"];
  var _currentSelectedBoardSize = "Small (40)";
  final _minimumPadding = 8.0;
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getGameSetupScreen(),
    );
  }

  Widget getGameSetupScreen() {
    return ListView(
      children: <Widget>[
        setTextViewWidget("The 30 Seconds Game", 30),
        setTextInputWidget("", "", null),
        setTextViewWidget("Board Size", 30),
        setDropDownWidget(_boardSizeOptions),
        getRaisedButtonWidget()
      ],
    );
  }

  Widget setDropDownWidget(List<String> dropDownData) {
    return ListTile(
        title: DropdownButton<String>(
      items: dropDownData.map((String dropdownStringItem) {
        return DropdownMenuItem<String>(
          value: dropdownStringItem,
          child: Text(dropdownStringItem),
        );
      }).toList(),
      onChanged: (String newValueSelected) {
        _onDropDownItemSelected(newValueSelected);
      },
      value: _currentSelectedBoardSize,
    ));
  }

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      this._currentSelectedBoardSize = newValueSelected;
    });
  }

  Widget setTextViewWidget(String textViewText, double size) {
    return Text(
      textViewText,
      style: TextStyle(fontSize: size),
    );
  }

  Widget setTextInputWidget(
      String label, String hint, TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.all(_minimumPadding),
      child: TextFormField(
        //style: appliedTextStyle,
        controller: controller,
        validator: (String value) {
          if (value.isEmpty) {
            return "Please enter $label value";
          }
        },
        decoration: InputDecoration(
            labelText: label,
            //labelStyle: appliedTextStyle,
            errorStyle: TextStyle(fontSize: 15),
            hintText: hint,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
      ),
    );
  }

  Widget getRaisedButtonWidget() {
    return RaisedButton(
        color: Theme.of(context).accentColor,
        textColor: Theme.of(context).primaryColorDark,
        child: Text(
          "Next",
          textScaleFactor: 1.5,
        ),
        onPressed: () {
          setState(() {
            if (_formKey.currentState.validate()) {}
          });
        });
  }
}
