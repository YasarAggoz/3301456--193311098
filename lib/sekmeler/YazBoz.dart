
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:editable/editable.dart';

class YazBoz extends StatefulWidget {
  const YazBoz({Key? key}) : super(key: key);
  @override
  _YazBoz createState() => _YazBoz();
}

class _YazBoz extends State<YazBoz> {

  String takim1 = '';
  String takim2 = '';
  String takim3 = '';
  String takim4 = '';


  @override
  Widget build(BuildContext context) {
    void _Baslik_Kaydet(String text) {
      setState(() {
        takim1 = text;
      });
    }

    void _Baslik2_Kaydet(String text) {
      setState(() {
        takim2 = text;
      });
    }

    return Scaffold(
      appBar: AppBar(

      ),

      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                    padding: EdgeInsets.only(
                      bottom: 40,
                      right: 20,
                    )),
                Column(
                  children: [
                    Text('Takım 1')
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(
                      bottom: 40,
                      right: 50,
                    )),
                Text('Takım 2'),
                Padding(
                    padding: EdgeInsets.only(
                      bottom: 40,
                      right: 50,
                    )),
                Text('Takım 3'),
                Padding(
                    padding: EdgeInsets.only(
                      bottom: 40,
                      right: 50,
                    )),
                Text('Takım 4'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
