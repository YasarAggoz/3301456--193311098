import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../Veritabani/notedata.dart';
import '../homepage.dart';
class Widgetler extends StatelessWidget {
  final int ?id ;
  final String ?baslik;
  final String ?notlar;
  Widgetler({ this.id,this.baslik , this.notlar});


  @override

  Widget build(BuildContext context) {
    DatabaseHelper _dbhelper = DatabaseHelper();

    return Slidable(
      actionPane: SlidableDrawerActionPane(),

      actions: [
        IconSlideAction(
          color: Colors.green,
          onTap: (){
            showGeneralDialog(
              barrierColor: Colors.blue.withOpacity(0.5),
              transitionBuilder: (BuildContext context, Animation<double> a1, Animation<double> a2, Widget widget) {
                final curvedValue = Curves.easeInOutBack.transform(a1.value) -   1.0;
                return StatefulBuilder(
                  builder: (BuildContext context, Function s) {
                    return Transform(
                        transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
                        child: Opacity(
                          opacity: a1.value,
                          child: AlertDialog(
                              shape: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                              title: Text('$baslik',
                                style: TextStyle(
                                    fontSize: 16.0
                                ),
                              ),
                              content: Container(
                                  width: 300.0,
                                  height: MediaQuery.of(context).size.height / 5.0,
                                  child: ListView(
                                    children: [
                                      Text( '$notlar',
                                        style: TextStyle(
                                            fontSize: 16.0
                                        ),
                                      ),
                                      SizedBox(height: 10.0),
                                      Container(
                                          margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                                          child: ElevatedButton(
                                            
                                            onPressed: () async {
                                              if (baslik != '') {
                                                await _dbhelper.notSil(baslik!);
                                                Navigator.push(context, MaterialPageRoute(
                                                    builder: (context) => const Homapage()
                                                ),
                                                );

                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(content : Text('Silindi')));
                                              }

                                            }, child: Text('Sil'),
                                          )
                                      )
                                    ],
                                  )
                              )),
                        ));
                  },
                );
              },
                transitionDuration: Duration(milliseconds: 200),
                barrierDismissible: true,
                barrierLabel: '',
                context: context,
                pageBuilder: (BuildContext context, Animation<double> animation1, Animation<double> animation2) {return Text(''); }
    );
            },
          icon:Icons.edit,
        )
      ], child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: 35.0,
          horizontal: 40.0,
        ),
        margin:EdgeInsets.only(
          bottom: 20.0,
        ) ,

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text (
              baslik ??  ("İsimisiz"),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 15.0,

              ),
              child:  Text(
                notlar ??  ("Hatırlatma texti yazılmadı"),
                style: TextStyle(
                  fontSize: 15.0,
                  color: Color(0xFF868290),
                  height: 1.5,
                ),
              ),
            )
          ],
        )

    ),
    );
  }


}

