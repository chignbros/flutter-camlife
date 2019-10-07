import 'package:flutter/foundation.dart';
import 'package:sample_todo/src/models/camlife_info_model.dart';
import 'package:sample_todo/src/services/home_service.dart';

class CamlifeProvider extends ChangeNotifier {
  ApiServices apiServices;

  CamlifeProvider({@required this.apiServices}) {
    getInfo();
  }

  CamlifeInfoModel _infos;
  CamlifeInfoModel get infos => _infos;

  Future getInfo() async {
    _infos = await apiServices.fetchInfo();
    notifyListeners();
  }
}
