import 'package:flutter/material.dart';
import 'package:proje/sekmeler/YazBoz.dart';
import 'package:proje/sekmeler/classes/widgetler.dart';
import 'package:proje/sekmeler/hatirlaticipage.dart';
import 'package:proje/sekmeler/yapilacaklar.dart';
import 'package:proje/Veritabani/notedata.dart';

class Homapage extends StatefulWidget {

  const Homapage({Key? key}) : super(key: key);
  @override
  _HomepageState createState() => _HomepageState();
}
class _HomepageState extends State<Homapage> {
DatabaseHelper _dbhelper = DatabaseHelper();
  bool ekle = false ;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);
    return Scaffold (
      appBar: AppBar(
        title: const Text('Notlar'),
        actions: <Widget> [

                    TextButton(
              style: style,
              onPressed:() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Yapilacaklar(),
                    ));

              },
                      child: Text('Todo', style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18),),

          ),

          TextButton(
            style: style,
            onPressed:() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => YazBoz(),
                  ));

            },
            child:  Text('YazBoz' , style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18),),

          ),
          TextButton(
           style: style,
             onPressed:() {
            showAboutDialog(context: context,
              applicationVersion: '1.0',
              applicationName: 'Hatırlatıcı',
              applicationLegalese: "Bu Uygulama Dr.Öğretim üyesi Ahmet Cevahir ÇINAR tarafından yürütülen 3311456 kodlu Mobil Programlama dersi kapsamında 193311098 no lu Yaşar Ağgöz tarafından 03.25.2022 yılında yapılmıştır",
            );
             },
             child: const Image(
               image: AssetImage(
                 'assets/resimler/about_icon.png',
               ),
             )
         )
        ],
      ),
      body: SafeArea(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
        ),
        color: const Color(0xFFF6F6f6),
       child: Stack(
         children: [
            Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Container(
                 margin: const EdgeInsets.only(
                   bottom: 30.0,
                   top: 20.0,
                 ),

               ),
               Expanded(
                 child:FutureBuilder(
                   future: _dbhelper.notGetir(),
                   builder: (context, AsyncSnapshot snapshot)
                   {
                     if (snapshot.data == null) return Text('Yükleniyor');
                         return ListView.builder(

                           itemCount:snapshot.data.length,
                           itemBuilder:(context,index){
                             return Widgetler(
                               baslik: snapshot.data[index].baslik,
                               notlar: snapshot.data[index].notlar,
                             );

                           },
                         );
                   },
                 )


               )

             ],

           ),
           Positioned(
               bottom: 20.0,
               right: 0.0,
               child: GestureDetector(
                 onTap: () {
                   ekle = true ;
                   Navigator.push(context, MaterialPageRoute(
                     builder: (context) => const Hatirlatici()
                   ),
                   );
                 },
                 child: Container(
                 width: 45.0,
                 height: 45.0,
                 decoration: BoxDecoration(

                     borderRadius: BorderRadius.circular(15.0),
                     color:const Color(0xFF29B6F6)
                 ),   //Buton
                 child: const Image(
                   image: AssetImage(
                     "assets/resimler/add_icon.png",
                   ),
                 ),
               )

           )
           )
         ],
       ),

      ),
      ),

    );
  }
}

