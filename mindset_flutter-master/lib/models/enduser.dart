import 'dart:convert';



Enduser enduserFromJson(String str) => Enduser.fromJson(json.decode(str));

String enduserToJson(Enduser data) => json.encode(data.toJson());

class Enduser {
    String uid;
    String? email;
    String? fullname;
    int? age;
    String? bio;

    Enduser({
        required this.uid,
        this.email,
        this.fullname,
        this.age,
        this.bio,
    });

    factory Enduser.fromJson(Map<String, dynamic> json) => Enduser(
        uid: json["uid"],
        email: json["email"],
        fullname: json["fullname"],
        age: json["age"],
        bio: json["bio"],
    );

    Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "fullname": fullname,
        "age": age,
        "bio": bio,
    };
}