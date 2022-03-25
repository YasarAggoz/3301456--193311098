// const String tableNotes = 'notes';
// class NoteFields  {
//   static final List<String>values = [
//     id,baslik,notlar
//   ];
//   static const String id='_id';
//   static const String notlar ='notlar ';
//   static const String baslik='_baslik';
// }
//
// class Note {
//   final int? id ;
//   final String notlar ;
//   final String baslik;
//
//
//   const Note({
//     this.id,
//     required this.notlar ,
//     required this.baslik,
//   });
//   Note copy ({
//     int? id,
//     final String? notlar ,
//     final String? baslik,
//   }) => Note(
//     id: id ?? this.id,
//     baslik: baslik ?? this.baslik,
//     notlar :notlar  ?? this.notlar ,
//   );
//   static Note fromJson(Map<String,Object? >json) =>
//       Note(
//         id: json[NoteFields.id] as int?,
//         baslik: json[NoteFields.baslik] as String,
//         notlar : json[NoteFields.notlar ] as String,
//
//       );
//   Map<String , Object?> toJson() => {
//     NoteFields.id: id,
//     NoteFields.notlar : notlar ,
//     NoteFields.baslik : baslik,
//
//   };
//
// }



class Notlars {
  final int? id;
  final String baslik;
  final String notlar;



  Notlars(
         { this.id,
          required this.notlar,
         required this.baslik,
      });


  Map <String ,dynamic> toMap() {
    return {
      'id':id,
      'baslik': baslik
      , 'notlar': notlar
    };
  }
}
