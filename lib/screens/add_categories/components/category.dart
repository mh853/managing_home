class Category {
  String _categoryname;
  String _categorydetails;
  String _categorydate;
  String _categorytime;
  String _categorytype;

  Category(this._categoryname, this._categorydetails, this._categorydate,
      this._categorytime, this._categorytype);

  Category.map(dynamic obj) {
    this._categoryname = obj['categoryname'];
    this._categorydetails = obj['categorydetails'];
    this._categorydate = obj['categorydate'];
    this._categorytime = obj['categorytime'];
    this._categorytype = obj['categorytype'];
  }

  String get categoryname => _categoryname;
  String get categorydetails => _categorydetails;
  String get categorydate => _categorydate;
  String get categorytime => _categorytime;
  String get categorytype => _categorytype;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['categoryname'] = _categoryname;
    map['categorydetails'] = _categorydetails;
    map['categorydate'] = _categorydate;
    map['categorytime'] = _categorytime;
    map['categorytype'] = _categorytype;
    return map;
  }

  Category.fromMap(Map<String, dynamic> map) {
    this._categoryname = map['categoryname'];
    this._categorydetails = map['categorydetails'];
    this._categorydate = map['categorydate'];
    this._categorytime = map['categorytime'];
    this._categorytype = map['categorytype'];
  }
}
