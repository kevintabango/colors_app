// To parse this JSON data, do
//
//     final episodesListMode = episodesListModeFromJson(jsonString);

import 'dart:convert';

EpisodesListModel episodesListModeFromJson(String str) =>
    EpisodesListModel.fromJson(json.decode(str));

String episodesListModeToJson(EpisodesListModel data) =>
    json.encode(data.toJson());

class EpisodesListModel {
  int count;
  String? next;
  String? prev;
  int pages;
  List<EpisodeModel> results;

  EpisodesListModel({
    required this.count,
    required this.next,
    required this.prev,
    required this.pages,
    required this.results,
  });

  factory EpisodesListModel.fromJson(Map<String, dynamic> json) =>
      EpisodesListModel(
        count: json["count"],
        next: json["next"],
        prev: json["prev"],
        pages: json["pages"],
        results: List<EpisodeModel>.from(
          json["results"].map((x) => EpisodeModel.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "prev": prev,
    "pages": pages,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class EpisodeModel {
  int id;
  String airdate;
  int episodeNumber;
  String imagePath;
  String name;
  int season;
  String synopsis;

  EpisodeModel({
    required this.id,
    required this.airdate,
    required this.episodeNumber,
    required this.imagePath,
    required this.name,
    required this.season,
    required this.synopsis,
  });

  factory EpisodeModel.fromJson(Map<String, dynamic> json) => EpisodeModel(
    id: json["id"],
    airdate: json["airdate"],
    episodeNumber: json["episode_number"],
    imagePath: json["image_path"],
    name: json["name"],
    season: json["season"],
    synopsis: json["synopsis"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "airdate": airdate,
    "episode_number": episodeNumber,
    "image_path": imagePath,
    "name": name,
    "season": season,
    "synopsis": synopsis,
  };
}
