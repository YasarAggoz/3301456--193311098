import 'package:flutter/material.dart';
import 'package:proje/Veritabani/note.dart';
import 'package:proje/Veritabani/notedata.dart';


class Hatirlatici extends StatefulWidget {

 const Hatirlatici({
  Key?  key ,
  final Notlars? note ,
   }) :super(key: key);


  @override
  _HatirlaticiState createState() => _HatirlaticiState();
}


class _HatirlaticiState extends State<Hatirlatici> {
  DatabaseHelper _dbHelper = DatabaseHelper();

  String basliks='' ;
  String notlars='' ;

  @override

  Widget build(BuildContext context) {
    void _Baslik_Kaydet(String text)
    {
      setState((){
        basliks= text ;
      });

    }
    void _Hnot_Kaydet(String text)
    {
      setState((){
        notlars= text ;
      });

    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Not Ekle'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [

                    Expanded(

                      child: TextField(
                        textAlign: TextAlign.center,
                        onChanged: (Text){
                         _Baslik_Kaydet(Text);
                         },
                        decoration: InputDecoration(
                            hintText:'   Başlık...  ',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 22.0,
                            )),
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            Container(
              child:  TextField(
                textAlign: TextAlign.center,
                onChanged: (Text) {
                  _Hnot_Kaydet(Text);

                },
                decoration: InputDecoration.collapsed(
                  hintText: "Note...",

                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.all(25.0),
              child: ElevatedButton(
    style: ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled))
    return Colors.red;
    return null;
    }),
    foregroundColor: MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled))
    return Colors.blue;
    return null;
    }),
    ), onPressed: () async {
          if (basliks!= '' && notlars!='') {
            Notlars _newwidget = Notlars(
              baslik: basliks,
              notlar: notlars,
            );
                 _dbHelper.notEkle(_newwidget);
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content : Text('Not Eklendi')));

            Navigator.pop(context);

          }
          else ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content : Text('Lütfen Başlık ve Not giriniz')));




              },
    child: Text('Kaydet'),
    )
              ),
          ],
        ),

      ),

    );

  }


  }




