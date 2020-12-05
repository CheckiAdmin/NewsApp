class StoreData {
//  Acts as a db to store the User selected type

  StoreData._privateConstructor();

  static final StoreData _instance = StoreData._privateConstructor();

  factory StoreData() {
    return _instance;
  }

  bool _viewType;

  void setViewType(bool emailVariables) {
    _viewType = emailVariables;
  }

  bool checkViewType() {
    return _viewType;
  }
}
