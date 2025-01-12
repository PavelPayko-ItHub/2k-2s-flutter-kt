import 'package:hive/hive.dart';
part 'score.g.dart';

class CategoriesNewsModel {
  String? status;
  int? num_results;
  List<Articles>? results;

  CategoriesNewsModel({this.status, this.num_results, this.results});

  CategoriesNewsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    num_results = json['num_results'];
    if (json['results'] != null) {
      results = <Articles>[];
      int i = 0;
      json['results'].forEach((v) {
        results!.add(Articles.fromJson(v, i));
        i++;
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['num_results'] = num_results;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

// https://docs.hivedb.dev/#/custom-objects/generate_adapter
@HiveType(typeId: 0)
class Articles {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? section;

  @HiveField(2)
  String? subsection;

  @HiveField(3)
  String? title;

  @HiveField(4)
  String? abstract;

  @HiveField(5)
  String? url;

  @HiveField(6)
  String? uri;

  @HiveField(7)
  String? byline;

  @HiveField(8)
  String? item_type;

  @HiveField(9)
  String? updated_date;

  @HiveField(10)
  String? created_date;

  @HiveField(11)
  String? published_date;

  @HiveField(12)
  String? material_type_facet;

  @HiveField(13)
  String? kicker;

  @HiveField(14)
  List<String>? multimedia;

  Articles(
      {this.id,
      this.section,
      this.subsection,
      this.title,
      this.abstract,
      this.url,
      this.uri,
      this.byline,
      this.item_type,
      this.updated_date,
      this.created_date,
      this.published_date,
      this.material_type_facet,
      this.kicker,
      this.multimedia});

  Articles.clone(Articles other)
      : id = other.id,
        section = other.section,
        subsection = other.subsection,
        title = other.title,
        abstract = other.abstract,
        url = other.url,
        uri = other.uri,
        byline = other.byline,
        item_type = other.item_type,
        updated_date = other.updated_date,
        created_date = other.created_date,
        published_date = other.published_date,
        material_type_facet = other.material_type_facet,
        kicker = other.kicker,
        multimedia = other.multimedia;

  Articles.fromJson(Map<String, dynamic> json, int id_in) {
    id = id_in;
    section = json['section'];
    subsection = json['subsection'];
    title = json['title'];
    abstract = json['abstract'];
    url = json['url'];
    uri = json['uri'];
    byline = json['byline'];
    item_type = json['item_type'];
    updated_date = json['updated_date'];
    created_date = json['created_date'];
    published_date = json['published_date'];
    material_type_facet = json['material_type_facet'];
    kicker = json['kicker'];
    var mtm = json["multimedia"];
    multimedia = [];
    if (mtm != null) {
      for (var i = 0; i < mtm.length; ++i) {
        multimedia!.add(mtm[i]["url"]);
      }
    } else {
      multimedia!.add("#");
    }
    print(id);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['section'] = section;
    data['subsection'] = subsection;
    data['title'] = title;
    data['abstract'] = abstract;
    data['url'] = url;
    data['uri'] = uri;
    data['byline'] = byline;
    data['item_type'] = item_type;
    data['updated_date'] = updated_date;
    data['created_date'] = created_date;
    data['published_date'] = published_date;
    data['material_type_facet'] = material_type_facet;
    data['kicker'] = kicker;
    return data;
  }
}
