class Todo {
final int? id;
final String notlar;



Todo(
    { this.id,
      required this.notlar,

    });


Map <String ,dynamic> toMap() {
  return {
    'id':id,
    'notlar': notlar
  };
}
}