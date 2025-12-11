// To parse this JSON data, do
//
//     final characterModel = characterModelFromJson(jsonString);

import 'dart:convert';

CharacterModel characterModelFromJson(String str) => CharacterModel.fromJson(json.decode(str));

String characterModelToJson(CharacterModel data) => json.encode(data.toJson());

class CharacterModel {
    int id;
    int age;
    dynamic birthdate;
    String description;
    int firstAppearanceEpId;
    int firstAppearanceShId;
    String gender;
    String name;
    String occupation;
    List<String> phrases;
    String portraitPath;
    String status;
    FirstAppearance firstAppearanceEp;
    FirstAppearance firstAppearanceSh;

    CharacterModel({
        required this.id,
        required this.age,
        required this.birthdate,
        required this.description,
        required this.firstAppearanceEpId,
        required this.firstAppearanceShId,
        required this.gender,
        required this.name,
        required this.occupation,
        required this.phrases,
        required this.portraitPath,
        required this.status,
        required this.firstAppearanceEp,
        required this.firstAppearanceSh,
    });

    factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
        id: json["id"],
        age: json["age"],
        birthdate: json["birthdate"],
        description: json["description"],
        firstAppearanceEpId: json["first_appearance_ep_id"],
        firstAppearanceShId: json["first_appearance_sh_id"],
        gender: json["gender"],
        name: json["name"],
        occupation: json["occupation"],
        phrases: List<String>.from(json["phrases"].map((x) => x)),
        portraitPath: json["portrait_path"],
        status: json["status"],
        firstAppearanceEp: FirstAppearance.fromJson(json["first_appearance_ep"]),
        firstAppearanceSh: FirstAppearance.fromJson(json["first_appearance_sh"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "age": age,
        "birthdate": birthdate,
        "description": description,
        "first_appearance_ep_id": firstAppearanceEpId,
        "first_appearance_sh_id": firstAppearanceShId,
        "gender": gender,
        "name": name,
        "occupation": occupation,
        "phrases": List<dynamic>.from(phrases.map((x) => x)),
        "portrait_path": portraitPath,
        "status": status,
        "first_appearance_ep": firstAppearanceEp.toJson(),
        "first_appearance_sh": firstAppearanceSh.toJson(),
    };
}

class FirstAppearance {
    int id;
    DateTime airdate;
    String description;
    int episodeNumber;
    String imagePath;
    String name;
    int season;
    String synopsis;

    FirstAppearance({
        required this.id,
        required this.airdate,
        required this.description,
        required this.episodeNumber,
        required this.imagePath,
        required this.name,
        required this.season,
        required this.synopsis,
    });

    factory FirstAppearance.fromJson(Map<String, dynamic> json) => FirstAppearance(
        id: json["id"],
        airdate: DateTime.parse(json["airdate"]),
        description: json["description"],
        episodeNumber: json["episode_number"],
        imagePath: json["image_path"],
        name: json["name"],
        season: json["season"],
        synopsis: json["synopsis"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "airdate": "${airdate.year.toString().padLeft(4, '0')}-${airdate.month.toString().padLeft(2, '0')}-${airdate.day.toString().padLeft(2, '0')}",
        "description": description,
        "episode_number": episodeNumber,
        "image_path": imagePath,
        "name": name,
        "season": season,
        "synopsis": synopsis,
    };
}
