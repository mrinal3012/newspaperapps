class NewsTopicName{
  String ? name;
  int ? id;
  NewsTopicName({this.name,this.id});


}
List<NewsTopicName> newslist=[
  NewsTopicName(name: "সর্বশেষ"),
  NewsTopicName(name: "বিশেষ"),
  NewsTopicName(name: "রাজনীতি"),
  NewsTopicName(name: "বিশ্ব"),
  NewsTopicName(name: "বাণিজ্য"),
  NewsTopicName(name: "মতামত"),
  NewsTopicName(name: "খেলা"),
  NewsTopicName(name: "বিনোদন"),
  NewsTopicName(name: "চাকরি"),
  NewsTopicName(name: "জীবনযাপন"),
];

class CityName{
  String ? name;
  String ? img;
  CityName({this.name,this.img});
}
List<CityName> citylist=[
  CityName(name: "Barisal",img: "images/barisal.jpg"),
  CityName(name: "Chittagong",img: "images/chittagong.jpg"),
  CityName(name: "Dhaka",img: "images/dhaka.jpg"),
  CityName(name: "Khulna",img: "images/khulna.jpg"),
  CityName(name: "Mymensingh",img: "images/mymensingh.jpg"),
  CityName(name: "Rajshahi",img: "images/rajshshi.jpg"),
  CityName(name: "Rangpur",img: "images/rangpur.jpg"),
  CityName(name: "Sylhet",img: "images/sylhet.jpg"),

];

class NewsModel {
  String? status;
  int? totalResults;
  List<Articles>? articles;

  NewsModel({this.status, this.totalResults, this.articles});

  NewsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = <Articles>[];
      json['articles'].forEach((v) {
        articles!.add(new Articles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['totalResults'] = this.totalResults;
    if (this.articles != null) {
      data['articles'] = this.articles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Articles {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Articles(
      {this.source,
        this.author,
        this.title,
        this.description,
        this.url,
        this.urlToImage,
        this.publishedAt,
        this.content});

  Articles.fromJson(Map<String, dynamic> json) {
    source =
    json['source'] != null ? new Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.source != null) {
      data['source'] = this.source!.toJson();
    }
    data['author'] = this.author;
    data['title'] = this.title;
    data['description'] = this.description;
    data['url'] = this.url;
    data['urlToImage'] = this.urlToImage;
    data['publishedAt'] = this.publishedAt;
    data['content'] = this.content;
    return data;
  }
}

class Source {
  String? id;
  String? name;

  Source({this.id, this.name});

  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
