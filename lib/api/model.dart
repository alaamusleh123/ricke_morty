class Model{
 late String name;
 late String species;
 late String status;
 late String gender;
 late String image;
 late int id;


  Model({
    required this.name,
    required this.gender,
    required this.status,
    required this.species,
    required this.image,
    required this.id
  });

  factory Model.fromJson(Map<String,dynamic> jsonData){
    return Model(
        name: jsonData['name'],
        gender: jsonData['gender'],
        status: jsonData['status'],
        species: jsonData['species'],
        image: jsonData['image'],
      id: jsonData['id']
    );
  }
}