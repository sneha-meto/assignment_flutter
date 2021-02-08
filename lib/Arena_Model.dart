import 'dart:convert';

List<Arena> allArenasFromJson(String str) {
  final jsonData = json.decode(str);
//  print(jsonData);
  return new List<Arena>.from(jsonData.map((x) => Arena.fromJson(x)));
}

class Arena {
  Arena({
    this.createOn,
    this.updatedOn,
    this.id,
    this.images,
    this.files,
    this.name,
    this.dayOfWeeksOpen,
    this.openTime,
    this.closeTime,
    this.slotTimeSize,
    this.costPerSlot,
    this.active,
    this.establishment,
    this.sports,
  });

  DateTime createOn;
  DateTime updatedOn;
  int id;
  List<String> images;
  dynamic files;
  String name;
  List<DayOfWeeksOpen> dayOfWeeksOpen;
  String openTime;
  String closeTime;
  int slotTimeSize;
  double costPerSlot;
  dynamic active;
  dynamic establishment;
  Sports sports;

  factory Arena.fromRawJson(String str) => Arena.fromJson(json.decode(str));

//  String toRawJson() => json.encode(toJson());

  factory Arena.fromJson(Map<String, dynamic> json) => Arena(
        createOn: DateTime.parse(json["createOn"]),
        updatedOn: DateTime.parse(json["updatedOn"]),
        id: json["id"],
        images: json["images"] == null
            ? null
            : List<String>.from(json["images"].map((x) => x)),
        files: json["files"],
        name: json["name"],
        dayOfWeeksOpen: List<DayOfWeeksOpen>.from(
            json["dayOfWeeksOpen"].map((x) => dayOfWeeksOpenValues.map[x])),
        openTime: json["openTime"],
        closeTime: json["closeTime"],
        slotTimeSize: json["slotTimeSize"],
        costPerSlot: json["costPerSlot"],
        active: json["active"],
        establishment: json["establishment"],
        sports: Sports.fromJson(json["sports"]),
      );
}

enum DayOfWeeksOpen { MON, TUE, WED, THU, FRI, SAT, SUN }

final dayOfWeeksOpenValues = EnumValues({
  "Fri": DayOfWeeksOpen.FRI,
  "Mon": DayOfWeeksOpen.MON,
  "Sat": DayOfWeeksOpen.SAT,
  "Sun": DayOfWeeksOpen.SUN,
  "Thu": DayOfWeeksOpen.THU,
  "Tue": DayOfWeeksOpen.TUE,
  "Wed": DayOfWeeksOpen.WED
});

class Sports {
  Sports({
    this.createOn,
    this.updatedOn,
    this.id,
    this.name,
    this.iconWhiteUrl,
    this.iconBlackUrl,
  });

  dynamic createOn;
  dynamic updatedOn;
  int id;
  Name name;
  String iconWhiteUrl;
  String iconBlackUrl;

  factory Sports.fromRawJson(String str) => Sports.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Sports.fromJson(Map<String, dynamic> json) => Sports(
        createOn: json["createOn"],
        updatedOn: json["updatedOn"],
        id: json["id"],
        name: nameValues.map[json["name"]],
        iconWhiteUrl: json["iconWhiteUrl"],
        iconBlackUrl: json["iconBlackUrl"],
      );

  Map<String, dynamic> toJson() => {
        "createOn": createOn,
        "updatedOn": updatedOn,
        "id": id,
        "name": nameValues.reverse[name],
        "iconWhiteUrl": iconWhiteUrl,
        "iconBlackUrl": iconBlackUrl,
      };
}

enum Name { BASKETBALL, BADMINTON, FOOTBALL }

final nameValues = EnumValues({
  "Badminton": Name.BADMINTON,
  "Basketball": Name.BASKETBALL,
  "Football": Name.FOOTBALL
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
