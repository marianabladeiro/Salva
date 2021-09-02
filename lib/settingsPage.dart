import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_setting_control/cupertino_setting_control.dart';

class settingsPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _settingsPage();
  }
}

class _settingsPage extends State<settingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        backgroundColor: Color(0xfffdb9c4),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Definições',
                    style: new TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffDE3163),
                    ),
                  ),
                  //nome
                  Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 20.0),
                    child: SettingRow(
                      rowData: SettingsTextFieldConfig(
                        title: 'Nome',
                        initialValue: 'Escreve o teu nome',
                      ),
                      style: SettingsRowStyle(
                        fontSize: 18,
                        activeColor: Color(0xffDE3163),
                        topTitleColor: Color(0xffDE3163),
                      ),
                      onSettingDataRowChange: (String resultVal) {},
                      config: const SettingsRowConfiguration(
                          showAsTextField: false,
                          showTitleLeft: false,
                          showTopTitle: true,
                          showAsSingleSetting: false),
                    )
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}