import 'package:flutter/material.dart';
// import 'package:proje/Veritabani/notedata.dart';
// import 'package:proje/Veritabani/todo.dart';
import 'package:proje/sekmeler/homepage.dart';
class Yapilacaklar extends StatelessWidget {
  const Yapilacaklar({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Home(),
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
    );


  }
}
class Home extends StatefulWidget{
  const Home({Key? key}) : super(key: key);


  @override
  _yapilacak createState() => _yapilacak();
}
class _yapilacak extends State<Home> {

  String notlar= '';
  String Ekle='' ;
  List yap = [];
  @override
  void initState() {
    yap.add("Deneme");
    yap.add("Deneme2");
    yap.add("Deneme5");
    yap.add("Deneme3");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // DatabaseHelper _dbhelper = DatabaseHelper();
    return Scaffold(

      appBar:AppBar(
          leading: TextButton(
            onPressed:() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Homapage(),
                  ));

            },
            child: Icon(
              Icons.arrow_back, color: Colors.white70,
            ),

          ),
        title:   const Text('Yapilacaklar'),
      ) ,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(context: context, builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Ekle'),
              content: TextField(
                decoration: const InputDecoration(
                    hintText: 'Yapilacakkonu'
                ),
                onChanged: (String value) {
                  Ekle = value ;

                },
              ),
              actions:  [
                TextButton(onPressed:  (){
                  setState(() {
                    yap.add(Ekle);


                    // if (Ekle != '') {
                    //   Todo _yenitodo =Todo(
                    //       notlar: Ekle);
                    //   _dbhelper.Todoekle(_yenitodo);
                    //
                    // }
                  });
                  Navigator.of(context).pop();
                }, child:const Text("Ekle",style: TextStyle(color: Colors.blue),) )
              ],
            );
          }

          );

        },
        child: const Image(
          image: AssetImage(
            "assets/resimler/add_icon.png",
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: ListView.builder(
          itemCount: yap.length,
          itemBuilder: (BuildContext context, int index){
            return Dismissible (
              key: Key(yap[index]),
              child: Card(
                elevation: 4,
                margin: const EdgeInsets.all(8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),

                ),
                child: ListTile(
                  title: Text(yap[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_forever_rounded,color: Colors.red,
                    ),
                    onPressed: (){
                      setState(() {
                        yap.removeAt(index);
                      });
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content : Text('Silme işlemi başarılı')));
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

}