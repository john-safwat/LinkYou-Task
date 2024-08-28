class Support {
  Support({
      String? url, 
      String? text,}){
    _url = url;
    _text = text;
}

  Support.fromJson(dynamic json) {
    _url = json['url'];
    _text = json['text'];
  }
  String? _url;
  String? _text;

  String? get url => _url;
  String? get text => _text;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = _url;
    map['text'] = _text;
    return map;
  }

}