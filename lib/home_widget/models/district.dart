// To parse this JSON data, do
//
//     final district = districtFromJson(jsonString);

class District {
  District({this.districtwise});
  List<Top> districtwise;

  District.fromJson(Map<String, dynamic> json) {
    districtwise = new List<Top>();
    json.entries.forEach((ele) {
      // print(ele.key);
      districtwise.add(Top.fromJson(ele.key, ele.value));
      // print(districtwise);
    });
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.districtwise != null) {
      data['districtwise'] = this.districtwise.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Top {
  Top({this.districtData, this.statename});

  List<Dist> districtData;
  String statename;

  Top.fromJson(String key, Map<String, dynamic> json) {
    districtData = new List<Dist>();
    statename = key;
    // print(json['districtData']);
    districtData.add(Dist.fromJson(json['districtData']));
    // print(districtData);
    // print('$statename: $districtData');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.districtData != null) {
      data['districtData'] = this.districtData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Dist {
  Dist({this.distcases});

  List<Distcases> distcases;

  Dist.fromJson(Map<String, dynamic> json) {
    if (json.values != null) {
      distcases = new List<Distcases>();
      json.forEach((k, v) {
        distcases.add(new Distcases.fromJson(k, v));
        // print(distcases);
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.distcases != null) {
      data['distcases'] = this.distcases.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Distcases {
  Distcases({
    this.name,
    this.notes,
    this.confirmed,
    this.deceased,
    this.recovered,
    this.deltadeceased,
    this.deltaconfirmed,
    this.deltarecovered,
    this.active,
  });
  String name;
  int confirmed;
  int deceased;
  int recovered;
  int active;
  int deltaconfirmed;
  int deltarecovered;
  int deltadeceased;
  String notes;

  Distcases.fromJson(String key, Map<String, dynamic> json) {
    name = key;
    notes = json['notes'];
    active = json['active'];
    confirmed = json['confirmed'];
    recovered = json['recovered'];
    deceased = json['deceased'];
    active = json['active'];
    deltaconfirmed = json['delta']['confirmed'];
    deltarecovered = json['delta']['recovered'];
    deltadeceased = json['delta']['deceased'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['confirmed'] = this.confirmed;
    data['deceased'] = this.deceased;
    data['recoverd'] = this.recovered;
    data['notes'] = this.notes;
    data['active'] = this.active;
    data['deltaconfirmed'] = this.deltaconfirmed;
    data['deltarecovered'] = this.deltarecovered;
    data['deltadeceased'] = this.deltadeceased;
    return data;
  }
}
