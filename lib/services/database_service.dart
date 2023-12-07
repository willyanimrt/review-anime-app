// Mengonversi data ke format JSON
class MyUser {
  final String fullname;
  final String email;
  final String notlp;

  MyUser({
    required this.fullname,
    required this.email,
    required this.notlp,
  });

  Map<String, dynamic> toJson() {
    return {
      "fullname": fullname,
      "email": email,
      "notlp": notlp,
    };
  }

  factory MyUser.fromJson(Map<String, dynamic> json) {
    return MyUser(
      fullname: json["fullname"],
      email: json["email"],
      notlp: json["notlp"],
    );
  }
}

class DataAnime {
  String? name;
  String? genre;
  String? descripe;
  String? avatar;
  String? upload;

  DataAnime(
      {this.name,
      this.genre,
      this.descripe,
      this.upload,
      this.avatar});

  DataAnime.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    genre = json['genre'];
    descripe = json['descripe'];
    avatar = json['avatar'];
    upload = json['upload'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['genre'] = this.genre;
    data['descripe'] = this.descripe;
    data['avatar'] = this.avatar;
    data['upload'] = this.upload;
    return data;
  }

  Map<String, dynamic> toJson2() {
    final Map<String, dynamic> data2 = new Map<String, dynamic>();
    data2['name'] = this.name;
    data2['genre'] = this.genre;
    data2['descripe'] = this.descripe;
    data2['avatar'] = this.avatar;
    return data2;
  }

  Map<String, dynamic> toJson3() {
    final Map<String, dynamic> dataaction = new Map<String, dynamic>();
    dataaction['name'] = this.name;
    dataaction['genre'] = this.genre;
    dataaction['descripe'] = this.descripe;
    dataaction['avatar'] = this.avatar;
    return dataaction;
  }

  Map<String, dynamic> toJson4() {
    final Map<String, dynamic> datafantasy = new Map<String, dynamic>();
    datafantasy['name'] = this.name;
    datafantasy['genre'] = this.genre;
    datafantasy['descripe'] = this.descripe;
    datafantasy['avatar'] = this.avatar;
    return datafantasy;
  }

  Map<String, dynamic> toJson5() {
    final Map<String, dynamic> dataadventure = new Map<String, dynamic>();
    dataadventure['name'] = this.name;
    dataadventure['genre'] = this.genre;
    dataadventure['descripe'] = this.descripe;
    dataadventure['avatar'] = this.avatar;
    return dataadventure;
  }

  Map<String, dynamic> toJson6() {
    final Map<String, dynamic> datacomedy = new Map<String, dynamic>();
    datacomedy['name'] = this.name;
    datacomedy['genre'] = this.genre;
    datacomedy['descripe'] = this.descripe;
    datacomedy['avatar'] = this.avatar;
    return datacomedy;
  }
}
