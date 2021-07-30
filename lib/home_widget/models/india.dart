import "statewise.dart";

class India {
  List<Statewise> statewise;

  India({this.statewise});

  India.fromJson(Map<String, dynamic> json) {
    if (json['statewise'] != null) {
      statewise = new List<Statewise>();
      json['statewise'].forEach((v) {
        statewise.add(new Statewise.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.statewise != null) {
      data['statewise'] = this.statewise.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
